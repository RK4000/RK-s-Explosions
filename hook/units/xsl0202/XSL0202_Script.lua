----------------------------
-- Seraphim Heavy Bot Script
----------------------------
local SDEffectsTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

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
    CreateEffects = function( self, EffectTable, army, scale)
        for k, v in EffectTable do
        if self.RKEmitters == nil then self.RKEmitters = {} end
            local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
            self.Trash:Add(emitter)
        end
    end,
    
    CreateFluffyHeartShockwave = function( self )
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
        local bp = self:GetBlueprint()
        local Army = self:GetArmy()
        local luxyAliases = {"LuXy", "Lu_Xun_17", "Sheeo", "Pinky_Zoria", "RK4000", "TA4Life"} -- Add as many as you want
        
        local ID = ScenarioInfo.ArmySetup['ARMY_' .. self:GetArmy()].OwnerID
        if ID and heartExplosionOwners[ID] then
            self:CreateFluffyHeartShockwave()
            self.CreateEffects( self, SDEffectsTemplate.LuXy_Heart, Army, 1)-- Heart explosion goes here
            --RKExplosion.CreateInheritedVelocityDebrisProjectiles( self, 4, {self:GetVelocity()}, 7.75, 0.23, 50.35, ('/mods/rks_explosions/effects/entities/Heart_Debris/Heart_Debris_proj.bp'))
        end
    end
}

TypeClass = XSL0202
