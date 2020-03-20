local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local RKEffectsUtil = import('/mods/rks_explosions/lua/SDEffectUtilities.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local BlueprintUtil = import('/lua/system/Blueprints.lua')
local BoomSoundBP = import('/mods/rks_explosions/boomsounds/BoomSounds.bp')
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')
local SDExplosions = import('/mods/rks_explosions/lua/SDExplosions.lua')
local Util = import('/lua/utilities.lua')
local GlobalExplosionScaleValueMain = 1
local GlobalExplosionScaleValue = 1 * GlobalExplosionScaleValueMain

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

local oldAirUnit = AirUnit
AirUnit = Class(oldAirUnit) {
    -- Get explosion scale based off Tech number
    GetNumberByTechLvl = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
            return 0.665
        elseif UnitTechLvl == 'TECH2' then
            return 1.125
        elseif UnitTechLvl == 'TECH3' then
            return 1.515
        else
            return 0
        end
    end,

    -- Needed for custom booms
    CreateEffects = function(self, EffectTable, army, scale)
        for k, v in EffectTable do
        if self.RKEmitters == nil then self.RKEmitters = {} end
            local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
            self.Trash:Add(emitter)
        end
    end,

    CreateUnitAirDestructionEffects = function(self, scale)
    end,

    -- Needed for custom booms
    -- Make sure we use factional damage effects
    OnCreate = function(self)
        oldAirUnit.OnCreate(self)
        if self.RKEmitters == nil then
            self.RKEmitters = {}
        end

        local Faction = self:GetFaction()
        local SDFactionalSmallSmoke = SDEffectTemplate['SmallAirUnitSmoke'.. self.TechLevel ..Faction]
        local SDFactionalSmallFire = SDEffectTemplate['SmallAirUnitFire'.. self.TechLevel ..Faction]
        local SDFactionalBigFireSmoke = SDEffectTemplate['BigAirUnitFireSmoke'.. self.TechLevel ..Faction]

        local NFactionalSmallSmoke = NEffectTemplate['SmallAirUnitSmoke'.. self.TechLevel ..Faction]
        local NFactionalSmallFire = NEffectTemplate['SmallAirUnitFire'.. self.TechLevel ..Faction]
        local NFactionalBigFireSmoke = NEffectTemplate['BigAirUnitFireSmoke'.. self.TechLevel ..Faction]

        if toggle == 1 then
            -- Air unit factional-specific damage effects and smoke
            self.FxDamage1 = {SDFactionalSmallSmoke, EffectTemplate.DamageSparks01} -- 75% HP
            self.FxDamage2 = {SDFactionalSmallFire} -- 50% HP
            self.FxDamage3 = {SDFactionalBigFireSmoke} -- 25% HP
            -- Air unit factional-specific damage effects and smoke
        else
            self.FxDamage1 = {NFactionalSmallSmoke, EffectTemplate.DamageSparks01} -- 75% HP
            self.FxDamage2 = {NFactionalSmallFire} -- 50% HP
            self.FxDamage3 = {NFactionalBigFireSmoke} -- 25% HP
        end
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        -- A completed, flying plane expects an OnImpact event due to air crash.
        -- An incomplete unit in the factory still reports as being in layer "Air", so needs this
        -- stupid check.

        -- Additional stupidity: An idle transport, bot loaded and unloaded, counts as 'Land' layer so it would die with the wreck hovering.
        -- It also wouldn't call this code, and hence the cargo destruction. Awful!
        if self:GetFractionComplete() == 1 and (self:GetCurrentLayer() == 'Air' or EntityCategoryContains(categories.TRANSPORTATION, self)) then
            self:ForkThread(SDExplosions.ExplosionAirMidAir(self))
            self:DestroyAllDamageEffects()
            self:DestroyTopSpeedEffects()
            self:DestroyBeamExhaust()
            self.OverKillRatio = overkillRatio
            self:PlayUnitSound('Killed')
            self:DoUnitCallbacks('OnKilled')
            self:DisableShield()

            -- Store our death weapon's damage on the unit so it can be edited remotely by the shield bouncer projectile
            local bp = self:GetBlueprint()
            local i = 1
            for i, numweapons in bp.Weapon do
                if bp.Weapon[i].Label == 'DeathImpact' then
                    self.deathWep = bp.Weapon[i]
                    break
                end
            end

            if not self.deathWep or self.deathWep == {} then
                WARN('An Air unit with no death weapon, or with incorrect label has died!!')
            else
                self.DeathCrashDamage = self.deathWep.Damage
            end

            -- Create a projectile we'll use to interact with Shields
            local proj = self:CreateProjectileAtBone('/projectiles/ShieldCollider/ShieldCollider_proj.bp', 0)
            self.colliderProj = proj
            proj:Start(self, 0)
            self.Trash:Add(proj)

            if self.totalDamageTaken > 0 and not self.veterancyDispersed then
                self:VeterancyDispersal(not instigator or not IsUnit(instigator))
            end
        else
            self.DeathBounce = 1
            MobileUnit.OnKilled(self, instigator, type, overkillRatio)
        end
    end,

    OnImpact = function(self, with)
        if self.GroundImpacted then return end

        -- Immediately destroy units outside the map
        if not ScenarioFramework.IsUnitInPlayableArea(self) then
            self:Destroy()
        end

        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

        -- Only call this code once
        self.GroundImpacted = true

        -- Damage the area we hit. For damage, use the value which may have been adjusted by a shield impact
        if not self.deathWep or not self.DeathCrashDamage then -- Bail if stuff is missing
            WARN('defaultunits.lua OnImpact: did not find a deathWep on the plane! Is the weapon defined in the blueprint? ' .. self:GetUnitId())
        elseif self.DeathCrashDamage > 0 then -- It was completely absorbed by a shield!
            local deathWep = self.deathWep -- Use a local copy for speed and easy reading
            DamageArea(self, self:GetPosition(), deathWep.DamageRadius, self.DeathCrashDamage, deathWep.DamageType, deathWep.DamageFriendly)
        end

        if with == 'Water' then
            for k,v in self.RKEmitters do v:ScaleEmitter(0) end
            self:PlayUnitSound('AirUnitWaterImpact')
            self:ForkThread(SDExplosions.AirImpactWater(self))
            EffectUtil.CreateEffects(self, self.Army, EffectTemplate.DefaultProjectileWaterImpact)
            self.shallSink = true
            self.colliderProj:Destroy()
            self.colliderProj = nil
        else
            self:ForkThread(SDExplosions.ExplosionAirImpact)
        end

        self:DisableUnitIntel('Killed')
        self:DisableIntel('Vision') -- Disable vision seperately, it's not handled in DisableUnitIntel
        self:ForkThread(self.DeathThread, self.OverKillRatio)
    end,
}

local oldSeaUnit = SeaUnit
SeaUnit = Class(oldSeaUnit) {
    -- Get explosion scale based off Tech number
    GetNumberByTechLvlShip = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
            return 1.5665
        elseif UnitTechLvl == 'TECH2' then
            return 1.9
        elseif UnitTechLvl == 'TECH3' then
            return 2.515
        else
            return 6.0
        end
    end,

    -- Get size of unit
    GetSizeOfUnit = function(self)
        local bp = self:GetBlueprint()
        return (math.abs(bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0))
    end,

    -- Needed for the custom booms
    CreateEffects = function(self, EffectTable, army, scale)
        for _, v in EffectTable do
            self.Trash:Add(CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale))
        end
    end,

    --Check if bone is underwater
    IsBoneAboveWater = function(self, boneName)
        local pos = self:GetPosition(boneName)
        if pos[2] > GetSurfaceHeight(pos[1], pos[3]) then
            return true
        end
        return false
    end,

    CreateFactionalExplosionAtBone = function(self, boneName, scale)
        local Faction = self:GetFaction()
        local Number = self:GetNumberByTechLvl(self.TechLevel or 'TECH1')
        local SDFactionalShipSubExplosion = SDEffectTemplate[Faction.. 'ShipSubExpl' ..self.TechLevel]
        local NFactionalShipSubExplosion = NEffectTemplate[Faction.. 'ShipSubExpl' ..self.TechLevel]
        local SDFactionalShipSubExplosionUW = SDEffectTemplate[Faction.. 'ShipSubExpl' ..self.TechLevel.. 'Underwater']
        local NFactionalShipSubExplosionUW = NEffectTemplate[Faction.. 'ShipSubExpl' ..self.TechLevel.. 'Underwater']
        local NumberForShake = (Util.GetRandomFloat(Number, Number + 1))/2.5
        local ScaleForSubBooms = self:GetSubBoomScaleNumber(self.TechLevel or 'TECH1')

        DefaultExplosionsStock.CreateFlash(self, boneName, (Number)/4.75, self.Army)
        self:ShakeCamera(30 * NumberForShake/3, NumberForShake/3, 0, NumberForShake / 3)

        if toggle == 1 then
            if self:IsBoneAboveWater(boneName) then
                RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, SDFactionalShipSubExplosion, ScaleForSubBooms)
            else
                RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, SDFactionalShipSubExplosionUW, ScaleForSubBooms)
            end
        else
            if self:IsBoneAboveWater(boneName) then
                RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, NFactionalShipSubExplosion, ScaleForSubBooms)
            else
                RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, NFactionalShipSubExplosionUW, ScaleForSubBooms)
            end
        end
    end,

    CreateFactionalFinalExplosionAtBone = function(self, boneName, scale)
        local Faction = self:GetFaction()
        local Number = self:GetNumberByTechLvl(self.TechLevel or 'TECH1')
        local SDFactionalShipSubExplosion = SDEffectTemplate[Faction.. 'ShipSubExpl' ..self.TechLevel]
        local NFactionalShipSubExplosion = NEffectTemplate[Faction.. 'ShipSubExpl' ..self.TechLevel]
        local SDFactionalShipSubExplosionUW = SDEffectTemplate[Faction.. 'ShipSubExpl' ..self.TechLevel.. 'Underwater']
        local NFactionalShipSubExplosionUW = NEffectTemplate[Faction.. 'ShipSubExpl' ..self.TechLevel.. 'Underwater']
        local NumberForShake = (Util.GetRandomFloat(Number, Number + 1))/2.5
        local ScaleForSubBooms = self:GetSubBoomScaleNumber(self.TechLevel or 'TECH1')

        DefaultExplosionsStock.CreateFlash(self, boneName, (Number)/4.75*5, self.Army)

        self:ShakeCamera(30 * NumberForShake*4, NumberForShake*4, 0, NumberForShake / 1.375*6)
        
        if toggle == 1 then
			if self:IsBoneAboveWater(boneName) then
				RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, SDFactionalShipSubExplosion, ScaleForSubBooms*2.5)
			else
				RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, SDFactionalShipSubExplosionUW, ScaleForSubBooms*2.5)
			end
		else
			if self:IsBoneAboveWater(boneName) then
				RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, NFactionalShipSubExplosion, ScaleForSubBooms)
			else
				RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, NFactionalShipSubExplosionUW, ScaleForSubBooms)
			end
		end
	end,

    CreateUnitSeaDestructionEffects = function(self, scale)
        local Faction = self:GetFaction()

        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
    end,

    PlaySubBoomSound = function(self, sound)
        local bp = BoomSoundBP.Audio
        if bp and bp[sound] then
            self:PlaySound(bp[sound])
            return true
        end
        return false
    end,

    -- Needed for the custom booms
    -- Make sure we use factional damage effects
    OnCreate = function(self)
        MobileUnit.OnCreate(self)

        local Faction = self:GetFaction()
        local SDFactionalSmallSmoke = SDEffectTemplate['LightNavalUnitDmg'.. self.TechLevel ..Faction]
        local SDFactionalSmallFire = SDEffectTemplate['MediumNavalUnitDmg'.. self.TechLevel ..Faction]
        local SDFactionalBigFireSmoke = SDEffectTemplate['HeavyNavalUnitDmg'.. self.TechLevel ..Faction]

        -- Sea unit factional-specific damage effects and smoke
        self.FxDamage1 = {SDFactionalSmallSmoke} -- 75% HP
        self.FxDamage2 = {SDFactionalSmallFire} -- 50% HP
        self.FxDamage3 = {SDFactionalBigFireSmoke} -- 25% HP
        -- Sea unit factional-specific damage effects and smoke
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        local nrofBones = self:GetBoneCount() -1
        local watchBone = self:GetBlueprint().WatchBone or 0
        local BoomScale = self:GetNumberByTechLvlShip(self.TechLevel or 'TECH1')
        local BoomScale2 = self:GetSizeOfUnit()
        local Number = self:GetNumberByTechLvl(self.TechLevel or 'TECH1')
        local NumberForShake = (Util.GetRandomFloat(Number, Number + 1))
        --LOG(' Oil slick scale multiplier (tech): ', self:GetNumberByTechLvlShip(self.TechLevel or 'TECH1'))
        --LOG(' Oil slick scale multiplier (scale): ', self:GetSizeOfUnit())

        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 0.675)
        if self:GetFractionComplete() == 1 then
            if toggle == 1 then
                self.CreateEffects(self, SDEffectTemplate.OilSlick, self.Army, ((BoomScale)*((BoomScale2)/2)) *GlobalExplosionScaleValue)
            else
                self.CreateEffects(self, NEffectTemplate.OilSlick, self.Army, ((BoomScale)*((BoomScale2)/2)) *GlobalExplosionScaleValue)
            end
        end

        local layer = self:GetCurrentLayer()
        self:CreateUnitSeaDestructionEffects(self, 1.0)

        if (layer == 'Water' or layer == 'Seabed' or layer == 'Sub') then
            self.SinkExplosionThread = self:ForkThread(self.ExplosionThread)
            self.SinkThread = self:ForkThread(self.SinkingThread)
        end

        MobileUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

    GetSizeOfUnitForSubBooms = function(self)
        local bp = self:GetBlueprint()

        --if bp.SizeX < 1 then
        --    bp.SizeX = 1
        --end

        --if bp.SizeY < 1 then
        --    bp.SizeY = 1
        --end

        --if bp.SizeZ < 1 then
        --    bp.SizeZ = 1
        --end
        return (math.abs((bp.SizeX)*(bp.SizeX)) or 0 + ((bp.SizeY)*(bp.SizeY)) or 0 + ((bp.SizeZ)*(bp.SizeZ)) or 0) --For bigger difference between big and small units
    end,

    GetSubBoomExplCount2 = function(self, UnitTechLvl)
        if (UnitTechLvl == 'TECH1') then
            return Util.GetRandomInt(2*1.5, 6*1.5)
        elseif (UnitTechLvl == 'TECH2') then
            return Util.GetRandomInt(3*1.7/1.2, 8*1.7/1.2)
        elseif (UnitTechLvl == 'TECH3') then
            return Util.GetRandomInt(7*2/1.5, 13*2/1.5)
        else
            return 10
        end
    end,

    GetSubBoomScaleNumber = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
            return 0.3
        elseif UnitTechLvl == 'TECH2' then
            return 0.475
        elseif UnitTechLvl == 'TECH3' then
            return 0.775
        else
            return 2
        end
    end,

    GetSubBoomTimingNumber = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
            return 1
        elseif UnitTechLvl == 'TECH2' then
            return 0.8
        elseif UnitTechLvl == 'TECH3' then
            return 0.5
        else
            return 0.2
        end
    end,

    ExplosionThread = function(self) --EXPLOSIONNNNNNNNN
        --Kidding aside, this stock explosion code is scripted very clumsily... It assumes bigger ships have longer sinking animations, and that all animations put the ship below water at the same rate...
        --All of this code will probably need to be rewritten as this offers me too little control. For now, it has just
        --been modified to use factional sub-explosions, and nothing else... But as stated, needs a rewrite soon.

        --local SubExplCountBasedOffSizeMax = (self:GetSizeOfUnitForSubBooms()-self:GetSizeOfUnit()) /1.15
        --local SubExplCountBasedOffSizeMin = (self:GetSizeOfUnitForSubBooms()-(self:GetSizeOfUnit()-4)) /2.15

        --local maxcount = Util.GetRandomInt(SubExplCountBasedOffSizeMin,SubExplCountBasedOffSizeMax)
        local maxcount = self:GetSubBoomExplCount2(self.TechLevel or 'TECH1')
        --LOG(maxcount)

        local i = maxcount -- initializing the above surface counter
        local d = 0 -- delay offset after surface explosions cease
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz
        local numBones = self:GetBoneCount() - 1
        local Faction = self:GetFaction()
        local UnitSize = self:GetSizeOfUnit()

        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        self:PlaySubBoomSound('SubBoomSound'..Faction)
        WaitSeconds(0.1)
        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        self:PlaySubBoomSound('SubBoomSound'..Faction)
        WaitSeconds(0.1)
        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        self:PlaySubBoomSound('SubBoomSound'..Faction)
        WaitSeconds(0.1)
        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        self:PlaySubBoomSound('SubBoomSound'..Faction)
        WaitSeconds(0.1)
        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        self:PlaySubBoomSound('SubBoomSound'..Faction)

        WaitSeconds(2)
        while true do
            if i > 0 then
                local rx, ry, rz = self:GetRandomOffset(1)
                local rs = Random(vol/2, vol*2) / (vol*2)
                local UnitSize = self:GetSizeOfUnit()

                -- Make faction boom
                self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
                self:PlaySubBoomSound('SubBoomSound'..Faction)
            else
                d = d + 1 -- If submerged, increase delay offset
                self:DestroyAllDamageEffects()
            end
            i = i - 1

            if i == 0 then
                self.CreateFactionalFinalExplosionAtBone(self, Util.GetRandomInt(0, 0), UnitSize)
                WaitSeconds(0.2)
                self.CreateFactionalFinalExplosionAtBone(self, Util.GetRandomInt(0, 0), UnitSize)
                self:PlaySubBoomSound('DeathBoomSound'..Faction)
            end

            local rx, ry, rz = self:GetRandomOffset(0.25)
            local rs = Random(vol/2, vol*2) / (vol*2)
            local randBone = Util.GetRandomInt(0, numBones)

            CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(rs)
            CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(rs)

            local rd = math.abs(Util.GetRandomFloat((self:GetSubBoomTimingNumber(self.TechLevel or 'TECH1')) - 0.4, (self:GetSubBoomTimingNumber(self.TechLevel or 'TECH1') + 0.6)))
            --LOG(rd)
            --local rd = Util.GetRandomFloat(0.3, 1)
            WaitSeconds(rd)
        end

        if i == 0 then
            self.CreateFactionalFinalExplosionAtBone(self, Util.GetRandomInt(0, 0), UnitSize)
            WaitSeconds(0.2)
            self.CreateFactionalFinalExplosionAtBone(self, Util.GetRandomInt(0, 0), UnitSize)
            self:PlaySubBoomSound('DeathBoomSound'..Faction)
        end
    end,

   SinkingThread = function(self) -- Well i guess we need to sink too, while exploding... fine with me! :D
        local i = 8 -- Initializing the above surface counter
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz

        WaitSeconds(3)
        while true do
            if i > 0 then
                local rx, ry, rz = self:GetRandomOffset(1)
                local rs = Random(vol/2, vol*2) / (vol*2)
                CreateAttachedEmitter(self,-1,self.Army,'/effects/emitters/destruction_water_sinking_ripples_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)

                local rx, ry, rz = self:GetRandomOffset(1)
                CreateAttachedEmitter(self,self.LeftFrontWakeBone,self.Army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)

                local rx, ry, rz = self:GetRandomOffset(1)
                CreateAttachedEmitter(self,self.RightFrontWakeBone,self.Army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)
            end
            local rx, ry, rz = self:GetRandomOffset(1)
            local rs = Random(vol/2, vol*2) / (vol*2)
            CreateAttachedEmitter(self,-1,self.Army,'/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)

            i = i - 1
            WaitSeconds(2)
        end
    end,
}

AircraftCarrier = Class(SeaUnit, BaseTransport) {
    OnKilled = function(self, instigator, type, overkillRatio)
        self:SaveCargoMass()
        SeaUnit.OnKilled(self, instigator, type, overkillRatio)
        self:DetachCargo()
    end,
}

local oldSubUnit = SubUnit
SubUnit = Class(oldSubUnit) {
    -- Get explosion scale based off Tech number
    GetNumberByTechLvlShip = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
            return 1.5665
        elseif UnitTechLvl == 'TECH2' then
            return 1.9
        elseif UnitTechLvl == 'TECH3' then
            return 2.515
        elseif UnitTechLvl == 'TECH4' then
            return 6.0
        end
    end,

    -- Needed for the custom booms
    CreateEffects = function(self, EffectTable, army, scale)
        for k, v in EffectTable do
            self.Trash:Add(CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale))
        end
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        local Faction = self:GetFaction()
        local Number = self:GetNumberByTechLvl(self.TechLevel or 'TECH4')
        local SDFactionalSubBoomAboveWater = SDEffectTemplate[Faction ..'SubExplosionAboveWater']
        local SDFactionalSubBoomUnderWater = SDEffectTemplate[Faction ..'SubExplosionUnderWater']

        local NFactionalSubBoomAboveWater = NEffectTemplate[Faction ..'SubExplosionAboveWater']
        local NFactionalSubBoomUnderWater = NEffectTemplate[Faction ..'SubExplosionUnderWater']

        local layer = self:GetCurrentLayer()
        self:DestroyIdleEffects()

        if layer == 'Sub' or layer == 'Seabed' then
            if toggle == 1 then
                self.CreateEffects(self, SDFactionalSubBoomUnderWater, self.Army, (Number*GlobalExplosionScaleValue))
            else
                self.CreateEffects(self, NFactionalSubBoomUnderWater, self.Army, (Number*GlobalExplosionScaleValue))
            end
            self.SinkExplosionThread = self:ForkThread(self.ExplosionThread)
            self.SinkThread = self:ForkThread(self.SinkingThread)
            if self:GetFractionComplete() == 1 then
                if toggle == 1 then
                    self.CreateEffects(self, SDEffectTemplate.OilSlick, self.Army, (Number*GlobalExplosionScaleValue))
                else
                    self.CreateEffects(self, NEffectTemplate.OilSlick, self.Army, (Number*GlobalExplosionScaleValue))
                end
            end
        elseif (layer == 'Water') then
            if toggle == 1 then
                self.CreateEffects(self, SDFactionalSubBoomAboveWater, self.Army, (Number*GlobalExplosionScaleValue))
            else
                self.CreateEffects(self, NFactionalSubBoomAboveWater, self.Army, (Number*GlobalExplosionScaleValue))
            end
            self.SinkExplosionThread = self:ForkThread(self.ExplosionThread)
            self.SinkThread = self:ForkThread(self.SinkingThread)
            if self:GetFractionComplete() == 1 then
                if toggle == 1 then
                    self.CreateEffects(self, SDEffectTemplate.OilSlick, self.Army, (Number*GlobalExplosionScaleValue))
                else
                    self.CreateEffects(self, NEffectTemplate.OilSlick, self.Army, (Number*GlobalExplosionScaleValue))
                end
            end
        end
        MobileUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

    ExplosionThread = function(self)
        local maxcount = Random(17,20) -- Max number of above surface explosions. timed to animation
        local d = 0 -- Delay offset after surface explosions cease
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz

        local volmin = 1.5
        local volmax = 15
        local scalemin = 1
        local scalemax = 3
        local t = (vol-volmin)/(volmax-volmin)
        local rs = scalemin + (t * (scalemax-scalemin))
        if rs < scalemin then
            rs = scalemin
        elseif rs > scalemax then
            rs = scalemax
        end

        CreateEmitterAtEntity(self, self.Army ,'/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):ScaleEmitter(rs)
        CreateEmitterAtEntity(self, self.Army ,'/effects/emitters/destruction_underwater_explosion_splash_02_emit.bp'):ScaleEmitter(rs)
        CreateEmitterAtEntity(self, self.Army ,'/effects/emitters/destruction_underwater_explosion_surface_ripples_01_emit.bp'):ScaleEmitter(rs)

        while true do
            local rx, ry, rz = self:GetRandomOffset(1)
            local rs = Random(vol/2, vol*2) / (vol*2)
            CreateEmitterAtEntity(self, self.Army ,'/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):ScaleEmitter(rs):OffsetEmitter(rx, ry, rz)
            CreateEmitterAtEntity(self, self.Army ,'/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):ScaleEmitter(rs):OffsetEmitter(rx, ry, rz)

            d = d + 1 -- Increase delay offset
            local rd = Random(30,70) / 10
            WaitTicks(rd + d)
        end
    end,

    DeathThread = function(self, overkillRatio, instigator)
        -- CreateScaledBoom(self, overkillRatio)
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz
        local numBones = self:GetBoneCount()-1
        self:ForkThread(function()
            local i = 0
            while true do
            local rx, ry, rz = self:GetRandomOffset(0.25)
            local rs = Random(vol/2, vol*2) / (vol*2)
            local randBone = Util.GetRandomInt(0, numBones)

            CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp')
                    :ScaleEmitter(sx)
                    :OffsetEmitter(rx, ry, rz)
            CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp')
                    :ScaleEmitter(sx/2)
                    :OffsetEmitter(rx, ry, rz)
            CreateEmitterAtBone(self, 0, self.Army, '/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp')
                    :ScaleEmitter(sx)
                    :OffsetEmitter(rx, ry, rz)

            local rd = Util.GetRandomFloat(0.4+i, 1.0+i)
            WaitSeconds(rd)
                i = i + 0.3
            end
        end)

        MobileUnit.DeathThread(self, overkillRatio, instigator)
    end,
}

StructureHelperfunctions = Class() {

    -- Get explosion scale based off Tech number
    GetNumberByTechLvlBuilding = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
           return 2
        elseif UnitTechLvl == 'TECH2' then
            return 3
        elseif UnitTechLvl == 'TECH3' then
            return 3.5
        else
            return 6.0
        end
    end,

    -- Get sub-explosion number multiplier based off Tech number
    GetNumberByTechLvlBuilding2 = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
           return 1/6
        elseif UnitTechLvl == 'TECH2' then
            return 3/6
        elseif UnitTechLvl == 'TECH3' then
            return 6/6
        else
            return 6.0
        end
    end,

    -- Get final boom multiplier based off Tech number
    GetNumberTechFinalBoom = function(self)
        if self.TechLevel == 'TECH1' then
           return 1
        elseif self.TechLevel == 'TECH2' then
            return 0.65
        elseif self.TechLevel == 'TECH3' then
            return 0.415
        end
    end,

    -- Get total size of unit
    GetSizeOfBuilding = function(self)
        local bp = self:GetBlueprint()
        return (math.abs(bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0))
    end,

    -- For speeding up Seraphim building explosions, they call the destruction thread twice, so I'm halving the number of explosions.
    GetNumberBasedOffFaction = function(self)
        local Faction = self:GetFaction()
        if Faction == 'seraphim' then
            return 0.65
        else
            return 0.65
        end
    end,

    -- For final boom semi-final scale tweaking, based off faction
    GetFinalBoomMultBasedOffFaction = function(self)
        local Faction = self:GetFaction()
        if Faction == 'seraphim' then
            return 1.25
        elseif Faction == 'cybran' then
            return 1.425
        else
            return 1
        end
    end,

    -- For final boom final scale tweaking, for cyb
    GetFinalBoomMultBasedOffFactionCyb = function(self)
        local Faction = self:GetFaction()
        if ((Faction == 'cybran') and (self.TechLevel == 'TECH3') and (self:GetBlueprint().Categories == 'FACTORY'))  then
            return 1
        else
            return 0.8
        end
    end,

    -- For final boom final scale tweaking, for cyb
    GetFinalBoomMultBasedOffFactionCybT1Fac = function(self)
        local Faction = self:GetFaction()
        if Faction == 'cybran' and self.TechLevel == 'TECH1' then
            return 0.75
        else
            return 1
        end
    end,

    GetMultTechLvl = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
           return 0.695
        elseif UnitTechLvl == 'TECH2' then
            return 1
        elseif UnitTechLvl == 'TECH3' then
            return 1.5
        else
            return 0
        end
    end,

    CreateTimedFactionalStuctureUnitExplosion = function(self)
        local Faction = self:GetFaction()
        local Number = self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1')
        local ExplosionMultiplierTech = self:GetNumberByTechLvlBuilding2(self.TechLevel or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['BuildingExplosion'.. self.TechLevel ..Faction]
        local NumExplFaction = self:GetNumberBasedOffFaction()
        local TECHMULT = self:GetMultTechLvl(self.TechLevel or 'TECH1')

        local numExplosions1 = (self:GetSizeOfBuilding(self) * Util.GetRandomFloat(1, 2.5) * NumExplFaction + Number)
        local numExplosions = (numExplosions1) * TECHMULT

        local x,y,z = self:GetUnitSizes(self)
        --LOG(' Original Sub Boom Count: ', numExplosions1)
        --LOG(' Tech Mult: ',  self:GetMultTechLvl(self.TechLevel or 'TECH1'))
        --LOG(' Sub-explosion number: ', numExplosions)
        for i = 0, numExplosions do
            self.CreateFactionalHitExplosionOffset(self, 1.0, unpack({Util.GetRandomOffset(x,y,z,1.2)}))
            self:PlayUnitSound('DeathExplosion')
            self:ShakeCamera(30*1.65/4, 1*1.65/4, 0, (((Util.GetRandomFloat((0.3*NumExplFaction), (0.6*NumExplFaction)))+0.3) /2))
            WaitSeconds((Util.GetRandomFloat((0.3*NumExplFaction), (0.6*NumExplFaction)))+0.3)
        end
    end,

    CreateFactionalHitExplosionOffset = function(self, scale, xOffset, yOffset, zOffset)
        local Faction = self:GetFaction()
        local Number = self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['BuildingExplosion'.. self.TechLevel ..Faction]
        local NExplosion = NEffectTemplate['BuildingExplosion'.. self.TechLevel ..Faction]

        if self:BeenDestroyed() then
            return
        end

        if toggle == 1 then
            EffectUtil.CreateBoneEffectsOffset(self, -1, self.Army, SDExplosion, xOffset, yOffset, zOffset)
        else
            EffectUtil.CreateBoneEffectsOffset(self, -1, self.Army, NExplosion, xOffset, yOffset, zOffset)
        end
    end,

    CreateFactionalExplosionAtBone = function(self, boneName, scale)
        local Faction = self:GetFaction()
        local Number = self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['BuildingExplosion'.. self.TechLevel ..Faction]
        local NExplosion = NEffectTemplate['BuildingExplosion'.. self.TechLevel ..Faction]

        if toggle == 1 then
            EffectUtil.CreateBoneEffects(self, boneName, self.Army, SDExplosion)-- :ScaleEmitter(scale) --<-- if added, returns an error that "scale" is a nil value...
        else
            EffectUtil.CreateBoneEffects(self, boneName, self.Army, NExplosion)-- :ScaleEmitter(scale) --<-- if added, returns an error that "scale" is a nil value...
        end
    end,
}

--local Unit = import('/lua/sim/Unit.lua').Unit
local oldStructureUnit = StructureUnit
StructureUnit = Class(StructureHelperfunctions, oldStructureUnit) {

    --overrides definition in Unit.lua
     GetUnitSizes = function(self)
         local bp = self:GetBlueprint()
         return (bp.SizeX) or 0, (bp.SizeY-(bp.SizeY/2.20)) or 0, (bp.SizeZ) or 0
     end,

    --overrides definition in Unit.lua
    --Needed for the custom booms
    CreateEffects = function(self, EffectTable, army, scale)
        for k, v in EffectTable do
            self.Trash:Add(CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale))
        end
    end,

    CreateDestructionEffects = function(self, overKillRatio)
        local Faction = self:GetFaction()
        local Number = self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['BuildingExplosion'.. self.TechLevel ..Faction]
        local NExplosion = NEffectTemplate['BuildingExplosion'.. self.TechLevel ..Faction]

        local BoomScale = self:GetSizeOfBuilding() + 0.125
        local BoomScale2 = self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1')
        local BuildingSize = self:GetSizeOfBuilding()
        local NumberForShake = (Util.GetRandomFloat(Number, Number + 1))/0.5/2.5
        local FinalBoomMultiplier = (self:GetSizeOfBuilding()*self:GetNumberTechFinalBoom()*self:GetFinalBoomMultBasedOffFaction()*self:GetFinalBoomMultBasedOffFaction()*self:GetFinalBoomMultBasedOffFactionCybT1Fac()*self:GetFinalBoomMultBasedOffFactionCyb())

        --LOG('Final Boom Tech Mult', self:GetNumberTechFinalBoom())
        --LOG('Final Boom Size Mult', self:GetSizeOfBuilding())
        --LOG('Final Boom Faction Mult', self:GetFinalBoomMultBasedOffFaction())
        --LOG('Final Boom Cyb Mult', self:GetFinalBoomMultBasedOffFactionCyb())
        --LOG('Final Boom Cyb Mult T1', self:GetFinalBoomMultBasedOffFactionCybT1Fac())
        --LOG(' Final boom multiplier: ', (self:GetSizeOfBuilding()*self:GetNumberTechFinalBoom()))

        local GlobalBuildingBoomScaleDivider = 7.5

        if(self:GetSizeOfBuilding(self) < 1.45) then
            if toggle == 1 then
                self.CreateEffects(self, SDExplosion, self.Army, ((BoomScale*(BoomScale2/2)) /GlobalBuildingBoomScaleDivider*3)) --Custom explosion for smaller buildings.
            else
                self.CreateEffects(self, NExplosion, self.Army, ((BoomScale*(BoomScale2/2)) /GlobalBuildingBoomScaleDivider*3)) --Custom explosion for smaller buildings.
            end
        else
           -- LOG(' Building Size: ', self:GetSizeOfBuilding())
           -- LOG(' Building Tech: ', self.TechLevel)
            --LOG(' Global Building Boom Divider: ', 4.5)
            --LOG(' Tech Scale: ', self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1'))
           -- LOG(' Size Scale: ', self:GetSizeOfBuilding())
            self.CreateTimedFactionalStuctureUnitExplosion(self)
            WaitSeconds(0.5)
            DefaultExplosionsStock.CreateFlash(self, -1, Number/3, self.Army)
            if toggle == 1 then
                self.CreateEffects(self, SDExplosion, self.Army, (((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue*self:GetFinalBoomMultBasedOffFactionCyb()*self:GetFinalBoomMultBasedOffFactionCybT1Fac())*1.3)
            else
                self.CreateEffects(self, NExplosion, self.Army, (((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue*self:GetFinalBoomMultBasedOffFactionCyb()*self:GetFinalBoomMultBasedOffFactionCybT1Fac())*1.3*4)
            end

            self:PlayUnitSound('DeathExplosion')
            RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
            WaitSeconds(1.15)
            DefaultExplosionsStock.CreateFlash(self, -1, Number/1.85, self.Army)
            self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.775)
            if toggle == 1 then
                self.CreateEffects(self, SDExplosion, self.Army, ((((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue)*FinalBoomMultiplier))
            else
                self.CreateEffects(self, NExplosion, self.Army, ((((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue)*FinalBoomMultiplier)*2)
            end


            if self.TechLevel == 'TECH1' then
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
            elseif self.TechLevel == 'TECH2' then
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
            elseif self.TechLevel == 'TECH3' then
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
            end
            self:PlayUnitSound('Killed')
            self:PlayUnitSound('Destroyed')
        end
    end,

}

local oldFactoryUnit = FactoryUnit
FactoryUnit = Class(StructureUnit, oldFactoryUnit) {}

-- AIR FACTORY UNITS
AirFactoryUnit = Class(FactoryUnit) {}

-- AIR STAGING PLATFORMS UNITS
local oldAirStagingPlatformUnit = AirStagingPlatformUnit
AirStagingPlatformUnit = Class(StructureUnit, oldAirStagingPlatformUnit) {}

-- ENERGY CREATION UNITS
local oldConcreteStructureUnit = ConcreteStructureUnit
ConcreteStructureUnit = Class(StructureUnit, oldConcreteStructureUnit) {}

-- ENERGY CREATION UNITS
local oldEnergyCreationUnit = EnergyCreationUnit
EnergyCreationUnit = Class(StructureUnit, oldEnergyCreationUnit) {}

-- ENERGY STORAGE UNITS
local oldEnergyStorageUnit = EnergyStorageUnit
EnergyStorageUnit = Class(StructureUnit, oldEnergyStorageUnit) {}

-- LAND FACTORY UNITS
LandFactoryUnit = Class(FactoryUnit) {}

-- MASS COLLECTION UNITS
local oldMassCollectionUnit = MassCollectionUnit
MassCollectionUnit = Class(StructureUnit, oldMassCollectionUnit) {}

-- MASS FABRICATION UNITS
local oldMassFabricationUnit = MassFabricationUnit
MassFabricationUnit = Class(StructureUnit, oldMassFabricationUnit) {}

--  MASS STORAGE UNITS
local oldMassStorageUnit = MassStorageUnit
MassStorageUnit = Class(StructureUnit, oldMassStorageUnit) {}

--  RADAR UNITS
local oldRadarUnit = RadarUnit
RadarUnit = Class(StructureUnit, oldRadarUnit) {}

-- RADAR JAMMER UNITS
local oldRadarJammerUnit = RadarJammerUnit
RadarJammerUnit = Class(StructureUnit, oldRadarJammerUnit) {}

-- SONAR UNITS
local oldSonarUnit = SonarUnit
SonarUnit = Class(StructureUnit, oldSonarUnit) {}

-- SEA FACTORY UNITS
local oldSeaFactoryUnit = SeaFactoryUnit
SeaFactoryUnit = Class(FactoryUnit, oldSeaFactoryUnit) {}

-- SHIELD STRCUTURE UNITS
local oldShieldStructureUnit = ShieldStructureUnit
ShieldStructureUnit = Class(StructureUnit, oldShieldStructureUnit) {}

-- TRANSPORT BEACON UNITS
local oldTransportBeaconUnit = TransportBeaconUnit
TransportBeaconUnit = Class(StructureUnit, oldTransportBeaconUnit) {}

-- WALL STRCUTURE UNITS
local oldWallStructureUnit = WallStructureUnit
WallStructureUnit = Class(StructureUnit, oldWallStructureUnit) {}

-- QUANTUM GATE UNITS
local oldQuantumGateUnit = QuantumGateUnit
QuantumGateUnit = Class(FactoryUnit, oldQuantumGateUnit) {}

