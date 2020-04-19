local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local BoomSoundBP = import('/mods/rks_explosions/boomsounds/BoomSounds.bp')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')
local SDExplosions = import('/mods/rks_explosions/lua/SDExplosions.lua')
local Util = import('/lua/utilities.lua')
local GlobalExplosionScaleValueMain = 1
local GlobalExplosionScaleValue = 1 * GlobalExplosionScaleValueMain

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

local AirTechLevelMultiplierTbl = {
    ['TECH1'] = 0.665,
    ['TECH2'] = 1.125,
    ['TECH3'] = 1.515,
    -- 0
}

local oldAirUnit = AirUnit
AirUnit = Class(oldAirUnit) {

    GetDebrisNum = function(self, UnitTechLvl)
        if (UnitTechLvl == 'TECH1') then
            return Util.GetRandomInt(0, 1)
        elseif (UnitTechLvl == 'TECH2') then
            return Util.GetRandomInt(0, 2)
        elseif (UnitTechLvl == 'TECH3') then
            return 0
        else
            return 0
        end
    end,
    
    CreateUnitAirDestructionEffects = function(self, scale)
        local FactionalPlaneDebris = ('/mods/rks_explosions/effects/entities/AAAPlane_Debris/PlaneDebris' .. self.factionCategory .. self.TechLevel .. '/PlaneDebris' .. self.factionCategory .. self.TechLevel .. '_proj.bp')
        
        local DebrisNum = self:GetDebrisNum(self.TechLevel or 'TECH3') 
        
        self:DestroyAllDamageEffects()
        SDExplosions.ExplosionAirMidAir(self)
        SDExplosions.CreateInheritedVelocityDebrisProjectiles(self, DebrisNum, {self:GetVelocity()}, 10, 0.23, 50.35, FactionalPlaneDebris)
    end,

    -- Needed for custom booms
    -- Make sure we use factional damage effects
    OnCreate = function(self)
        oldAirUnit.OnCreate(self)

        -- Get explosion scale based off Tech number
        self.TechLevelMultiplier = AirTechLevelMultiplierTbl[self.techCategory] or 1

        local SDFactionalSmallSmoke = SDEffectTemplate['SmallAirUnitSmoke'.. self.TechLevel ..self.factionCategory]
        local SDFactionalSmallFire = SDEffectTemplate['SmallAirUnitFire'.. self.TechLevel ..self.factionCategory]
        local SDFactionalBigFireSmoke = SDEffectTemplate['BigAirUnitFireSmoke'.. self.TechLevel ..self.factionCategory]

        local NFactionalSmallSmoke = NEffectTemplate['SmallAirUnitSmoke'.. self.TechLevel ..self.factionCategory]
        local NFactionalSmallFire = NEffectTemplate['SmallAirUnitFire'.. self.TechLevel ..self.factionCategory]
        local NFactionalBigFireSmoke = NEffectTemplate['BigAirUnitFireSmoke'.. self.TechLevel ..self.factionCategory]

        if toggle == 1 then
            -- Air unit factional-specific damage effects and smoke
            self.FxDamage1 = {SDFactionalSmallSmoke} -- 75% HP
            self.FxDamage2 = {SDFactionalSmallFire} -- 50% HP
            self.FxDamage3 = {SDFactionalBigFireSmoke} -- 25% HP
            -- Air unit factional-specific damage effects and smoke
        else
            self.FxDamage1 = {NFactionalSmallSmoke, EffectTemplate.DamageSparks01} -- 75% HP
            self.FxDamage2 = {NFactionalSmallFire} -- 50% HP
            self.FxDamage3 = {NFactionalBigFireSmoke} -- 25% HP
        end
    end,

    OnImpact = function(self, with)
        oldAirUnit.OnImpact(self, with)
        if with == 'Water' then
            for k,v in self.RKEmitters do v:ScaleEmitter(0) end
            SDExplosions.AirImpactWater(self)
        else
            SDExplosions.ExplosionAirImpact(self)
        end
    end,
}

local oldLandUnit = LandUnit
LandUnit = Class(oldLandUnit) {
    OnCreate = function(self)
        oldLandUnit.OnCreate(self)

        local SDFactionalSmallSmoke = SDEffectTemplate['LightLandUnitDmg'.. self.TechLevel ..self.factionCategory]
        local SDFactionalSmallFire = SDEffectTemplate['MediumLandUnitDmg'.. self.TechLevel ..self.factionCategory]
        local SDFactionalBigFireSmoke = SDEffectTemplate['HeavyLandUnitDmg'.. self.TechLevel ..self.factionCategory]

        -- Land unit factional-specific damage effects and smoke
        self.FxDamage1 = {SDFactionalSmallSmoke} -- 75% HP
        self.FxDamage2 = {SDFactionalSmallFire} -- 50% HP
        self.FxDamage3 = {SDFactionalBigFireSmoke} -- 25% HP
    end,
}

local oldWalkingLandUnit = WalkingLandUnit
WalkingLandUnit = Class(oldWalkingLandUnit) {
    OnCreate = function(self)
        oldWalkingLandUnit.OnCreate(self)

        local SDFactionalSmallSmoke = SDEffectTemplate['LightLandUnitDmg'.. self.TechLevel ..self.factionCategory]
        local SDFactionalSmallFire = SDEffectTemplate['MediumLandUnitDmg'.. self.TechLevel ..self.factionCategory]
        local SDFactionalBigFireSmoke = SDEffectTemplate['HeavyLandUnitDmg'.. self.TechLevel ..self.factionCategory]

        -- Land unit factional-specific damage effects and smoke
        self.FxDamage1 = {SDFactionalSmallSmoke} -- 75% HP
        self.FxDamage2 = {SDFactionalSmallFire} -- 50% HP
        self.FxDamage3 = {SDFactionalBigFireSmoke} -- 25% HP
    end,
}

local ShipTechLevelMultiplierTbl = { -- Multiplier based on tech level, used for oil slicks
    ['TECH1'] = 1.5665,
    ['TECH2'] = 1.9,
    ['TECH3'] = 2.515,
    ['EXPERIMENTAL'] = 3,
}
local oldSeaUnit = SeaUnit
SeaUnit = Class(oldSeaUnit) {

    PlaySubBoomSound = function(self, sound) -- Plays boom sound on small booms for added realism
        local bp = BoomSoundBP.Audio
        if bp and bp[sound] then
            self:PlaySound(bp[sound])
            return true
        end
        return false
    end,
    
    GetSizeOfUnit = function(self) -- Get size of unit
        local bp = self:GetBlueprint()
        return (math.abs(bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0))
    end,
    
    IsBoneAboveWater = function(self, boneName) --Check if bone is underwater
        local pos = self:GetPosition(boneName)
        if pos[2] > GetSurfaceHeight(pos[1], pos[3]) then
            return true
        end
        return false
    end,

    GetSizeOfUnitForSubBooms = function(self)
        local bp = self:GetBlueprint()
        return (math.abs((bp.SizeX)*(bp.SizeX)) or 0 + ((bp.SizeY)*(bp.SizeY)) or 0 + ((bp.SizeZ)*(bp.SizeZ)) or 0) --For bigger difference between big and small units
    end,

    GetSubBoomExplCount = function(self, UnitTechLvl) -- Gives amount of small booms as ships are sinking
        if (UnitTechLvl == 'TECH1') then
            return Util.GetRandomInt(2, 3)
        elseif (UnitTechLvl == 'TECH2') then
            return Util.GetRandomInt(3, 5)
        elseif (UnitTechLvl == 'TECH3') then
            return Util.GetRandomInt(6, 10)
        elseif EntityCategoryContains(categories.EXPERIMENTAL, self)then
            return Util.GetRandomInt(10, 12)
        else
            return Util.GetRandomInt(10, 12)
        end
    end,

    GetSubBoomTimingNumber = function(self, UnitTechLvl) -- Gives timing modified for small booms as ships are sinking
        if UnitTechLvl == 'TECH1' then
            return 0.6
        elseif UnitTechLvl == 'TECH2' then
            return 0.55
        elseif UnitTechLvl == 'TECH3' then
            return 0.5
        elseif EntityCategoryContains(categories.EXPERIMENTAL, self) then
            return 0.375
        else
            return 0.375
        end
    end,
    
    GetSubBoomScaleNumber = function(self, UnitTechLvl) -- Scales small booms as ships are sinking
        if UnitTechLvl == 'TECH1' then
            return 0.3
        elseif UnitTechLvl == 'TECH2' then
            return 0.475
        elseif UnitTechLvl == 'TECH3' then
            return 0.775
        elseif EntityCategoryContains(categories.EXPERIMENTAL, self) then
            return 1
        else
            return 1
        end
    end,
    
    DebrisNumEqualizer = function(self, UnitTechLvl) -- Needed to equalize small boom scale when it is used to determine debris num
        if UnitTechLvl == 'TECH1' then
            return 3.35
        elseif UnitTechLvl == 'TECH2' then
            return 2.11
        elseif UnitTechLvl == 'TECH3' then
            return 1.29
        elseif EntityCategoryContains(categories.EXPERIMENTAL, self) then
            return 1
        else
            return 1
        end
    end,
    
    GetMaxDebrisNum = function(self, UnitTechLvl)   -- Gives maximum debris number per small boom, code in SDExplosions.lua later picks a random number between this and /2 value of this,
        if (UnitTechLvl == 'TECH1') then          -- so in effect this is also minimum debris number.
            return 3
        elseif (UnitTechLvl == 'TECH2') then
            return 8
        elseif (UnitTechLvl == 'TECH3') then
            return 12
        elseif EntityCategoryContains(categories.EXPERIMENTAL, self) then
            return 14
        else
            return 14
        end
    end,
    
    GetDebrisVelocity = function(self, UnitTechLvl) -- Gives max debris velocity 
        if UnitTechLvl == 'TECH1' then
            return 8
        elseif UnitTechLvl == 'TECH2' then
            return 12
        elseif UnitTechLvl == 'TECH3' then
            return 20
        elseif EntityCategoryContains(categories.EXPERIMENTAL, self) then
            return 20
        else
            return 20
        end
    end,
    
    TempestModifier = function(self) --Adjusts oil slick for Tempest
        if EntityCategoryContains(categories.AEON, self) and EntityCategoryContains(categories.EXPERIMENTAL, self) then
            return 0.20
        else
            return 1
        end
    end,
    
    EXPScaleModifierForBooms = function(self)
        if EntityCategoryContains(categories.EXPERIMENTAL, self) then
            return 2.5
        else
            return 1
        end
    end,
    
    CreateFactionalExplosionAtBone = function(self, boneName, scale)
        local SDFactionalShipSubExplosion = SDEffectTemplate['ShipSubExpl' .. self.TechLevel .. self.factionCategory]
        local NFactionalShipSubExplosion = NEffectTemplate['ShipSubExpl' .. self.TechLevel .. self.factionCategory]
        local SDFactionalShipSubExplosionUW = SDEffectTemplate['ShipSubExplUnderwater' .. self.TechLevel .. self.factionCategory]
        local NFactionalShipSubExplosionUW = NEffectTemplate['ShipSubExplUnderwater' .. self.TechLevel .. self.factionCategory]
        
        local NumberForShake = (Util.GetRandomFloat(self.TechLevelMultiplier, self.TechLevelMultiplier + 1 )) / 2.5 / 3
        
        local ExpScaleModifier = self.EXPScaleModifierForBooms(self)
        local ScaleForSubBooms = (self:GetSubBoomScaleNumber(self.TechLevel or 'EXPERIMENTAL')) * ExpScaleModifier
        
        local RandomScaleForSubBooms = (Util.GetRandomFloat(ScaleForSubBooms/2 , ScaleForSubBooms))
        
        local DebrisNumEqualizer = self:DebrisNumEqualizer(self.TechLevel)
        local MaxDebris = self:GetMaxDebrisNum(self.TechLevel or 'EXPERIMENTAL') * RandomScaleForSubBooms * DebrisNumEqualizer * ExpScaleModifier
       
        local InitialVelocity = self:GetDebrisVelocity(self.TechLevel or 'EXPERIMENTAL') 
        local Velocity = InitialVelocity * RandomScaleForSubBooms * DebrisNumEqualizer

        if toggle == 1 then
            if self:IsBoneAboveWater(boneName) then
                RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, SDFactionalShipSubExplosion, RandomScaleForSubBooms)
                SDExplosions.CreateGenericFactionalDebrisOnBone(self, MaxDebris, Velocity, boneName)
                explosion.CreateFlash(self, boneName, (self.TechLevelMultiplier)/2.75*RandomScaleForSubBooms, self.Army)
                self:PlaySubBoomSound('SubBoomSound'..self.factionCategory)
                self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake)
            else
                RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, SDFactionalShipSubExplosionUW, RandomScaleForSubBooms)
                explosion.CreateFlash(self, boneName, (self.TechLevelMultiplier)/1.5*RandomScaleForSubBooms, self.Army)
                self:PlaySubBoomSound('SubBoomSoundUW'..self.factionCategory)
            end
        else
            if self:IsBoneAboveWater(boneName) then
                RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, NFactionalShipSubExplosion, RandomScaleForSubBooms)
                SDExplosions.CreateGenericFactionalDebrisOnBone(self, MaxDebris, Velocity, boneName)
                explosion.CreateFlash(self, boneName, (self.TechLevelMultiplier)/2.75*RandomScaleForSubBooms, self.Army)
                self:PlaySubBoomSound('SubBoomSound'..self.factionCategory)
                self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake)                
            else
                RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, NFactionalShipSubExplosionUW, RandomScaleForSubBooms)
                explosion.CreateFlash(self, boneName, (self.TechLevelMultiplier)/1.5*RandomScaleForSubBooms, self.Army)
                self:PlaySubBoomSound('SubBoomSoundUW'..self.factionCategory)
            end
        end
    end,

    CreateFactionalFinalExplosionAtBone = function(self, boneName, scale)
        local SDFactionalShipSubExplosion = SDEffectTemplate['ShipSubExpl' .. self.TechLevel .. self.factionCategory]
        local NFactionalShipSubExplosion = NEffectTemplate['ShipSubExpl' .. self.TechLevel .. self.factionCategory]
        local SDFactionalShipSubExplosionUW = SDEffectTemplate['ShipSubExplUnderwater' .. self.TechLevel .. self.factionCategory]
        local NFactionalShipSubExplosionUW = NEffectTemplate['ShipSubExplUnderwater' .. self.TechLevel .. self.factionCategory]
        
        local NumberForShake = (Util.GetRandomFloat(self.TechLevelMultiplier, self.TechLevelMultiplier + 1))*1.5
        
        local ExpScaleModifier = self.EXPScaleModifierForBooms(self)
        local ScaleForSubBooms = (self:GetSubBoomScaleNumber(self.TechLevel or 'EXPERIMENTAL')) * ExpScaleModifier
        
        local RandomScaleForSubBooms = (Util.GetRandomFloat(ScaleForSubBooms/2 , ScaleForSubBooms))
        
        local DebrisNumEqualizer = self:DebrisNumEqualizer(self.TechLevel)
        local MaxDebris = self:GetMaxDebrisNum(self.TechLevel or 'EXPERIMENTAL')
        
        local InitialVelocity = self:GetDebrisVelocity(self.TechLevel or 'EXPERIMENTAL') 
        local Velocity = InitialVelocity * RandomScaleForSubBooms * DebrisNumEqualizer * ExpScaleModifier
        
        if toggle == 1 then
			if self:IsBoneAboveWater(boneName) then
				RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, SDFactionalShipSubExplosion, RandomScaleForSubBooms*2.5)
                SDExplosions.CreateGenericFactionalDebrisOnBone(self, MaxDebris*2.5, Velocity*1.5, boneName)
                explosion.CreateFlash(self, boneName, (self.TechLevelMultiplier), self.Army)
                self:PlaySubBoomSound('DeathBoomSound'..self.factionCategory)
                self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake)
			else
				RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, SDFactionalShipSubExplosionUW, RandomScaleForSubBooms*1.5)
                explosion.CreateFlash(self, boneName, (self.TechLevelMultiplier)*1.25, self.Army)
                self:PlaySubBoomSound('DeathBoomSoundUW'..self.factionCategory)
			end
		else
			if self:IsBoneAboveWater(boneName) then
				RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, NFactionalShipSubExplosion, RandomScaleForSubBooms*2.5)
                SDExplosions.CreateGenericFactionalDebrisOnBone(self, MaxDebris*2.5, Velocity*1.5, boneName)
                explosion.CreateFlash(self, boneName, (self.TechLevelMultiplier), self.Army)
                self:PlaySubBoomSound('DeathBoomSound'..self.factionCategory)
                self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake)
			else
				RKEffectUtil.CreateBoneEffectsScaled(self, boneName, self.Army, NFactionalShipSubExplosionUW, RandomScaleForSubBooms)
                explosion.CreateFlash(self, boneName, (self.TechLevelMultiplier)*1.25, self.Army)
                self:PlaySubBoomSound('DeathBoomSoundUW'..self.factionCategory)
			end
		end
	end,

    -- Make sure we use factional damage effects
    OnCreate = function(self)
        oldSeaUnit.OnCreate(self)

        -- Get explosion scale based off Tech number
        self.ShipTechLevelMultiplier = ShipTechLevelMultiplierTbl[self.techCategory] or 6.0

        local SDFactionalSmallSmoke = SDEffectTemplate['LightNavalUnitDmg'.. self.TechLevel ..self.factionCategory]
        local SDFactionalSmallFire = SDEffectTemplate['MediumNavalUnitDmg'.. self.TechLevel ..self.factionCategory]
        local SDFactionalBigFireSmoke = SDEffectTemplate['HeavyNavalUnitDmg'.. self.TechLevel ..self.factionCategory]

        self.FxDamage1 = {SDFactionalSmallSmoke} -- 75% HP
        self.FxDamage2 = {SDFactionalSmallFire} -- 50% HP
        self.FxDamage3 = {SDFactionalBigFireSmoke} -- 25% HP
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        local BoomScale2 = self:GetSizeOfUnit()
        local NumberForShake = (Util.GetRandomFloat(self.TechLevelMultiplier, self.TechLevelMultiplier + 1))
        local TempestModifier = self.TempestModifier(self)
        local ExpScaleModifier = self.EXPScaleModifierForBooms(self)

        if self:GetFractionComplete() == 1 then
            if toggle == 1 then
                self:CreateEffects(SDEffectTemplate.OilSlick, self.Army, ((self.ShipTechLevelMultiplier)*((BoomScale2)/2)) *GlobalExplosionScaleValue *TempestModifier)
            else
                self:CreateEffects(NEffectTemplate.OilSlick, self.Army, ((self.ShipTechLevelMultiplier)*((BoomScale2)/2)) *GlobalExplosionScaleValue *TempestModifier)
            end
        end

        local layer = self:GetCurrentLayer()

        if (layer == 'Water' or layer == 'Seabed' or layer == 'Sub') then
            self.SinkExplosionThread = self:ForkThread(self.ExplosionThread)
            self.SinkThread = self:ForkThread(self.SinkingThread)
        end

        MobileUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

    ExplosionThread = function(self) 
        local ExpScaleModifier = self.EXPScaleModifierForBooms(self)

        local maxcount = self:GetSubBoomExplCount(self.TechLevel or 'EXPERIMENTAL') * ExpScaleModifier
        
        local TempestModifier = self.TempestModifier(self) 
        
        local i = maxcount -- Amount of small booms as ship is sinking
        local d = 0 -- delay offset for small booms
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz
        local numBones = self:GetBoneCount() - 1
        local UnitSize = self:GetSizeOfUnit()

        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        WaitSeconds(Util.GetRandomFloat(0.2,0.4))
        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        WaitSeconds(Util.GetRandomFloat(0.2,0.4))
        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        WaitSeconds(Util.GetRandomFloat(0.2,0.4))
        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        WaitSeconds(Util.GetRandomFloat(0.2,0.4))
        self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)

        WaitSeconds(Util.GetRandomFloat(0.5,1))
        while true do
            if i > 0 then
                self.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
            else
                d = d + 1 -- If submerged, increase delay offset
                self:DestroyAllDamageEffects()
            end
            i = i - 1

            if i == 0 then
                self.CreateFactionalFinalExplosionAtBone(self, 0, UnitSize)
                WaitSeconds(Util.GetRandomFloat(0.2,0.4))
                self.CreateFactionalFinalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
                WaitSeconds(Util.GetRandomFloat(0.2,0.4))
                self.CreateFactionalFinalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
            end

            local rx, ry, rz = self:GetRandomOffset(0.25)
            local rs = (Random(vol/2, vol*2) / (vol*2)) *TempestModifier
            local randBone = Util.GetRandomInt(0, numBones)

            CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(rs)
            CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(rs)

            local rd = math.abs(Util.GetRandomFloat((self:GetSubBoomTimingNumber(self.TechLevel or 'EXPERIMENTAL')) / 1.5, (self:GetSubBoomTimingNumber(self.TechLevel or 'EXPERIMENTAL') * 1.5))) /ExpScaleModifier
            WaitSeconds(rd)
        end

        if i == 0 then
            self.CreateFactionalFinalExplosionAtBone(self, 0, UnitSize)
            WaitSeconds(Util.GetRandomFloat(0.2,0.4))
            self.CreateFactionalFinalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
            WaitSeconds(Util.GetRandomFloat(0.2,0.4))
            self.CreateFactionalFinalExplosionAtBone(self, Util.GetRandomInt(0, numBones), UnitSize)
        end
    end,

   SinkingThread = function(self) -- Well i guess we need to sink too, while exploding... fine with me! :D
        local i = 8 -- Initializing the above surface counter
        local vol = self:GetUnitVolume()
        local TempestModifier = self.TempestModifier(self) 

        WaitSeconds(3)
        while true do
            if i > 0 then
                local rx, ry, rz = self:GetRandomOffset(1)
                local rs = Random(vol/2, vol*2) / (vol*2) *TempestModifier
                CreateAttachedEmitter(self,-1,self.Army,'/effects/emitters/destruction_water_sinking_ripples_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)

                local rx, ry, rz = self:GetRandomOffset(1)
                CreateAttachedEmitter(self,self.LeftFrontWakeBone,self.Army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)

                local rx, ry, rz = self:GetRandomOffset(1)
                CreateAttachedEmitter(self,self.RightFrontWakeBone,self.Army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)
            end
            local rx, ry, rz = self:GetRandomOffset(1)
            local rs = Random(vol/2, vol*2) / (vol*2) *TempestModifier
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
    TempestModifier = function(self) --Adjusts oil slick for Tempest
        if EntityCategoryContains(categories.AEON, self) and EntityCategoryContains(categories.EXPERIMENTAL, self) then
            return 0.20
        else
            return 1
        end
    end,
    
    OnKilled = function(self, instigator, type, overkillRatio)
        local SDFactionalSubBoomAboveWater = SDEffectTemplate['SubExplosionAboveWater' .. self.factionCategory]
        local SDFactionalSubBoomUnderWater = SDEffectTemplate['SubExplosionUnderWater' .. self.factionCategory]

        local NFactionalSubBoomAboveWater = NEffectTemplate['SubExplosionAboveWater' .. self.factionCategory]
        local NFactionalSubBoomUnderWater = NEffectTemplate['SubExplosionUnderWater' .. self.factionCategory]

        self:DestroyIdleEffects()

        -- Different boom effect for above and under water
        local layer = self:GetCurrentLayer()
        if layer == 'Water' then
            if toggle == 1 then
                self:CreateEffects(SDFactionalSubBoomAboveWater, self.Army, (self.TechLevelMultiplier*GlobalExplosionScaleValue))
            else
                self:CreateEffects(NFactionalSubBoomAboveWater, self.Army, (self.TechLevelMultiplier*GlobalExplosionScaleValue))
            end
        else
            if toggle == 1 then
                self:CreateEffects(SDFactionalSubBoomUnderWater, self.Army, (self.TechLevelMultiplier*GlobalExplosionScaleValue))
            else
                self:CreateEffects(NFactionalSubBoomUnderWater, self.Army, (self.TechLevelMultiplier*GlobalExplosionScaleValue))
            end
        end
        -- Create Oil Slick if the unit is complete
        if self:GetFractionComplete() == 1 then
            if toggle == 1 then
                self:CreateEffects(SDEffectTemplate.OilSlick, self.Army, (self.TechLevelMultiplier*GlobalExplosionScaleValue))
            else
                self:CreateEffects(NEffectTemplate.OilSlick, self.Army, (self.TechLevelMultiplier*GlobalExplosionScaleValue))
            end
        end
        self.SinkExplosionThread = self:ForkThread(self.ExplosionThread)
        self.SinkThread = self:ForkThread(self.SinkingThread)

        oldSubUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

    ExplosionThread = function(self)
        local TempestModifier = self.TempestModifier(self) 
        local d = 0 -- Delay offset after surface explosions cease
        local vol = self:GetUnitVolume()

        local volmin = 1.5
        local volmax = 15
        local scalemin = 1
        local scalemax = 3
        local t = (vol-volmin)/(volmax-volmin)
        local rs = scalemin + (t * (scalemax-scalemin)) * TempestModifier
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
            local rs = Random(vol/2, vol*2) / (vol*2) * TempestModifier
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

        oldSubUnit.DeathThread(self, overkillRatio, instigator)
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
        if self.factionCategory == 'SERAPHIM' then
            return 0.65
        else
            return 0.65
        end
    end,

    -- For final boom semi-final scale tweaking, based off faction
    GetFinalBoomMultBasedOffFaction = function(self)
        if self.factionCategory == 'SERAPHIM' then
            return 1.25
        elseif self.factionCategory == 'CYBRAN' then
            return 1.425
        else
            return 1
        end
    end,

    -- For final boom final scale tweaking, for cyb
    GetFinalBoomMultBasedOffFactionCyb = function(self)
        if self.factionCategory == 'CYBRAN' and self.TechLevel == 'TECH3' and self:GetBlueprint().Categories == 'FACTORY' then
            return 1
        else
            return 0.8
        end
    end,

    -- For final boom final scale tweaking, for cyb
    GetFinalBoomMultBasedOffFactionCybT1Fac = function(self)
        if self.factionCategory == 'CYBRAN' and self.TechLevel == 'TECH1' then
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

    CreateTimedFactionalStuctureUnitExplosions = function(self)
        local Number = self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1')
        local NumExplFaction = self:GetNumberBasedOffFaction()
        local TECHMULT = self:GetMultTechLvl(self.TechLevel or 'TECH1')

        local numExplosions1 = (self:GetSizeOfBuilding(self) * Util.GetRandomFloat(1, 2.5) * NumExplFaction + Number)
        local numExplosions = Util.GetRandomInt(3, 6) --(numExplosions1) * TECHMULT 

        local x,y,z = self:GetUnitSizes(self)
        
        for i = 0, numExplosions do
            self.CreateFactionalHitExplosionOffset(self, 1.0, unpack({Util.GetRandomOffset(x,y,z,1.2)}))
            self:PlayUnitSound('DeathExplosion')
            self:ShakeCamera(30*1.65/4, 1*1.65/4, 0, (((Util.GetRandomFloat((0.3*NumExplFaction), (0.6*NumExplFaction)))+0.3) /2))
            WaitSeconds(Util.GetRandomFloat(0.2,0.5))
        end
    end,

    CreateFactionalHitExplosionOffset = function(self, scale, xOffset, yOffset, zOffset)
        local SDExplosion = SDEffectTemplate['BuildingExplosion'.. self.TechLevel ..self.factionCategory]
        local NExplosion = NEffectTemplate['BuildingExplosion'.. self.TechLevel ..self.factionCategory]
        
        local scale = Util.GetRandomFloat(0.5, 1.0)

        if self:BeenDestroyed() then
            return
        end

        if toggle == 1 then
            SDExplosions.CreateGenericFactionalDebrisOnBoneWithOffsetBuilding(self, Util.GetRandomInt(0, 2), Util.GetRandomFloat(7, 14), 0, xOffset, yOffset, zOffset)
            RKEffectUtil.CreateScaledBoneEffectsOffset(self, -1, self.Army, SDExplosion, xOffset, yOffset, zOffset, scale)
        else
            SDExplosions.CreateGenericFactionalDebrisOnBoneWithOffsetBuilding(self, Util.GetRandomInt(0, 2), Util.GetRandomFloat(7, 14), 0, xOffset, yOffset, zOffset)
            RKEffectUtil.CreateScaledBoneEffectsOffset(self, -1, self.Army, NExplosion, xOffset, yOffset, zOffset, scale)
        end
    end,

    CreateFactionalExplosionAtBone = function(self, boneName, scale)
        local SDExplosion = SDEffectTemplate['BuildingExplosion'.. self.TechLevel ..self.factionCategory]
        local NExplosion = NEffectTemplate['BuildingExplosion'.. self.TechLevel ..self.factionCategory]

        if toggle == 1 then
            EffectUtil.CreateBoneEffects(self, boneName, self.Army, SDExplosion)
        else
            EffectUtil.CreateBoneEffects(self, boneName, self.Army, NExplosion)
        end
    end,
}

local oldStructureUnit = StructureUnit
StructureUnit = Class(StructureHelperfunctions, oldStructureUnit) {

    --overrides definition in Unit.lua
     GetUnitSizes = function(self)
         local bp = self:GetBlueprint()
         return (bp.SizeX) or 0, (bp.SizeY-(bp.SizeY/2.20)) or 0, (bp.SizeZ) or 0
     end,

    CreateDestructionEffects = function(self, overKillRatio)
        local Number = self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1')
        local SDExplosion = SDEffectTemplate['BuildingExplosion'.. self.TechLevel ..self.factionCategory]
        local NExplosion = NEffectTemplate['BuildingExplosion'.. self.TechLevel ..self.factionCategory]

        local BoomScale = self:GetSizeOfBuilding() + 0.125
        local BoomScale2 = self:GetNumberByTechLvlBuilding(self.TechLevel or 'TECH1')
        local BuildingSize = self:GetSizeOfBuilding()
        local NumberForShake = (Util.GetRandomFloat(Number, Number + 1))/0.5/2.5
        local FinalBoomMultiplier = (self:GetSizeOfBuilding()*self:GetNumberTechFinalBoom()*self:GetFinalBoomMultBasedOffFaction()*self:GetFinalBoomMultBasedOffFaction()*self:GetFinalBoomMultBasedOffFactionCybT1Fac()*self:GetFinalBoomMultBasedOffFactionCyb())

        local GlobalBuildingBoomScaleDivider = 7.5

        if(self:GetSizeOfBuilding(self) < 1.5) then
            if toggle == 1 then
                self:CreateEffects(SDExplosion, self.Army, ((BoomScale*(BoomScale2/2)) /GlobalBuildingBoomScaleDivider*3)) --Custom explosion for smaller buildings.
            else
                self:CreateEffects(NExplosion, self.Army, ((BoomScale*(BoomScale2/2)) /GlobalBuildingBoomScaleDivider*3)) --Custom explosion for smaller buildings.
            end
        else
        
            self.CreateTimedFactionalStuctureUnitExplosions(self)
            WaitSeconds(Util.GetRandomFloat(0, 0.5))
            
            explosion.CreateFlash(self, -1, Number/3, self.Army)
            if toggle == 1 then
                RKEffectUtil.CreateScaledBoneEffectsOffset(self, -1, self.Army, SDExplosion, 0, 0.35, 0, (((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue*self:GetFinalBoomMultBasedOffFactionCyb()*self:GetFinalBoomMultBasedOffFactionCybT1Fac())*1.3)
            else
                RKEffectUtil.CreateScaledBoneEffectsOffset(self, -1, self.Army, NExplosion, 0, 0.35, 0, (((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue*self:GetFinalBoomMultBasedOffFactionCyb()*self:GetFinalBoomMultBasedOffFactionCybT1Fac())*1.3*4)
            end
            
            SDExplosions.CreateGenericFactionalDebrisOnBone(self, Util.GetRandomInt(6,10), Util.GetRandomFloat(9,15), 0)
            self:PlayUnitSound('DeathExplosion')
            WaitSeconds(Util.GetRandomFloat(0.5, 1.5))
            
            explosion.CreateFlash(self, -1, Number/1.85, self.Army)
            self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.775)
            
            if toggle == 1 then
                RKEffectUtil.CreateScaledBoneEffectsOffset(self, -1, self.Army, SDExplosion, 0, 0.75, 0, ((((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue)*FinalBoomMultiplier))
            else
                RKEffectUtil.CreateScaledBoneEffectsOffset(self, -1, self.Army, NExplosion, 0, 0.75, 0, ((((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue)*FinalBoomMultiplier)*2)
            end

            if self.TechLevel == 'TECH1' then
                SDExplosions.CreateGenericFactionalDebrisOnBone(self, Util.GetRandomInt(3, 5), Util.GetRandomFloat(10,15), 0)
            elseif self.TechLevel == 'TECH2' then
                SDExplosions.CreateGenericFactionalDebrisOnBone(self, Util.GetRandomInt(4, 6), Util.GetRandomFloat(12,17), 0)
            elseif self.TechLevel == 'TECH3' then
                SDExplosions.CreateGenericFactionalDebrisOnBone(self, Util.GetRandomInt(5, 10), Util.GetRandomFloat(15,20), 0)
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

