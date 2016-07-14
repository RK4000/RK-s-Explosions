local oldUnit = Unit

-- Includes changes to the fundamental Unit class,
-- in case some type of unit does not have a specifically modified OnKilled to use the
-- factional explosions, this acts as sort of a backup to still spawn them.
-- It is also neccesary because the changes here remove the current generic
-- explosion, since it's replaced by the factional ones.

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle
local Util = import('/lua/utilities.lua')
local SDExplosions = import('/mods/rks_explosions/lua/SDExplosions.lua')

Unit = Class( oldUnit ) {
    CreateEffects = function( self, EffectTable, army, scale)
        for k, v in EffectTable do
        if self.RKEmitters == nil then self.RKEmitters = {} end
            local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
            self.Trash:Add(emitter)
        end
    end,

    GetFaction = function(self)
        return string.lower(self:GetBlueprint().General.FactionName or 'UEF')
    end,

    GetUnitTechLvl = function(self)
        local Categories = self:GetBlueprint().Categories or {}
        local Cats = {'TECH1', 'TECH2', 'TECH3'}
        local UnitTechLvl = 'TECH1'

        for index, Cat in Cats do
            if table.find(Categories, Cat) then
                UnitTechLvl = Cat
                break
            end
        end
        return UnitTechLvl
     end,

     GetUnitLayer = function(self)
        local Categories = self:GetBlueprint().Categories or {}
        local Cats = {'NAVAL', 'LAND', 'AIR', 'STRUCTURE' }

        for index, Cat in Cats do
            if table.find(Categories, Cat) then
                UnitLayer = Cat
                break
            end
        end


        return UnitLayer
     end,

     GetNumberByTechLvl = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
            return 0.425
        elseif UnitTechLvl == 'TECH2' then
            return 0.76/1.075
        elseif UnitTechLvl == 'TECH3' then
            return 1.025/1.175
        else
            return 1
        end
    end,

    CreateDestructionEffects = function( self, overKillRatio )
        local SDModifiedExplosion = import('/mods/rks_explosions/hook/lua/defaultexplosions.lua')
        SDModifiedExplosion.CreateScalableUnitExplosion( self, overKillRatio )
    end,

    GetAnimMultNumberByTechLvl = function(self, UnitTechLvl)
        if UnitTechLvl == 'TECH1' then
        return 2.0
        elseif UnitTechLvl == 'TECH2' then
            return 2.3
        elseif UnitTechLvl == 'TECH3' then
            return 2.875
        else
            return 3.0
        end
    end,

    PlayAnimationThreadShips = function(self, anim, rate)
        local bp = self:GetBlueprint().Display[anim]
        local TechLvl = self:GetUnitTechLvl()
        local AnimMultNumber = self:GetAnimMultNumberByTechLvl(TechLvl or 'TECH1')
        LOG(AnimMultNumber)
        if bp then
            local animBlock = self:ChooseAnimBlock( bp )
            if animBlock.Mesh then
                self:SetMesh(animBlock.Mesh)
            end
            if animBlock.Animation then
                local sinkAnim = CreateAnimator(self)
                self:StopRocking()
                self.DeathAnimManip = sinkAnim
                sinkAnim:PlayAnim(animBlock.Animation)
                rate = rate or 1
                if animBlock.AnimationRateMax and animBlock.AnimationRateMin then
                    rate = Random(animBlock.AnimationRateMin * 10, animBlock.AnimationRateMax * 10) / 10
                end
                sinkAnim:SetRate(rate/AnimMultNumber)
                self.Trash:Add(sinkAnim)
                WaitFor(sinkAnim)
            end
        end
    end,

    OnKilled = function(self, instigator, type, overkillRatio)

        local layer = self:GetCurrentLayer()
        self.Dead = true

        --Units killed while being invisible because they're teleporting should show when they're killed
        if self.TeleportFx_IsInvisible then
            self:ShowBone(0, true)
            self:ShowEnhancementBones()
        end

        if EntityCategoryContains(categories.AIR, self) then
        self:ForkThread(SDExplosions.AirImpactWater)
        else
        self:ForkThread(SDExplosions.ExplosionLand)
        end

        local bp = self:GetBlueprint()
        if layer == 'Water' and bp.Physics.MotionType == 'RULEUMT_Hover' then
            self:PlayUnitSound('HoverKilledOnWater')
        elseif layer == 'Land' and bp.Physics.MotionType == 'RULEUMT_AmphibiousFloating' then
            --Handle ships that can walk on land
            self:PlayUnitSound('AmphibiousFloatingKilledOnLand')
        else
            --self:PlayUnitSound('Killed')
        end

        if self.PlayDeathAnimation and self:GetFractionComplete() > 0.5 then
            self:ForkThread(self.PlayAnimationThread, 'AnimationDeath')
            self.DisallowCollisions = true
        end

        self:DoUnitCallbacks( 'OnKilled' )

        if self.UnitBeingTeleported and not self.UnitBeingTeleported.Dead then
            self.UnitBeingTeleported:Destroy()
            self.UnitBeingTeleported = nil
        end

        -- Notify instigator that you killed me.
        if instigator and IsUnit(instigator) then
            instigator:OnKilledUnit(self)
        end
        if self.DeathWeaponEnabled ~= false then
            self:DoDeathWeapon()
        end
        self:DisableShield()
        self:DisableUnitIntel()
        self:ForkThread(self.DeathThread, overkillRatio , instigator)
    end,

    SinkDestructionEffects = function(self)
        local Util = utilities
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz
        local army = self:GetArmy()
        local numBones = self:GetBoneCount() - 1
        local pos = self:GetPosition()
        local surfaceHeight = GetSurfaceHeight(pos[1], pos[3])
        local i = 0

        while i < 1 do
            local randBone = Util.GetRandomInt( 0, numBones)
            local boneHeight = self:GetPosition(randBone)[2]
            local toSurface = surfaceHeight - boneHeight
            local y = toSurface
            local rx, ry, rz = self:GetRandomOffset(0.3)
            local rs = math.max(math.min(2.5, vol / 20), 0.5)
            local scale = Util.GetRandomFloat(rs/2, rs)

            self:DestroyAllDamageEffects()
            if(toSurface < 1) then
                CreateAttachedEmitter(self, randBone, army,'/effects/emitters/destruction_water_sinking_ripples_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
                CreateAttachedEmitter(self, randBone, army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
            end

            if toSurface < 0 then
                --explosion.CreateDefaultHitExplosionAtBone( self, randBone, scale*1.5)
            else
                local lifetime = Util.GetRandomInt(50, 200)

                if(toSurface > 1) then
                    CreateEmitterAtBone( self, randBone, army, '/effects/emitters/underwater_bubbles_01_emit.bp'):OffsetEmitter(rx, ry, rz)
                        :ScaleEmitter(scale)
                        :SetEmitterParam('LIFETIME', lifetime)

                    CreateAttachedEmitter(self, -1, army, '/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                end
                CreateEmitterAtBone( self, randBone, army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                CreateEmitterAtBone( self, randBone, army, '/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
            end
            local rd = Util.GetRandomFloat( 0.4, 1.0)
            WaitSeconds(i + rd)
            i = i + 0.3
        end
    end,

    StartSinking = function(self, callback)
        local bp = self:GetBlueprint()
        local scale = ((bp.SizeX or 0 + bp.SizeZ or 0) * 0.5)
        local bone = 0

        --Create sinker projectile
        local proj = self:CreateProjectileAtBone('/projectiles/Sinker/Sinker_proj.bp', bone)

        -- Start the sinking after a delay of the given number of seconds, attaching to a given bone
        -- and entity.
        proj:Start(10 * math.max(2, math.min(7, scale)), self, bone, callback)
        self.Trash:Add(proj)
    end,

    DeathThread = function( self, overkillRatio, instigator)
        local layer = self:GetCurrentLayer()
        local isNaval = EntityCategoryContains(categories.NAVAL, self)
        local shallSink = (
            (layer == 'Water' or layer == 'Sub') and  -- In a layer for which sinking is meaningful
            not EntityCategoryContains(categories.FACTORY * categories.STRUCTURE * categories.NAVAL, self)  -- Exclude naval factories
        )
        WaitSeconds(utilities.GetRandomFloat( self.DestructionExplosionWaitDelayMin, self.DestructionExplosionWaitDelayMax) )
        self:DestroyAllDamageEffects()
        self:DestroyTopSpeedEffects()
        self:DestroyIdleEffects()
        self:DestroyBeamExhaust()
        self:DestroyAllBuildEffects()

        -- BOOM!
        if self.PlayDestructionEffects then
            self:CreateDestructionEffects(overkillRatio)
        end

        -- Flying bits of metal and whatnot. More bits for more overkill.
        if self.ShowUnitDestructionDebris and overkillRatio then
            self.CreateUnitDestructionDebris(self, true, true, overkillRatio > 2)
        end

        if shallSink then
            self.DisallowCollisions = true

            -- Bubbles and stuff coming off the sinking wreck.
            self:ForkThread(self.SinkDestructionEffects)

            -- Avoid slightly ugly need to propagate this through callback hell...
            self.overkillRatio = overkillRatio

            if isNaval and self:GetBlueprint().Display.AnimationDeath then
                -- Waits for wreck to hit bottom or end of animation
                self:SeabedWatcher()
            else
                -- A non-naval unit or boat with no sinking animation dying over water needs to sink, but lacks an animation for it. Let's
                -- make one up.

                local this = self
                self:StartSinking(
                    function()
                        this:DestroyUnit(overkillRatio)
                    end
                )

                -- Wait for the sinking callback to actually destroy the unit.
                return
            end
        end

        -- If we're not doing fancy sinking rubbish, just blow the damn thing up.
        --self:ForkThread(SDExplosions.ExplosionLand(self))
        self:DestroyUnit(overkillRatio)
    end,

    --- Called at the end of the destruction thread: create the wreckage and Destroy this unit.
    DestroyUnit = function(self, overkillRatio)
        self:CreateWreckage(overkillRatio or self.overkillRatio)

        -- wait at least 1 tick before destroying unit
        WaitSeconds(math.max(0.1, self.DeathThreadDestructionWaitTime))

        self:Destroy()
    end,


}
