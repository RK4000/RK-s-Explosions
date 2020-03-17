---------------------------
-- Cybran Spider Bot Script
---------------------------
local explosion = import('/lua/defaultexplosions.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

local oldURL0402 = URL0402
URL0402 = Class(oldURL0402) {
    --[[
    OnKilled = function(self, inst, type, okr)
        self.Trash:Destroy()
        self.Trash = TrashBag()
        if self.AmbientExhaustEffectsBag then
            EffectUtil.CleanupEffectBag(self,'AmbientExhaustEffectsBag')
        end
        oldURL0402.OnKilled(self, inst, type, okr)
    end,
    --]]
    
    DeathThreadLand = function(self)
        self:PlayUnitSound('Destroyed')
        local army = self:GetArmy()
        RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 12, army)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Right_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Projectile01', 1.0)

        -- Create Initial explosion effects
        explosion.CreateFlash(self, 'Center_Turret', 1, army)
        CreateAttachedEmitter(self, 'URL0402', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp')
        CreateAttachedEmitter(self,'URL0402', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp')
        self:CreateFirePlumes(army, {'Center_Turret'}, 0)

        self:CreateFirePlumes(army, {'Right_Leg01_B01','Right_Leg03_B01','Left_Leg03_B01',}, 0.5)

        self:CreateExplosionDebris(army)
        self:CreateExplosionDebris(army)
        self:CreateExplosionDebris(army)

        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(1.1)
        sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Right_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Left_Projectile01', 2)
		self:PlayUnitSound('DestroyedStep2')
        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.5)
        sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Right_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Right_Projectile01', 2)
		self:PlayUnitSound('DestroyedStep2')
        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(1.0)
        self:PlayUnitSound('DestroyedStep2')
        
        # Create damage effects on turret bone
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Center_Turret', 1.5)
        self:CreateDamageEffects('Center_Turret_B01', army)
        self:CreateDamageEffects('Center_Turret_Barrel', army)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end


        WaitSeconds(0.6)
        self:PlayUnitSound('DestroyedStep2')
        self:CreateFirePlumes(army, {'Right_Leg01_B01','Right_Leg03_B01','Left_Leg03_B01',}, 0.5)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.6)
        self:PlayUnitSound('DestroyedStep2')
        self:CreateDeathExplosionDustRing()

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'SmallDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.7)


        # When the spider bot impacts with the ground
        # Effects: Explosion on turret, dust effects on the muzzle tip, large dust ring around unit
        # Other: Damage force ring to force trees over and camera shake
        self:ShakeCamera(50, 5, 0, 1)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Turret_Muzzle', 1)
        for k, v in EffectTemplate.FootFall01 do
            CreateAttachedEmitter(self,'Center_Turret_Muzzle',army, v):ScaleEmitter(2)          
            CreateAttachedEmitter(self,'Center_Turret_Muzzle',army, v):ScaleEmitter(2) 
        end


        self:CreateExplosionDebris(army)
        self:CreateExplosionDebris(army)

        local x, y, z = unpack(self:GetPosition())
        z = z + 3
        DamageRing(self, {x,y,z}, 0.1, 3, 1, 'Force', true)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.7)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Center_Turret', 5)

        # Finish up force ring to push trees
        DamageRing(self, {x,y,z}, 0.1, 3, 1, 'Force', true)

        # Explosion on and damage fire on various bones
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Right_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Projectile01', 2)
        self:CreateFirePlumes(army, {'Left_Projectile01'}, -1)
        self:CreateDamageEffects('Right_Turret', army)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'BigDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.7)
        self:PlayUnitSound('DestroyedStep2')
        
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        self:CreateDamageEffects('Right_Leg01_B03', army)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.7)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Turret_Muzzle', 1)
        self:CreateExplosionDebris(army)
        self:PlayUnitSound('DestroyedStep2')
        
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Right_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        self:CreateDamageEffects('Right_Projectile0' .. Random(1,2), army)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.6)
        self:PlayUnitSound('DestroyedStep2')
        self:PlayUnitSound('DestroyedStep2')
        
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Leg0' .. Random(1,3) .. '_B0' .. Random(1,3), 0.25)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Projectile01', 2)
        self:CreateDamageEffects('Left_Leg03_B03', army)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MedDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.8)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateCybranFinalLargeHitExplosionAtBone(self, 'URL0402', 9)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'BigDeathBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
    end,

    DeathThreadWater = function(self)
        self:PlayUnitSound('Destroyed')
        local army = self:GetArmy()
        RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 12, army)
        explosion.CreateFlash(self, 'Center_Turret', 3, army)
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

TypeClass = URL0402
