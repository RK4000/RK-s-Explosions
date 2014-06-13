#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0401/UEL0401_script.lua
#**  Author(s):  John Comes, David Tomandl, Gordon Duclos
#**
#**  Summary  :  UEF Mobile Factory Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

# This unit needs to not be allowed to build while underwater
# Additionally, if it goes underwater while building it needs to cancel the
#   current order

local TMobileFactoryUnit = import('/lua/terranunits.lua').TMobileFactoryUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local TDFRiotWeapon = WeaponsFile.TDFRiotWeapon
local TAALinkedRailgun = WeaponsFile.TAALinkedRailgun
local TANTorpedoAngler = WeaponsFile.TANTorpedoAngler

local EffectTemplate = import('/lua/EffectTemplates.lua')

local EffectUtil = import('/lua/EffectUtilities.lua')
local CreateUEFBuildSliceBeams = EffectUtil.CreateUEFBuildSliceBeams

local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

UEL0401 = Class(TMobileFactoryUnit) {
    Weapons = {
        RightTurret01 = Class(TDFGaussCannonWeapon) {},
        RightTurret02 = Class(TDFGaussCannonWeapon) {},
        LeftTurret01 = Class(TDFGaussCannonWeapon) {},
        LeftTurret02 = Class(TDFGaussCannonWeapon) {},
        RightRiotgun = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
        LeftRiotgun = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
        RightAAGun = Class(TAALinkedRailgun) {},
        LeftAAGun = Class(TAALinkedRailgun) {},
        Torpedo = Class(TANTorpedoAngler) {},
    },

    FxDamageScale = 2.5,
    PrepareToBuildAnimRate = 5,
    BuildAttachBone = 'Build_Attachpoint',

    RollOffBones = { 'Arm_Right03_Build_Emitter', 'Arm_Left03_Build_Emitter',},

    OnStopBeingBuilt = function(self,builder,layer)
        TMobileFactoryUnit.OnStopBeingBuilt(self,builder,layer)
        self.EffectsBag = {}
        self.PrepareToBuildManipulator = CreateAnimator(self)
        self.PrepareToBuildManipulator:PlayAnim(self:GetBlueprint().Display.AnimationBuild, false):SetRate(0)
        self.ReleaseEffectsBag = {}
        self.AttachmentSliderManip = CreateSlider(self, self.BuildAttachBone)
        ChangeState(self, self.IdleState)
    end,

    OnFailedToBuild = function(self)
        TMobileFactoryUnit.OnFailedToBuild(self)
        ChangeState(self, self.IdleState)
    end,

    OnLayerChange = function(self, new, old)
        TMobileFactoryUnit.OnLayerChange(self, new, old)
        if new == 'Land' then
            self:RestoreBuildRestrictions()
            self:RequestRefreshUI()
        elseif new == 'Seabed' then
            self:AddBuildRestriction(categories.ALLUNITS)
            self:RequestRefreshUI()         
        end
    end,

    IdleState = State {
        OnStartBuild = function(self, unitBuilding, order)
            self:SetBusy(true)
            TMobileFactoryUnit.OnStartBuild(self, unitBuilding, order)
            self.UnitBeingBuilt = unitBuilding
            self.PrepareToBuildManipulator:SetRate(self.PrepareToBuildAnimRate)
            ChangeState(self, self.BuildingState)
        end,

        Main = function(self)
            self.PrepareToBuildManipulator:SetRate(-self.PrepareToBuildAnimRate)
            self:DetachAll(self.BuildAttachBone)
            self:SetBusy(false)
        end,

    },


    BuildingState = State {

        Main = function(self)
            local unitBuilding = self.UnitBeingBuilt
            self.PrepareToBuildManipulator:SetRate(self.PrepareToBuildAnimRate)
            local bone = self.BuildAttachBone
            self:DetachAll(bone)
            if not self.UnitBeingBuilt:IsDead() then
                unitBuilding:AttachBoneTo( -2, self, bone )
                local unitHeight = unitBuilding:GetBlueprint().SizeY
                self.AttachmentSliderManip:SetGoal(0, unitHeight, 0 )
                self.AttachmentSliderManip:SetSpeed(-1)
                unitBuilding:HideBone(0,true)
            end
            WaitSeconds(3)
            unitBuilding:ShowBone(0,true)
            WaitFor( self.PrepareToBuildManipulator )
            local unitBuilding = self.UnitBeingBuilt
            self.UnitDoneBeingBuilt = false
        end,

        OnStopBuild = function(self, unitBeingBuilt)
            TMobileFactoryUnit.OnStopBuild(self, unitBeingBuilt)

            ChangeState(self, self.RollingOffState)
        end,

    },

    RollingOffState = State {

        Main = function(self)
            local unitBuilding = self.UnitBeingBuilt
            if not unitBuilding:IsDead() then
                unitBuilding:ShowBone(0,true)
            end
            WaitFor(self.PrepareToBuildManipulator)
            WaitFor(self.AttachmentSliderManip)
            self:CreateRollOffEffects()
            self.AttachmentSliderManip:SetSpeed(10)
            self.AttachmentSliderManip:SetGoal(0, 0, 17)
            WaitFor( self.AttachmentSliderManip )
            self.AttachmentSliderManip:SetGoal(0, -3, 17)
            WaitFor( self.AttachmentSliderManip )
            if not unitBuilding:IsDead() then
                unitBuilding:DetachFrom(true)
                self:DetachAll(self.BuildAttachBone)
                local  worldPos = self:CalculateWorldPositionFromRelative({0, 0, -15})
                IssueMoveOffFactory({unitBuilding}, worldPos)
            end
            self:DestroyRollOffEffects()
            ChangeState(self, self.IdleState)
        end,
    },

    CreateRollOffEffects = function(self)
        local army = self:GetArmy()
        local unitB = self.UnitBeingBuilt
        for k, v in self.RollOffBones do
            local fx = AttachBeamEntityToEntity(self, v, unitB, -1, army, EffectTemplate.TTransportBeam01)
            table.insert( self.ReleaseEffectsBag, fx)
            self.Trash:Add(fx)
            fx = AttachBeamEntityToEntity( unitB, -1, self, v, army, EffectTemplate.TTransportBeam02)
            table.insert( self.ReleaseEffectsBag, fx)
            self.Trash:Add(fx)
            fx = CreateEmitterAtBone( self, v, army, EffectTemplate.TTransportGlow01)
            table.insert( self.ReleaseEffectsBag, fx)
            self.Trash:Add(fx)
        end
    end,

    DestroyRollOffEffects = function(self)
        for k, v in self.ReleaseEffectsBag do
            v:Destroy()
        end
        self.ReleaseEffectsBag = {}
    end,
	
	DeathThread = function(self)
        self:PlayUnitSound('Destroyed')
        local army = self:GetArmy()
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'UEL0401', 2)##sdexplosion.CreateUEFLargeShortDurSmokeHitExplosionAtBone( self, 'UEL0401', 0.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedBigDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(2.855/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Turret_Left01', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.45/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Turret_Right02', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.55/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Attachpoint01', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.35/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Bay_Cover', 2)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.65/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Ramp', 1.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.55/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Attachpoint03', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.8/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Bay_Cover', 2)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.35/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Ramp', 1.25 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.45/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Attachpoint03', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.8/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Turret_Left01', 2)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(1.855/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Front_Core', 2)##sdexplosion.CreateUEFLargeShortDurSmokeHitExplosionAtBone( self, 'Front_Core', 0.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedBigDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(3.875/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Turret_Right02', 2)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.95/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Attachpoint01', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(1.35/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'UEL0401', 2)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.45/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Front_Core', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.25/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Rear_Core', 2)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.25/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Turret_Right01', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(1.15/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Turret_Right02', 2)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(1.35/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Turret_Left01', 2.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.25/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Turret_Left02', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.45/2)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Ramp', 2*1.5 )
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'MedDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.35/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Front_Core', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.45/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Attachpoint03', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(0.25/2)
        sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Turret_Right01', 1.25)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'SmallDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep2')
        WaitSeconds(1)
        sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'UEL0401', 5)
		self:PlayUnitSound('DestroyedStep4')
		WaitSeconds(0.05)
		sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Turret_Right01', 2.25)
		self:PlayUnitSound('DestroyedStep4')
		WaitSeconds(0.05)
		sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Turret_Right02', 2.25)
		self:PlayUnitSound('DestroyedStep4')
		WaitSeconds(0.05)
		sdexplosion.CreateUEFMediumHitExplosionAtBone( self, 'Turret_Left01', 5)
		self:PlayUnitSound('DestroyedStep4')
		WaitSeconds(0.05)
		sdexplosion.CreateUEFSmallHitExplosionAtBone( self, 'Turret_Left02', 2.25)
		sdexplosion.CreateUEFLargeHitExplosionAtBone( self, 'UEL0401', 17)
		self:PlayUnitSound('DestroyedStep4')
		WaitSeconds(0.05)
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'BigDeathBoom') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        self:PlayUnitSound('DestroyedStep3')
        self:CreateWreckage(0.1)
        self:Destroy()
    end,

}

TypeClass = UEL0401