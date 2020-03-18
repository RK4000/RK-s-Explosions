-- Includes changes to the fundamental Unit class,
-- in case some type of unit does not have a specifically modified OnKilled to use the
-- factional explosions, this acts as sort of a backup to still spawn them.
-- It is also neccesary because the changes here remove the current generic
-- explosion, since it's replaced by the factional ones.

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle
local Util = import('/lua/utilities.lua')
local SDExplosions = import('/mods/rks_explosions/lua/SDExplosions.lua')

local oldUnit = Unit
Unit = Class(oldUnit) {
    CreateEffects = function(self, EffectTable, army, scale)
        self.RKEmitters = self.RKEmitters or {}

        for k, v in EffectTable do
            local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
            self.Trash:Add(emitter)
        end
    end,

    GetFaction = function(self)
        return string.lower(self.factionCategory)
    end,

    -- Currently only TECH1 - TECH3 is supported in the code
    GetUnitTechLvl = function(self)
        if self.techCategory and StringStartsWith(self.techCategory, "TECH") then
            return self.techCategory
        else
            return 'TECH1'
        end
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

    CreateDestructionEffects = function(self, overKillRatio)
        local SDModifiedExplosion = import('/mods/rks_explosions/hook/lua/defaultexplosions.lua')
        SDModifiedExplosion.CreateScalableUnitExplosion(self, overKillRatio)
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

        if bp then
            local animBlock = self:ChooseAnimBlock(bp)
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
        if EntityCategoryContains(categories.AIR, self) then
            self:ForkThread(SDExplosions.ExplosionAirImpact)
        else
            self:ForkThread(SDExplosions.ExplosionLand)
        end

        --return oldUnit.OnKilled(self, instigator, type, overkillRatio) not needed, says speed2 :D
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
            local randBone = Util.GetRandomInt(0, numBones)
            local boneHeight = self:GetPosition(randBone)[2]
            local toSurface = surfaceHeight - boneHeight
            local y = toSurface
            local rx, ry, rz = self:GetRandomOffset(0.3)
            local rs = math.max(math.min(2.5, vol / 20), 0.5)
            local scale = Util.GetRandomFloat(rs/2, rs)

            self:DestroyAllDamageEffects()
            if toSurface < 1 then
                CreateAttachedEmitter(self, randBone, army,'/effects/emitters/destruction_water_sinking_ripples_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
                CreateAttachedEmitter(self, randBone, army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
            end

            if toSurface < 0 then
                --explosion.CreateDefaultHitExplosionAtBone(self, randBone, scale*1.5)
            else
                local lifetime = Util.GetRandomInt(50, 200)

                if(toSurface > 1) then
                    CreateEmitterAtBone(self, randBone, army, '/effects/emitters/underwater_bubbles_01_emit.bp'):OffsetEmitter(rx, ry, rz)
                        :ScaleEmitter(scale)
                        :SetEmitterParam('LIFETIME', lifetime)

                    CreateAttachedEmitter(self, -1, army, '/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                end
                CreateEmitterAtBone(self, randBone, army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                CreateEmitterAtBone(self, randBone, army, '/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
            end
            local rd = Util.GetRandomFloat(0.4, 1.0)
            WaitSeconds(i + rd)
            i = i + 0.3
        end
    end,
}
