------------------------------------
-- Seraphim Experimental Assault Bot
------------------------------------
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local explosion = import('/lua/defaultexplosions.lua')

local oldXSL0401 = XSL0401
XSL0401 = Class(oldXSL0401) {    
    DeathThread = function(self, overkillRatio , instigator)
        local bigExplosionBones = {'Torso', 'Head', 'pelvis'}
        local explosionBones = {'Right_Arm_B07', 'Right_Arm_B03',
                                'Left_Arm_B10', 'Left_Arm_B07',
                                'Chest_B01', 'Chest_B03',
                                'Right_Leg_B01', 'Right_Leg_B02', 'Right_Leg_B03',
                                'Left_Leg_B17', 'Left_Leg_B14', 'Left_Leg_B15'}
                                        
        RKExplosion.CreateSeraMediumHitExplosionAtBone(self, bigExplosionBones[Random(1,3)], 1.0)
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})           
        WaitSeconds(2)

        local RandBoneIter = RandomIter(explosionBones)
        for i = 1, Random(4, 6) do
            local bone = RandBoneIter()
            RKExplosion.CreateSeraMediumHitExplosionAtBone(self, bone, 0.5)
            self:PlayUnitSound('Destroyed1')
            WaitTicks(Random(2,4))
        end
        
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'CollossusDeath' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(3.5)
        RKExplosion.CreateSeraMediumHitExplosionAtBone(self, 'Torso', 0.5)        

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
            else -- VAPORIZED
                self.CreateUnitDestructionDebris(self, true, true, true)
            end
        end

        if self:GetFractionComplete() == 1 then
            self:SpawnElectroStorm()
        end

        self:PlayUnitSound('Destroyed')
        self:Destroy()
    end,

    OnDestroy = function(self)
        RKExplosion.CreateScorchMarkDecalRKSExpSera(self, 17, self.Army)
        oldXSL0401.OnDestroy(self)
    end,
}

TypeClass = XSL0401