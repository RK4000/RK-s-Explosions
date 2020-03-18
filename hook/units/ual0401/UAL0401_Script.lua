--------------------------------
-- Aeon Galactic Colossus Script
--------------------------------
local Util = import('/lua/utilities.lua')
local explosion = import('/lua/defaultexplosions.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
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

local oldUAL0401 = UAL0401
UAL0401 = Class(oldUAL0401) {    
    DeathThreadWater = function(self, overkillratio, instigator)
        local NumberForShake = (Util.GetRandomFloat(1.5, 1.5 + 1))/3.5
        
        self:PlayUnitSound('DestroyedStep2')
        
        sdexplosion.CreateGenericFlashExplosionAtBone(self, 'Torso', 5.0)
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()}) 

        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end  

        WaitSeconds(1)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateGenericFlashExplosionAtBone(self, 'Right_Leg_B02', 0.5)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateGenericFlashExplosionAtBone(self, 'Right_Leg_B01', 0.3)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.95)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateGenericFlashExplosionAtBone(self, 'Left_Arm_B02', 0.3)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.75)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateGenericFlashExplosionAtBone(self, 'Right_Arm_B01', 0.3)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        -- sdexplosion.CreateGenericFlashExplosionAtBone(self, 'Right_Leg_B01', 0.5)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.58)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateGenericFlashExplosionAtBone(self, 'Torso', 4.5)
        self:ShakeCamera(30 * NumberForShake*1.5, NumberForShake*1.5, 0, NumberForShake*1.5 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(2.5)
        sdexplosion.CreateGenericFlashExplosionAtBone(self, 'Torso', 6.5)
        self:ShakeCamera(30*2.5 * NumberForShake*2.5, NumberForShake*2.5, 0, NumberForShake*3.5)    

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end
    end,
    
    DeathThreadLand = function(self, overkillratio, instigator) -- LAND BOOM
        local NumberForShake = (Util.GetRandomFloat(1.5, 1.5 + 1))/3.5

        self:ShakeCamera(30 * NumberForShake*1.5, NumberForShake*1.5, 0, NumberForShake*1.5 / 1.375)
        self:PlayUnitSound('DestroyedStep2')
        RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Torso', self.Army, GetEffectTemplateFile(toggle).GC_Core_Breach02, 2.15, 'CoreBreach') 
        RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'B01', self.Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath') 
        RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'B02', self.Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath')
        RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Right_Arm_B02', self.Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath')
        RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Left_Arm_B02', self.Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath')
        RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Torso', self.Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath')
        RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Right_Arm_Muzzle01', self.Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath') 
        RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Left_Leg_B02', self.Army, GetEffectTemplateFile(toggle).GC_Body_Part_Damage, 0.15, 'SmokingDeath')

        sdexplosion.CreateAeonLargeInitialHitExplosionAtBone(self, 'Torso', 5.0)
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()}) 

        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(2.1)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonMediumHitExplosionAtBone(self, 'Right_Leg_B02', 0.5)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(1)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonSmallHitExplosionAtBone(self, 'Right_Leg_B01', 0.3)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(1)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonSmallHitExplosionAtBone(self, 'Left_Arm_B02', 0.3)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(1)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonSmallHitExplosionAtBone(self, 'Right_Arm_B01', 0.3)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        -- sdexplosion.CreateAeonSmallHitExplosionAtBone(self, 'Right_Leg_B01', 0.5)
        self:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathSmallBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.5)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateAeonLargeHitExplosionAtBone(self, 'Torso', 4.5)
        self:ShakeCamera(30 * NumberForShake*1.5, NumberForShake*1.5, 0, NumberForShake*1.5 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(4)
        sdexplosion.CreateGCFinalLargeHitExplosionAtBone(self, 'Torso', 6.5)
        self:ShakeCamera(30*2.5 * NumberForShake*2.5, NumberForShake*2.5, 0, NumberForShake*3.5)    

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeathBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end 
    end,
        
    DeathThread = function(self, overkillRatio, instigator)
        local layer = self:GetCurrentLayer() 
        
        if layer == 'Water' or layer == 'Seabed' then
            self.DeathThreadWater(self, overkillRatio, instigator)
        else
            self.DeathThreadLand(self, overkillRatio, instigator)
        end

        if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end

        self:DestroyAllDamageEffects()
        self:CreateWreckage(overkillRatio)

        -- CURRENTLY DISABLED UNTIL DESTRUCTION
        -- Create destruction debris out of the mesh, currently these projectiles look like crap,
        -- since projectile rotation and terrain collision doesn't work that great. These are left in
        -- hopes that this will look better in the future.. =)
        if self.ShowUnitDestructionDebris and overkillRatio then
            if overkillRatio <= 1 then
                self.CreateUnitDestructionDebris(self, true, true, false)
            elseif overkillRatio <= 2 then
                self.CreateUnitDestructionDebris(self, true, true, false)
            elseif overkillRatio <= 3 then
                self.CreateUnitDestructionDebris(self, true, true, true)
            else --VAPORIZED
                self.CreateUnitDestructionDebris(self, true, true, true)
            end
        end

        self:PlayUnitSound('DestroyedFinal')
        RKExplosion.CreateScorchMarkDecalRKSExpAeon(self, 20, self.Army)
        self:Destroy()
    end,
}
TypeClass = UAL0401