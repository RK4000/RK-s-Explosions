----------------------------
-- Cybran Soul Ripper Script
----------------------------
local Util = import('/lua/utilities.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function GetEffectTemplateFile(toggle)
    if toggle == 1 then
        return SDEffectTemplate
    else 
        return NEffectTemplate
    end
end

local oldURA0401 = URA0401
URA0401 = Class(oldURA0401) {       
    OnKilled = function(self, instigator, type, overkillRatio)
        if self:GetCurrentLayer() == 'Air' then 
            -- Used for custom booms
            CreateAlmostDeadEffects = function(self, EffectTable, army, scale)
                for k, v in EffectTable do
                    if self.RKEmittersAlmostDead == nil then self.RKEmittersAlmostDead = {} end
                    local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
                    table.insert(self.RKEmittersAlmostDead, emitter)
                    self.Trash:Add(emitter)
                end
            end

            CreateEffects = function(self, EffectTable, army, scale)
                for k, v in EffectTable do
                    if self.RKEmitters == nil then self.RKEmitters = {} end
                    local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
                    table.insert(self.RKEmitters, emitter)
                    self.Trash:Add(emitter)
                end
            end

            if self.EngineFailing1 ~= nil then
                for k, v in self.EngineFailing1 do
                    v:Destroy()
                end
            end  

            local Army = self:GetArmy()
            local numBones = self:GetBoneCount() - 1

            for i = 1, 14, 1 do
                RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt(0, numBones), Army, GetEffectTemplateFile(toggle).SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage') 
            end

            RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'URA0401', Army, GetEffectTemplateFile(toggle).SoulRipper_Ambient_Electricity_Upper, 0.60/2, 'HullDamage') 
            RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'URA0401', Army, GetEffectTemplateFile(toggle).SoulRipper_Fall_Down_Smoke, 1, 'FallDown1')
            
            self:ForkThread(self.DeathThreadFn)
        end
        oldURA0401.OnKilled(self, instigator, type, overkillRatio)
    end,

    ExplodingThreadFn = function(self, overkillRatio)
        local numBones = self:GetBoneCount() - 1

        local DoSubBoom = function(bound, fx)
            RKExplosion.CreateFactionalExplosionAtBone(self, Util.GetRandomInt(0, numBones), Util.GetRandomFloat(1, bound), fx)
            self:PlayUnitSound('SubBooms')
        end

        WaitSeconds(6.25/1.5)
        -- First series of booms
        for i = 1, 8, 1 do
            DoSubBoom(2.5, GetEffectTemplateFile(toggle).SoulRipper_First_Series_Booms)
            WaitSeconds(Util.GetRandomFloat(0.95/3,1.35/3))
        end
        -- 2nd series of booms
        WaitSeconds(4/3)
        for i = 1, 8, 1 do
            DoSubBoom(1.5, GetEffectTemplateFile(toggle).SoulRipper_Second_Series_Booms)
            WaitSeconds(Util.GetRandomFloat(0,0.6/3))
        end
        -- 3rd series of booms
        WaitSeconds(3/3)
        for i = 1, 3, 1 do
            DoSubBoom(3.5, GetEffectTemplateFile(toggle).SoulRipper_Third_Series_Booms)
            WaitSeconds(Util.GetRandomFloat(2/3,3/3))
        end
        
        for k, v in self.HullDamage do
            v:Destroy()
        end
        -- Final boom
        WaitSeconds(4/3)
        local Army = self:GetArmy()
        RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 19, Army)
        RKExplosion.CreateUpwardsVelocityDebrisProjectiles(self, 150, {self:GetVelocity()}, 12.75, 0.23, 50.35, ('/mods/rks_explosions/effects/entities/SR_Debris/SR_Debris_proj.bp'))
        RKExplosion.CreateFactionalExplosionAtBone(self, 'URA0401', Util.GetRandomFloat(1, 7.5), GetEffectTemplateFile(toggle).SoulRipper_Final_Boom)
        self:PlayUnitSound('FinalBoom')
        self:CreateWreckage(overkillRatio)
        self:Destroy()
    end,

    OnImpact = function(self, with, other)
        local bp = self:GetBlueprint()
        local Army = self:GetArmy()   
        self:PlayUnitSound('Destroyed')

        -- Damage the area we have impacted with.
        local bp = self:GetBlueprint()
        local i = 1
        local numWeapons = table.getn(bp.Weapon)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'DeathImpact' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        for k, v in self.FallDown1 do
            v:Destroy()
        end

        if with == 'Water' then
            for k,v in self.RKEmitters do v:ScaleEmitter(0) end
            self:PlayUnitSound('AirUnitWaterImpact')
            self.CreateEffects(self, EffectTemplate.Splashy, Army, 12 )
            DefaultExplosionsStock.CreateFlash(self, -1, 1, Army)
            self.CreateEffects(self, GetEffectTemplateFile(toggle).OilSlick, Army, 14)
            
            --self:Destroy()
            self:ForkThread(self.DeathThread, self.OverKillRatio)    
        else
            -- This is a bit of safety to keep us from calling the death thread twice in case we bounce twice quickly
            if not self.DeathBounce then
                self:ForkThread(self.ExplodingThreadFn, self.OverKillRatio)
                --self:ForkThread(self.DeathThread, self.OverKillRatio)
                self.DeathBounce = 1
            end
            RKExplosion.CreateFactionalExplosionAtBone(self, 'URA0401', 3.5, GetEffectTemplateFile(toggle).SoulRipper_Impact_Explosion)
            CreateLightParticle(self, -1, Army, 10*2, 30*2, 'glow_02', 'ramp_quantum_warhead_flash_01')
        end
    end,  
}

TypeClass = URA0401
