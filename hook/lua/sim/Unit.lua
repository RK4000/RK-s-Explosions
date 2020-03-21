-- Includes changes to the fundamental Unit class,
-- in case some type of unit does not have a specifically modified OnKilled to use the
-- factional explosions, this acts as sort of a backup to still spawn them.
-- It is also neccesary because the changes here remove the current generic
-- explosion, since it's replaced by the factional ones.

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle
local Util = import('/lua/utilities.lua')
local SDExplosions = import('/mods/rks_explosions/lua/SDExplosions.lua')

local AnimationMultiplierTbl = {
    ['TECH1'] = 2.0,
    ['TECH2'] = 2.3,
    ['TECH3'] = 2.875,
    -- 3
}

local TechLevelMultiplierTbl = {
    ['TECH1'] = 0.425,
    ['TECH2'] = 0.707,
    ['TECH3'] = 0.872,
    -- 1
}

local oldUnit = Unit
Unit = Class(oldUnit) {
    RKEmitters = {},

    OnCreate = function (self)
        oldUnit.OnCreate(self)

        -- Save commonly used variables
        self.AnimationMultiplier = AnimationMultiplierTbl[self.techCategory] or 3
        self.TechLevelMultiplier = TechLevelMultiplierTbl[self.techCategory] or 1

        -- Currently only TECH1 - TECH3 is supported in the code
        if self.TechLevel and StringStartsWith(self.techCategory, "TECH") then
            self.TechLevel = self.techCategory
        else
            self.TechLevel = 'TECH1'
        end
    end,

    CreateEffects = function(self, EffectTable, army, scale)
        for k, v in EffectTable do
            local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
            self.Trash:Add(emitter)
        end
    end,

    GetFaction = function(self)
        return string.lower(self.factionCategory)
    end,

    CreateDestructionEffects = function(self, overKillRatio)
        local SDModifiedExplosion = import('/mods/rks_explosions/hook/lua/defaultexplosions.lua')
        SDModifiedExplosion.CreateScalableUnitExplosion(self, overKillRatio)
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        if EntityCategoryContains(categories.AIR, self) then
            self:ForkThread(SDExplosions.ExplosionAirImpact)
        else
            self:ForkThread(SDExplosions.ExplosionLand)
        end

        oldUnit.OnKilled(self, instigator, type, overkillRatio) 
    end,

    SinkDestructionEffects = function(self)
        local Util = utilities
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz
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
                CreateAttachedEmitter(self, randBone, self.Army,'/effects/emitters/destruction_water_sinking_ripples_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
                CreateAttachedEmitter(self, randBone, self.Army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
            end

            if toSurface < 0 then
                --explosion.CreateDefaultHitExplosionAtBone(self, randBone, scale*1.5)
            else
                local lifetime = Util.GetRandomInt(50, 200)

                if(toSurface > 1) then
                    CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/underwater_bubbles_01_emit.bp'):OffsetEmitter(rx, ry, rz)
                        :ScaleEmitter(scale)
                        :SetEmitterParam('LIFETIME', lifetime)

                    CreateAttachedEmitter(self, -1, self.Army, '/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                end
                CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
            end
            local rd = Util.GetRandomFloat(0.4, 1.0)
            WaitSeconds(i + rd)
            i = i + 0.3
        end
    end,
}
