-------------------
-- Aeon CZAR Script
-------------------
local explosion = import('/lua/defaultexplosions.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')

local EffectTemplate = import('/lua/EffectTemplates.lua')
local Util = import('/lua/Utilities.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local BoomSoundBP = import('/mods/rks_explosions/boomsounds/BoomSounds.bp')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function GetEffectTemplateFile(toggle)
    if toggle == 1 then
        return SDEffectTemplate
    else 
        return NEffectTemplate
    end
end

local oldUAA0310 = UAA0310
UAA0310 = Class(oldUAA0310) {
    CreateDeathExplosionInitialShockwave = function(self)
        local blanketSides = 18*10
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1*10
        local blanketVelocity = 50

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)
            local BlanketOffset = 5
            local Deceleration = 0 -- -17/2*3*3

            -- local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, 1.0 +BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            --     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            -- local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -0.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            --     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            -- local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -1.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            --     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            -- local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -2.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            --     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -3.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -4.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdgeUpper/CZARShockwaveEdgeUpper_proj.bp', blanketX, -5.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -6.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            -- local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -7.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            --     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            -- local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -8.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            --     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            -- local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -9.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            --     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            -- local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -10.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            --     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
        end        
    end,
    
    CreateDeathExplosionTareThroughEffect = function(self)
        local blanketSides = 18*2
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1*2
        local blanketVelocity = 34*4/3

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)
            local BlanketOffset = 0
            local Deceleration = 0 -- -17/2*3*3

            local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARCenterEffectUp/CZARCenterEffectUp_proj.bp', blanketX, 0 +BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
            local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARCenterEffectDown/CZARCenterEffectDown_proj.bp', blanketX, 0 +BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
        end        
    end,

    OnCreate = function(self)
        lastDamageEffectThreshold = 1 -- speed2: fix to self.lastDamageEffectThreshold = 1 causing massive fps drop when heavy damaged
        oldUAA0310.OnCreate(self)
    end,
 
    OnDamage = function(self, instigator, amount, vector, damageType)
        local maxHealth = self:GetMaxHealth()
        local oldHealthPercent = self:GetHealth()/maxHealth
        oldUAA0310.OnDamage(self, instigator, amount, vector, damageType)
        local newHealthPercent = self:GetHealth()/maxHealth

        if newHealthPercent < self.lastDamageEffectThreshold then
            self:ManageDamageEffects(newHealthPercent, oldHealthPercent)
            self.lastDamageEffectThreshold = newHealthPercent - 0.05
        end
    end,
 
    ManageDamageEffects = function(self, newHealth, oldHealth)
        PlaySubBoomSound = function(self, sound)
            local bp = BoomSoundBP.Audio
            if bp and bp[sound] then
                self:PlaySound(bp[sound])
                return true
            end
            return false
        end

        -- LOG('*DEBUG: ManageDamageEffects, New: ', repr(newHealth), ' Old: ', repr(oldHealth))
 
        if newHealth < oldHealth then
            if oldHealth > 0.75 then
                for i = 1, self.FxDamage1Amount do
                    self:PlayDamageEffect(self.FxDamage1, self.DamageEffectsBag[1])
                end
            elseif oldHealth > 0.5 then
                for i = 1, self.FxDamage2Amount do
                    self:PlayDamageEffect(self.FxDamage2, self.DamageEffectsBag[2])
                end
            elseif oldHealth > 0.25 then
                for i = 1, self.FxDamage3Amount do
                    self:PlayDamageEffect(self.FxDamage3, self.DamageEffectsBag[3])
                end
            elseif oldHealth > 0.10 then
                RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Attachpoint05', self.Army, GetEffectTemplateFile(toggle).CZAR_Center_Core_Breach01, 3.15, 'CoreBreachEffects1')  
                RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Attachpoint05', self.Army, GetEffectTemplateFile(toggle).CZAR_Center_Core_Breach02, 3, 'CoreBreachEffects1') 
                RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'UAA0310', self.Army, GetEffectTemplateFile(toggle).CZAR_Air_Rushing_In, 1, 'CoreBreachEffects2') 
                RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Attachpoint05', self.Army, GetEffectTemplateFile(toggle).CZAR_Core_Rupture, 3, 'CoreBreachEffects1')
                PlaySubBoomSound('CZARCoreDestroyed')  
                -- PlaySubBoomSound('CZARCoreDestroyed' -- speed2:commented out, is it inteded to play twice?
            -- elseif oldHealth > 0.05 then
            end
        else
            if newHealth <= 0.10 and newHealth > 0 then
                for k, v in self.DamageEffectsBag[4] do
                    v:Destroy()
                end
            elseif newHealth <= 0.25 and newHealth > 0.10 then
                for k, v in self.CoreBreachEffects1 do
                    v:Destroy()
                end
                for k, v in self.CoreBreachEffects2 do
                    v:Destroy()
                end
                for k, v in self.DamageEffectsBag[3] do
                    v:Destroy()
                end
            elseif newHealth <= 0.5 and newHealth > 0.25 then
                for k, v in self.DamageEffectsBag[2] do
                    v:Destroy()
                end
                for k, v in self.CoreBreachEffects1 do
                    v:Destroy()
                end
                for k, v in self.CoreBreachEffects2 do
                    v:Destroy()
                end
            elseif newHealth <= 0.75 and newHealth > 0.5 then
                for k, v in self.DamageEffectsBag[1] do
                    v:Destroy()
                end
                for k, v in self.CoreBreachEffects1 do
                    v:Destroy()
                end
                for k, v in self.CoreBreachEffects2 do
                    v:Destroy()
                end
            elseif newHealth > 0.75 then
                self:DestroyAllDamageEffects()    
                for k, v in self.CoreBreachEffects1 do
                    v:Destroy()
                end
                for k, v in self.CoreBreachEffects2 do
                    v:Destroy()
                end
            end
        end
    end,
    
    DeathThreadFn = function(self)
        WaitSeconds(0.35)
        sdexplosion.CreateFactionalExplosionAtBone(self, 'UAA0310', 13.5, GetEffectTemplateFile(toggle).ExplosionTECH2AEON) 
        local NumberForShake = (Util.GetRandomFloat(1.5, 1.5 + 1))/3.5
        self:ShakeCamera(30 * NumberForShake*7.5, NumberForShake*7.5, 0, NumberForShake*7.5 / 1.375)
        self:PlayUnitSound('Killed')
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        if self:GetCurrentLayer() == 'Air' then 
            if self.CoreBreachEffects1 ~= nil then
                for k, v in self.CoreBreachEffects1 do
                    v:Destroy()
                end
            end
            
            if self.CoreBreachEffects2 ~= nil then
                for k, v in self.CoreBreachEffects2 do
                    v:Destroy()
                end
            end

            -- sdexplosion.CreateFactionalExplosionAtBone( self, 'Attachpoint02', 0.5, GetEffectTemplateFile(toggle).CZAR_Center_FallDown_Smoke )
            -- sdexplosion.CreateFactionalExplosionAtBone( self, 'Attachpoint06', 0.5, GetEffectTemplateFile(toggle).CZAR_Center_FallDown_Smoke )
            -- sdexplosion.CreateFactionalExplosionAtBone( self, 'Attachpoint08', 0.5, GetEffectTemplateFile(toggle).CZAR_Center_FallDown_Smoke )

            self:CreateEffects(GetEffectTemplateFile(toggle).CZAR_Center_FallDown_Smoke, self.Army, 1 )
            self:CreateEffects(GetEffectTemplateFile(toggle).CZAR_Center_FallDown_Aura, self.Army, 1 )
            self:CreateEffects(GetEffectTemplateFile(toggle).CZAR_Center_Charge, self.Army, 4 )
            RKExplosion.CreateInheritedVelocityDebrisProjectiles(self, 150, {self:GetVelocity()}, 12.75, 0.23, 50.35, ('/mods/rks_explosions/effects/entities/CZAR_Debris/CZAR_Debris_proj.bp'))
            self:CreateDeathExplosionTareThroughEffect()
            sdexplosion.CreateFactionalExplosionAtBone( self, 'UAA0310', 0.5, GetEffectTemplateFile(toggle).CZAR_Initial_Center_Explosion )    
            self:CreateDeathExplosionInitialShockwave()

            self:ForkThread(self.DeathThreadFn)
        end
        oldUAA0310.OnKilled(self, instigator, type, overkillRatio)
    end,
    
    OnImpact = function(self, with, other)    
        -- Damage the area we have impacted with.
        local bp = self:GetBlueprint()
        local i = 1
        local numWeapons = table.getn(bp.Weapon)

        self:PlayUnitSound('Destroyed')
        RKExplosion.CreateScorchMarkDecalRKSExpAeon(self, 50, self.Army)
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'DeathImpact') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        if with == 'Water' then
            for k,v in self.RKEmitters do v:ScaleEmitter(0) end
            self:PlayUnitSound('AirUnitWaterImpact')
            self:CreateEffects(EffectTemplate.Splashy, self.Army, 12 )
            DefaultExplosionsStock.CreateFlash(self, -1, 1, self.Army)
            self:CreateEffects(GetEffectTemplateFile(toggle).OilSlick, self.Army, 7)
            self.shallSink = true
            self.colliderProj:Destroy()
            self.colliderProj = nil
            self:ForkThread(self.DeathThread, self.OverKillRatio)   
        else
            -- This is a bit of safety to keep us from calling the death thread twice in case we bounce twice quickly
            if not self.DeathBounce then
                self:ForkThread(self.DeathThread, self.OverKillRatio)
                self.DeathBounce = 1
            end
            sdexplosion.CreateFactionalExplosionAtBone(self, 'UAA0310', 14.5, GetEffectTemplateFile(toggle).CZARCenterImpactExplosion)
            local NumberForShake = (Util.GetRandomFloat(1.5, 1.5 + 1))/3.5
            self:ShakeCamera(30 * NumberForShake*7.5, NumberForShake*7.5, 0, NumberForShake*7.5 / 1.375)
        end
    end,

    OnAnimTerrainCollision = function(self, bone,x,y,z)
        self:PlayUnitSound('TerrainImpact')
        DamageArea(self, {x,y,z}, 5, 1000, 'Default', true, false)
        sdexplosion.CreateFactionalExplosionAtBone(self, bone, 3.0, GetEffectTemplateFile(toggle).ExplosionTECH3AEON)
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
    end,
}

TypeClass = UAA0310
