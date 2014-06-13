#****************************************************************************
#**
#**  File     :  /cdimage/units/UAL0401/UAL0401_script.lua
#**  Author(s):  John Comes, Gordon Duclos
#**
#**  Summary  :  Aeon Galactic Colossus Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit
local WeaponsFile = import ('/lua/aeonweapons.lua')
local ADFPhasonLaser = WeaponsFile.ADFPhasonLaser
local ADFTractorClaw = WeaponsFile.ADFTractorClaw
local utilities = import('/lua/utilities.lua')
local explosion = import('/lua/defaultexplosions.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

UAL0401 = Class(AWalkingLandUnit) {
    Weapons = {
        EyeWeapon = Class(ADFPhasonLaser) {},
        RightArmTractor = Class(ADFTractorClaw) {},
        LeftArmTractor = Class(ADFTractorClaw) {},
    },
    


    OnKilled = function(self, instigator, type, overkillRatio)
        AWalkingLandUnit.OnKilled(self, instigator, type, overkillRatio)
        local wep = self:GetWeaponByLabel('EyeWeapon')
        local bp = wep:GetBlueprint()
        if bp.Audio.BeamStop then
            wep:PlaySound(bp.Audio.BeamStop)
        end
        if bp.Audio.BeamLoop and wep.Beams[1].Beam then
            wep.Beams[1].Beam:SetAmbientSound(nil, nil)
        end
        for k, v in wep.Beams do
            v.Beam:Disable()
        end     
    end,
        
    DeathThread = function( self, overkillRatio , instigator)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonLargeHitExplosionAtBone( self, 'Torso', 5.0 )
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()}) 
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end          
        WaitSeconds(1/0.8/0.8)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonMediumHitExplosionAtBone( self, 'Right_Leg_B02', 3.0 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.85/0.8/0.8)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonMediumHitExplosionAtBone( self, 'Right_Leg_B01', 3.0 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.95/0.8/0.8)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonMediumHitExplosionAtBone( self, 'Left_Arm_B02', 3.0 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.75/0.8/0.8)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonMediumHitExplosionAtBone( self, 'Right_Arm_B01', 2.0 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateAeonMediumHitExplosionAtBone( self, 'Right_Leg_B01', 1.5 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathSmallBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(1.375105/0.8/0.8)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateAeonLargeHitExplosionAtBone( self, 'Torso', 4.5 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(2.5/0.8/0.8)
        sdexplosion.CreateAeonFinalLargeHitExplosionAtBone( self, 'Torso', 16.5 )    
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end    

        if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end
    
        

        self:DestroyAllDamageEffects()
        self:CreateWreckage( overkillRatio )

        # CURRENTLY DISABLED UNTIL DESTRUCTION
        # Create destruction debris out of the mesh, currently these projectiles look like crap,
        # since projectile rotation and terrain collision doesn't work that great. These are left in
        # hopes that this will look better in the future.. =)
        if( self.ShowUnitDestructionDebris and overkillRatio ) then
            if overkillRatio <= 1 then
                self.CreateUnitDestructionDebris( self, true, true, false )
            elseif overkillRatio <= 2 then
                self.CreateUnitDestructionDebris( self, true, true, false )
            elseif overkillRatio <= 3 then
                self.CreateUnitDestructionDebris( self, true, true, true )
            else #VAPORIZED
                self.CreateUnitDestructionDebris( self, true, true, true )
            end
        end
        
        self:PlayUnitSound('Destroyed')
        self:Destroy()
    end,
    
}
TypeClass = UAL0401