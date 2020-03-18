-------------------------
-- Cybran Megalith script
-------------------------
local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local MobileUnit = import('/lua/defaultunits.lua').MobileUnit
local explosion = import('/lua/defaultexplosions.lua')
local CreateDeathExplosion = explosion.CreateDefaultHitExplosionAtBone
local EffectTemplate = import('/lua/EffectTemplates.lua')
local utilities = import('/lua/Utilities.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local Entity = import('/lua/sim/Entity.lua').Entity
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

local Weapon = import('/lua/sim/Weapon.lua').Weapon
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFHvyProtonCannonWeapon = CybranWeaponsFile.CDFHvyProtonCannonWeapon
local CANNaniteTorpedoWeapon = CybranWeaponsFile.CANNaniteTorpedoWeapon
local CIFSmartCharge = CybranWeaponsFile.CIFSmartCharge
local CAABurstCloudFlakArtilleryWeapon = CybranWeaponsFile.CAABurstCloudFlakArtilleryWeapon
local CDFBrackmanCrabHackPegLauncherWeapon = CybranWeaponsFile.CDFBrackmanCrabHackPegLauncherWeapon

local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

local oldXRL0403 = XRL0403
XRL0403 = Class(oldXRL0403) {
    DeathThreadWater = function(self)
        self:PlayUnitSound('Destroyed')
        RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 19, self.Army)
        explosion.CreateFlash(self, 'AA_Turret', 7, self.Army)
    end,

    DeathThreadLand = function(self)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'AA_Turret', 2.25)
        CreateAttachedEmitter(self, 'XRL0403', self.Army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/distortion_ring_01_emit.bp')
        self:CreateFirePlumes(self.Army, {'XRL0403'}, 0)

        self:CreateFirePlumes(self.Army, {'Right_Leg01_B01','Right_Leg02_B01','Left_Leg02_B01',}, 0.5)

        self:CreateExplosionDebris(self.Army)
        self:CreateExplosionDebris(self.Army)
        self:CreateExplosionDebris(self.Army)

        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.15)
        self:PlayUnitSound('Destroyed')
        sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'Right_Leg01_B02', 2.25)
        CreateAttachedEmitter(self, 'XRL0403', self.Army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/distortion_ring_01_emit.bp')
        self:CreateFirePlumes(self.Army, {'XRL0403'}, 0)

        self:CreateFirePlumes(self.Army, {'Right_Leg01_B01','Right_Leg02_B01','Left_Leg02_B01',}, 0.5)

        self:CreateExplosionDebris(self.Army)
        self:CreateExplosionDebris(self.Army)
        self:CreateExplosionDebris(self.Army)


        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
				self:PlayUnitSound('DestroyedStep2')
                break
            end
        end
        WaitSeconds(1)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Leg01_B01', 0.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.4)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Right_Leg02_B01', 0.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.4)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Leg01_B01', 0.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.3)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Right_Leg02_B01', 0.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.4)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Leg02_B02', 0.25)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Flare_Muzzle06', 0.25)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Torpedo_Muzzle07', 0.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(1.0)
        self:PlayUnitSound('DestroyedStep3')
        CreateAttachedEmitter(self, 'XRL0403', self.Army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/distortion_ring_01_emit.bp')
        sdexplosion.CreateCybranVeryLargeHitExplosionAtBone(self, 'AA_Turret', 2.25)
        sdexplosion.CreateCybranVeryLargeHitExplosionAtBone(self, 'Flare_Muzzle01', 2.25)
        sdexplosion.CreateCybranVeryLargeHitExplosionAtBone(self, 'Right_Leg01_B02', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.7)
        self:PlayUnitSound('DestroyedStep2')
        CreateAttachedEmitter(self, 'XRL0403', self.Army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/distortion_ring_01_emit.bp')
        sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'Left_Leg02_B02', 2.25)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Flare_Muzzle06', 2.25)
        sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'Torpedo_Muzzle07', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(1.0)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'AA_Turret', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.2)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Right_Leg02_B01', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.4)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Leg02_B02', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.1)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Torpedo_Muzzle03', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'AA_Muzzle', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.4)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Torpedo_Muzzle12', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.25)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Left_Leg01_B01', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathMedBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.6)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'AA_Turret', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.15)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'Right_Leg02_B02', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.015)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'Right_Leg01_B02', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.035)
        self:PlayUnitSound('DestroyedStep3')
        CreateAttachedEmitter(self, 'XRL0403', self.Army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/distortion_ring_01_emit.bp')
        sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'AA_Turret', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(0.025)
        RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 19, self.Army)
        self:PlayUnitSound('DestroyedStep3')
        CreateAttachedEmitter(self, 'XRL0403', self.Army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter(0, 5, 0)
        CreateAttachedEmitter(self,'XRL0403', self.Army, '/effects/emitters/distortion_ring_01_emit.bp')
        sdexplosion.CreateCybranFinalLargeHitExplosionAtBone(self, 'Left_Leg01_B02', 2.25)

        for i, numWeapons in bp.Weapon do
            if bp.Weapon[i].Label == 'MegalithDeathBigBoom' then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
    end,

    DeathThread = function(self)
        local layer = self:GetCurrentLayer()

        if layer == 'Water' or layer == 'Seabed' then
            self.DeathThreadWater(self)
        else
            self.DeathThreadLand(self)
        end

        self:CreateWreckage(0.1)
        self:ShakeCamera(4, 3, 0, 0.25)
        self:Destroy()
    end,
}

TypeClass = XRL0403
