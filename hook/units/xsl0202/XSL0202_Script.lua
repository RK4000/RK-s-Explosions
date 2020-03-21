----------------------------
-- Seraphim Heavy Bot Script
----------------------------
local SDEffectsTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
-- local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

local heartExplosionOwners = {
    ['123313'] = true, -- LuXy
    ['85109'] = true, -- Lu_Xun_17
    ['62956'] = true, -- Sheeo
    ['30646'] = true, -- Pinky_Zoria
    ['37639'] = true, -- RK4000
    ['5268'] = true, -- TA4Life
    ['21916'] = true, -- speed2
}

local oldXSL0202 = XSL0202
XSL0202 = Class(oldXSL0202) {    
    CreateFluffyHeartShockwave = function(self)
        local blanketSides = 18/2
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1/2
        local blanketVelocity = 3

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)
            local BlanketOffset = 0
            local Deceleration = 0 -- -17/2*3*3
            local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Heart_Debris/Heart_Debris_proj.bp', blanketX, 1.55 + BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
        end        
    end,
    
    OnKilled = function(self, instigator, type, overkillRatio)
        oldXSL0202.OnKilled(self, instigator, type, overkillRatio) -- Remove this call if adding everything anyway
        local ID = ScenarioInfo.ArmySetup['ARMY_' .. self.Army].OwnerID
        if ID and heartExplosionOwners[ID] then
            self:CreateFluffyHeartShockwave()
            self:CreateEffects(SDEffectsTemplate.LuXy_Heart, self.Army, 1)-- Heart explosion goes here
            -- RKExplosion.CreateInheritedVelocityDebrisProjectiles(self, 4, {self:GetVelocity()}, 7.75, 0.23, 50.35, ('/mods/rks_explosions/effects/entities/Heart_Debris/Heart_Debris_proj.bp'))
        end
    end
}

TypeClass = XSL0202
