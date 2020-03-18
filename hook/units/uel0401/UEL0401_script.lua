--------------------
-- UEF Fatboy Script
--------------------
local Util = import('/lua/Utilities.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local explosion = import('/lua/defaultexplosions.lua')

local oldUEL0401 = UEL0401
UEL0401 = Class(oldUEL0401) {   
    DeathThreadLand = function(self)
        local bp = self:GetBlueprint()
        local NumberForShake = (Util.GetRandomFloat(0.5, 0.5 + 1))/8

        self:PlayUnitSound('Destroyed')
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'UEL0401', 2/2) -- sdexplosion.CreateUEFLargeShortDurSmokeHitExplosionAtBone(self, 'UEL0401', 0.25)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedBigDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.7)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Turret_Left01', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Turret_Right02', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Attachpoint01', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Bay_Cover', 2/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Ramp', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Attachpoint03', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Bay_Cover', 2/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Ramp', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Attachpoint03', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Turret_Left01', 2/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.5)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Front_Core', 2/2) -- sdexplosion.CreateUEFLargeShortDurSmokeHitExplosionAtBone(self, 'Front_Core', 0.25)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedBigDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(1)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Turret_Right02', 2/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Attachpoint01', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.3)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'UEL0401', 2/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Front_Core', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Rear_Core', 2/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Turret_Right01', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.3)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Turret_Right02', 2/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.4)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Turret_Left01', 2.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Turret_Left02', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Ramp', 2*1.5/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Front_Core', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Attachpoint03', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Turret_Right01', 1.25/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(1)
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'UEL0401', 5/2)
        self:ShakeCamera(30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)
        self:PlayUnitSound('DestroyedStep4')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Turret_Right01', 2.25/2)
        self:PlayUnitSound('DestroyedStep4')
        WaitSeconds(0)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Turret_Right02', 2.25/2)
        self:PlayUnitSound('DestroyedStep4')
        WaitSeconds(0.1)
        sdexplosion.CreateUEFMediumHitExplosionAtBone(self, 'Turret_Left01', 5/2)
        self:PlayUnitSound('DestroyedStep4')
        WaitSeconds(0)
        sdexplosion.CreateUEFSmallHitExplosionAtBone(self, 'Turret_Left02', 2.25/2/2)
        sdexplosion.CreateUEFLargeHitExplosionAtBone(self, 'UEL0401', 17/2/2)
        self:PlayUnitSound('DestroyedStep4')
        self:ShakeCamera(30 * NumberForShake*9.5, NumberForShake*9.5, 0, NumberForShake*7.55 / 1.375)
        WaitSeconds(0.1)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'BigDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        self:PlayUnitSound('DestroyedStep3')
        RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 19, self.Army)
    end,
    
    DeathThreadWater = function(self)
        local NumberForShake = (Util.GetRandomFloat(0.5, 0.5 + 1))/3.5
        self:PlayUnitSound('DestroyedStep3')
        RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 19, self.Army)
    end,
    
    DeathThread = function(self)
        local layer = self:GetCurrentLayer() 
        
        if layer == 'Water' or layer == 'Seabed' then
            self.DeathThreadWater(self)
        else
            self.DeathThreadLand(self)
        end
        
        self:CreateWreckage(0.1)
        self:Destroy()
    end,
}

TypeClass = UEL0401