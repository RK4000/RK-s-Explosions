-- Includes changes to the fundamental Unit class,
-- in case some type of unit does not have a specifically modified OnKilled to use the
-- factional explosions, this acts as sort of a backup to still spawn them.
-- It is also neccesary because the changes here remove the current generic
-- explosion, since it's replaced by the factional ones.

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle
local SDModifiedExplosion = import('/mods/rks_explosions/hook/lua/defaultexplosions.lua')
local SDExplosions = import('/mods/rks_explosions/lua/SDExplosions.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

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
        self.TechLevelMultiplier = TechLevelMultiplierTbl[self.techCategory] or 1

        -- Currently only TECH1 - TECH3 is supported in the code
        if self.techCategory and StringStartsWith(self.techCategory, "TECH") then
            self.TechLevel = self.techCategory
        else
            self.TechLevel = 'TECH1'
        end
        
        if EntityCategoryContains(categories.STRUCTURE, self) then
            local SDFactionalSmallSmoke = SDEffectTemplate['LightStructureUnitDmg'.. self.TechLevel ..self.factionCategory]
            local SDFactionalSmallFire = SDEffectTemplate['MediumStructureUnitDmg'.. self.TechLevel ..self.factionCategory]
            local SDFactionalBigFireSmoke = SDEffectTemplate['HeavyStructureUnitDmg'.. self.TechLevel ..self.factionCategory]

            -- Structure unit factional-specific damage effects and smoke
            self.FxDamage1 = {SDFactionalSmallSmoke} -- 75% HP
            self.FxDamage2 = {SDFactionalSmallFire} -- 50% HP
            self.FxDamage3 = {SDFactionalBigFireSmoke} -- 25% HP
        end
    end,

    CreateEffects = function(self, EffectTable, army, scale)
        for k, v in EffectTable do
            local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
            self.Trash:Add(emitter)
        end
    end,

    GetUnitVolume = function(self)
        local x, y, z = self:GetUnitSizes()
        return x * y * z
    end,

    CreateDestructionEffects = function(self, overKillRatio)
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
        local vol = self:GetUnitVolume()
        local numBones = self:GetBoneCount() - 1
        local pos = self:GetPosition()
        local surfaceHeight = GetSurfaceHeight(pos[1], pos[3])
        local i = 0

        while i < 1 do
            local randBone = utilities.GetRandomInt(0, numBones)
            local boneHeight = self:GetPosition(randBone)[2]
            local toSurface = surfaceHeight - boneHeight
            local y = toSurface
            local rx, ry, rz = self:GetRandomOffset(0.3)
            local rs = math.max(math.min(2.5, vol / 20), 0.5)
            local scale = utilities.GetRandomFloat(rs/2, rs)

            self:DestroyAllDamageEffects()
            if toSurface < 1 then
                CreateAttachedEmitter(self, randBone, self.Army,'/effects/emitters/destruction_water_sinking_ripples_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
                CreateAttachedEmitter(self, randBone, self.Army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
            end

            if toSurface < 0 then
                --explosion.CreateDefaultHitExplosionAtBone(self, randBone, scale*1.5)
            else
                local lifetime = utilities.GetRandomInt(50, 200)

                if(toSurface > 1) then
                    CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/underwater_bubbles_01_emit.bp'):OffsetEmitter(rx, ry, rz)
                        :ScaleEmitter(scale)
                        :SetEmitterParam('LIFETIME', lifetime)

                    CreateAttachedEmitter(self, -1, self.Army, '/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                end
                CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                CreateEmitterAtBone(self, randBone, self.Army, '/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
            end
            local rd = utilities.GetRandomFloat(0.4, 1.0)
            WaitSeconds(i + rd)
            i = i + 0.3
        end
    end,

    -- Disable damage effects on unfinished units
    ManageDamageEffects = function(self, newHealth, oldHealth)
        if not self.isFinishedUnit then return end

        oldUnit.ManageDamageEffects(self, newHealth, oldHealth)
    end,

    -- Because there are no damaged effects on unfinished buildings, we have to set them up when the unit is completed.
    OnStopBeingBuilt = function(self, builder, layer)
        if not oldUnit.OnStopBeingBuilt(self, builder, layer) then
            return false
        else
            -- The effects are spawned in 3 stages, 75%, 50%, 25% and then removed one by one as the unit heals.
            local healthRatio =  self:GetHealth() / self:GetMaxHealth()
            if healthRatio < 0.75 then
                self:ManageDamageEffects(0.75, 1)
            end
            if healthRatio < 0.5 then
                self:ManageDamageEffects(0.5, 0.75)
            end
            if healthRatio < 0.25 then
                self:ManageDamageEffects(0.25, 0.5)
            end
            return true
        end
    end,
}
