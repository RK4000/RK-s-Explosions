#****************************************************************************
#**
#**  File     :  /units/XRL0403/XRL0403_script.lua
#**
#**  Summary  :  Megalith script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************


local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local MobileUnit = import('/lua/defaultunits.lua').MobileUnit
local explosion = import('/lua/defaultexplosions.lua')
local CreateDeathExplosion = explosion.CreateDefaultHitExplosionAtBone
local EffectTemplate = import('/lua/EffectTemplates.lua')
local utilities = import('/lua/Utilities.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local Entity = import('/lua/sim/Entity.lua').Entity

local Weapon = import('/lua/sim/Weapon.lua').Weapon
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFHvyProtonCannonWeapon = CybranWeaponsFile.CDFHvyProtonCannonWeapon
local CANNaniteTorpedoWeapon = CybranWeaponsFile.CANNaniteTorpedoWeapon
local CIFSmartCharge = CybranWeaponsFile.CIFSmartCharge
local CAABurstCloudFlakArtilleryWeapon = CybranWeaponsFile.CAABurstCloudFlakArtilleryWeapon
local CDFBrackmanCrabHackPegLauncherWeapon = CybranWeaponsFile.CDFBrackmanCrabHackPegLauncherWeapon

local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

XRL0403 = Class(CWalkingLandUnit) {
    WalkingAnimRate = 1.2,

    Weapons = {
        ParticleGunRight = Class(CDFHvyProtonCannonWeapon) {},
        ParticleGunLeft = Class(CDFHvyProtonCannonWeapon) {},
        Torpedo01 = Class(CANNaniteTorpedoWeapon) {},
        Torpedo02 = Class(CANNaniteTorpedoWeapon) {},
        Torpedo03 = Class(CANNaniteTorpedoWeapon) {},
        Torpedo04 = Class(CANNaniteTorpedoWeapon) {},
        AntiTorpedo = Class(CIFSmartCharge) {},
        AAGun = Class(CAABurstCloudFlakArtilleryWeapon) {},
        HackPegLauncher= Class(CDFBrackmanCrabHackPegLauncherWeapon){},
    },
    
    DisableAllButHackPegLauncher= function(self)
        self:SetWeaponEnabledByLabel('ParticleGunRight', false) ###Disable all other weapons.
        self:SetWeaponEnabledByLabel('ParticleGunLeft', false)
        self:SetWeaponEnabledByLabel('AAGun', false)
        self:SetWeaponEnabledByLabel('Torpedo01', false)
        
        self:ShowBone('Missile_Turret', true)
    end,
    
    EnableHackPegLauncher= function(self)
        self:SetWeaponEnabledByLabel('HackPegLauncher', true)   ###Enable and show hack-peg launcher.
    end,
    
    OnCreate= function(self)
        CWalkingLandUnit.OnCreate(self)
        self:SetWeaponEnabledByLabel('HackPegLauncher', false)
        if self:IsValidBone('Missile_Turret') then
            self:HideBone('Missile_Turret', true)
        end
    end, 
    
    OnStartBeingBuilt = function(self, builder, layer)
        CWalkingLandUnit.OnStartBeingBuilt(self, builder, layer)
        if not self.AnimationManipulator then
            self.AnimationManipulator = CreateAnimator(self)
            self.Trash:Add(self.AnimationManipulator)
        end
        self.AnimationManipulator:PlayAnim(self:GetBlueprint().Display.AnimationActivate, false):SetRate(0)
    end,
    
    OnStopBeingBuilt = function(self,builder,layer)
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        local layer = self:GetCurrentLayer()
        # If created with F2 on land, then play the transform anim.
        if(layer == 'Land') then
	        self:SetWeaponEnabledByLabel('AAGun', true)       
			# Disable Torpedo
	        self:SetWeaponEnabledByLabel('Torpedo01', false)
        elseif (layer == 'Seabed') then
            self:EnableUnitIntel('SonarStealth')
			# Enable Torpedo
	        self:SetWeaponEnabledByLabel('Torpedo01', true)      
        end
        self.WeaponsEnabled = true
        
        if self:IsValidBone('Missile_Turret') then
            self:HideBone('Missile_Turret', true)
        end
        
        if self.AnimationManipulator then
            self:SetUnSelectable(true)
            self.AnimationManipulator:SetRate(1)
            
            self:ForkThread(function()
                WaitSeconds(self.AnimationManipulator:GetAnimationDuration()*self.AnimationManipulator:GetRate())
                self:SetUnSelectable(false)
                self.AnimationManipulator:Destroy()
            end)
        end
    end,

	OnLayerChange = function(self, new, old)
		CWalkingLandUnit.OnLayerChange(self, new, old)
		if self.WeaponsEnabled then
			local LandSpeedMult = self:GetBlueprint().Physics.WaterSpeedMultiplier
			if( new == 'Land' ) then
				# Enable Land weapons
			    if self.SonarEnt then
                    self.SonarEnt:Destroy()
                end
			    # Disable Torpedo
	            self:SetWeaponEnabledByLabel('Torpedo01', false)
    	        self:SetWeaponEnabledByLabel('AAGun', true)
	 	  	  # Set movement speed back to default
              self:SetSpeedMult(1)
			elseif ( new == 'Seabed' ) then
				# Enable Torpedo
	            self:SetWeaponEnabledByLabel('Torpedo01', true)
	 			# Increase speed while in water
              self:SetSpeedMult(LandSpeedMult)
			end
		end
	end,
	
    CreateDamageEffects = function(self, bone, army )
        for k, v in EffectTemplate.DamageFireSmoke01 do
            CreateAttachedEmitter( self, bone, army, v ):ScaleEmitter(1.5)
        end
    end,	

    CreateDeathExplosionDustRing = function( self )
        local blanketSides = 18
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1
        local blanketVelocity = 2.8

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)

            local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 1.5, blanketZ + 4, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
        end        
    end,

    CreateFirePlumes = function( self, army, bones, yBoneOffset )
        local proj, position, offset, velocity
        local basePosition = self:GetPosition()
        for k, vBone in bones do
            position = self:GetPosition(vBone)
            offset = utilities.GetDifferenceVector( position, basePosition )
            velocity = utilities.GetDirectionVector( position, basePosition ) # 
            velocity.x = velocity.x + utilities.GetRandomFloat(-0.3, 0.3)
            velocity.z = velocity.z + utilities.GetRandomFloat(-0.3, 0.3)
            velocity.y = velocity.y + utilities.GetRandomFloat( 0.0, 0.3)
            proj = self:CreateProjectile('/effects/entities/DestructionFirePlume01/DestructionFirePlume01_proj.bp', offset.x, offset.y + yBoneOffset, offset.z, velocity.x, velocity.y, velocity.z)
            proj:SetBallisticAcceleration(utilities.GetRandomFloat(-1, -2)):SetVelocity(utilities.GetRandomFloat(3, 4)):SetCollision(false)
            
            local emitter = CreateEmitterOnEntity(proj, army, '/effects/emitters/destruction_explosion_fire_plume_02_emit.bp')

            local lifetime = utilities.GetRandomFloat( 12, 22 )
        end
    end,

    CreateExplosionDebris = function( self, army )
        for k, v in EffectTemplate.ExplosionDebrisLrg01 do
            CreateAttachedEmitter( self, 'XRL0403', army, v ):OffsetEmitter( 0, 5, 0 )
        end
    end,

    DeathThread = function(self)
        local army = self:GetArmy()
        self:PlayUnitSound('Destroyed')
        sdexplosion.CreateCybranLargeHitExplosionAtBone( self, 'AA_Turret', 2.25 )
        CreateAttachedEmitter(self, 'XRL0403', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/distortion_ring_01_emit.bp')
        self:CreateFirePlumes( army, {'XRL0403'}, 0 )

        self:CreateFirePlumes( army, {'Right_Leg01_B01','Right_Leg02_B01','Left_Leg02_B01',}, 0.5 )

        self:CreateExplosionDebris( army )
        self:CreateExplosionDebris( army )
        self:CreateExplosionDebris( army )

        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(0.15)
        sdexplosion.CreateCybranLargeHitExplosionAtBone( self, 'Right_Leg01_B02', 2.25 )
        CreateAttachedEmitter(self, 'XRL0403', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/distortion_ring_01_emit.bp')
        self:CreateFirePlumes( army, {'XRL0403'}, 0 )

        self:CreateFirePlumes( army, {'Right_Leg01_B01','Right_Leg02_B01','Left_Leg02_B01',}, 0.5 )

        self:CreateExplosionDebris( army )
        self:CreateExplosionDebris( army )
        self:CreateExplosionDebris( army )

        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(2.95/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Left_Leg01_B01', 0.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Right_Leg02_B01', 0.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Left_Leg01_B01', 0.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.75/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Right_Leg02_B01', 0.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(1.0/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Left_Leg02_B02', 0.25 )
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Flare_Muzzle06', 0.25 )
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Torpedo_Muzzle07', 0.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        
        WaitSeconds(2.5/1.5)
        self:PlayUnitSound('DestroyedStep3')
        CreateAttachedEmitter(self, 'XRL0403', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/distortion_ring_01_emit.bp')
        sdexplosion.CreateCybranVeryLargeHitExplosionAtBone( self, 'AA_Turret', 2.25 )
        sdexplosion.CreateCybranVeryLargeHitExplosionAtBone( self, 'Flare_Muzzle01', 2.25 )
        sdexplosion.CreateCybranVeryLargeHitExplosionAtBone( self, 'Right_Leg01_B02', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(3.2/1.5)
        self:PlayUnitSound('DestroyedStep2')
        CreateAttachedEmitter(self, 'XRL0403', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/distortion_ring_01_emit.bp')
        sdexplosion.CreateCybranLargeHitExplosionAtBone( self, 'Left_Leg02_B02', 2.25 )
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Flare_Muzzle06', 2.25 )
        sdexplosion.CreateCybranLargeHitExplosionAtBone( self, 'Torpedo_Muzzle07', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(2.05/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'AA_Turret', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Right_Leg02_B01', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Left_Leg02_B02', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Torpedo_Muzzle03', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'AA_Muzzle', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Torpedo_Muzzle12', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.85/1.5)
        self:PlayUnitSound('DestroyedStep2')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'Left_Leg01_B01', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathMedBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(2.85)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateCybranMediumHitExplosionAtBone( self, 'AA_Turret', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.15/1)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateCybranFinalLargeHitExplosionAtBone( self, 'Right_Leg02_B02', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.15/1.5)
        self:PlayUnitSound('DestroyedStep3')
        sdexplosion.CreateCybranFinalLargeHitExplosionAtBone( self, 'Right_Leg01_B02', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        WaitSeconds(0.15)
        self:PlayUnitSound('DestroyedStep3')
        CreateAttachedEmitter(self, 'XRL0403', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/distortion_ring_01_emit.bp')
        sdexplosion.CreateCybranFinalLargeHitExplosionAtBone( self, 'AA_Turret', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
		
		WaitSeconds(0.15)
        self:PlayUnitSound('DestroyedStep3')
        CreateAttachedEmitter(self, 'XRL0403', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp'):OffsetEmitter( 0, 5, 0 )
        CreateAttachedEmitter(self,'XRL0403', army, '/effects/emitters/distortion_ring_01_emit.bp')
        sdexplosion.CreateCybranFinalLargeHitExplosionAtBone( self, 'Left_Leg01_B02', 2.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MegalithDeathBigBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:CreateWreckage(0.1)

        self:ShakeCamera(4, 3, 0, 0.25)
        self:Destroy()
    end,
    
    
    OnMotionHorzEventChange = function( self, new, old )
        CWalkingLandUnit.OnMotionHorzEventChange(self, new, old)
        
        if ( old == 'Stopped' ) then
            local bpDisplay = self:GetBlueprint().Display
            if bpDisplay.AnimationWalk and self.Animator then
                self.Animator:SetDirectionalAnim(true)
                self.Animator:SetRate(bpDisplay.AnimationWalkRate)
            end
         end
    end,
}

TypeClass = XRL0403
