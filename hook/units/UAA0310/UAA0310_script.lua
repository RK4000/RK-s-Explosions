#****************************************************************************
#**
#**  File     :  /cdimage/units/UAA0310/UAA0310_script.lua
#**  Author(s):  John Comes
#**
#**  Summary  :  Aeon CZAR Script
#**
#**  Copyright © 2006 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local aWeapons = import('/lua/aeonweapons.lua')
local AQuantumBeamGenerator = aWeapons.AQuantumBeamGenerator
local AAAZealotMissileWeapon = aWeapons.AAAZealotMissileWeapon
local AANDepthChargeBombWeapon = aWeapons.AANDepthChargeBombWeapon
local AAATemporalFizzWeapon = aWeapons.AAATemporalFizzWeapon
local explosion = import('/lua/defaultexplosions.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')


local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local Weapon = import('/lua/sim/Weapon.lua').Weapon
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFHeavyMicrowaveLaserGenerator = CybranWeaponsFile.CDFHeavyMicrowaveLaserGenerator
local CDFElectronBolterWeapon = CybranWeaponsFile.CDFElectronBolterWeapon
local CAAMissileNaniteWeapon = CybranWeaponsFile.CAAMissileNaniteWeapon
local explosion = import('/lua/defaultexplosions.lua')
local CreateDeathExplosion = explosion.CreateDefaultHitExplosionAtBone
local EffectTemplate = import('/lua/EffectTemplates.lua')
local utilities = import('/lua/Utilities.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local CANTorpedoLauncherWeapon = CybranWeaponsFile.CANTorpedoLauncherWeapon
local Entity = import('/lua/sim/Entity.lua').Entity
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local BoomSoundBP = import('/mods/rks_explosions/boomsounds/BoomSounds.bp')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

UAA0310 = Class(AAirUnit) {
	
	CreateDeathExplosionInitialShockwave = function( self )
        local blanketSides = 18*10
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1*10
        local blanketVelocity = 50

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)
			local BlanketOffset = 5
			local Deceleration = 0 ##-17/2*3*3

            ##local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, 1.0 +BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
           ##     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			##local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -0.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
           ##     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			##local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -1.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
           ##     :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			##local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -2.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            ##    :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -3.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -4.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdgeUpper/CZARShockwaveEdgeUpper_proj.bp', blanketX, -5.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -6.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			##local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -7.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            ##    :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			##local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -8.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            ##    :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			##local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -9.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            ##    :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			##local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARShockwaveEdge/CZARShockwaveEdge_proj.bp', blanketX, -10.5+BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
            ##    :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
        end        
    end,
	
	CreateDeathExplosionTareThroughEffect = function( self )
        local blanketSides = 18*2
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1*2
        local blanketVelocity = 34*4/3

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)
			local BlanketOffset = 0
			local Deceleration = 0 ##-17/2*3*3

            local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARCenterEffectUp/CZARCenterEffectUp_proj.bp', blanketX, 0 +BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
			local Blanketparts = self:CreateProjectile('/mods/rks_explosions/effects/entities/Aeon/CZARCenterEffectDown/CZARCenterEffectDown_proj.bp', blanketX, 0 +BlanketOffset, blanketZ + 0, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(Deceleration)
        end        
    end,

    DestroyNoFallRandomChance = 1.1,
    Weapons = {

        QuantumBeamGeneratorWeapon = Class(AQuantumBeamGenerator){},
        SonicPulseBattery1 = Class(AAAZealotMissileWeapon) {},
        SonicPulseBattery2 = Class(AAAZealotMissileWeapon) {},
        SonicPulseBattery3 = Class(AAAZealotMissileWeapon) {},
        SonicPulseBattery4 = Class(AAAZealotMissileWeapon) {},
        DepthCharge01 = Class(AANDepthChargeBombWeapon) {},
        DepthCharge02 = Class(AANDepthChargeBombWeapon) {},
        AAFizz01 = Class(AAATemporalFizzWeapon) {},
        AAFizz02 = Class(AAATemporalFizzWeapon) {},
    },

     
        	

    OnCreate = function(self)
       AAirUnit.OnCreate(self)
       lastDamageEffectThreshold = 1
    end,
 
    OnDamage = function(self, instigator, amount, vector, damageType)
        local maxHealth = self:GetMaxHealth()
        local oldHealthPercent = self:GetHealth()/maxHealth
        AAirUnit.OnDamage(self, instigator, amount, vector, damageType)
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
		
		local army = self:GetArmy()
		local bp = self:GetBlueprint()
		local Army = self:GetArmy()
		local Faction = self:GetFaction()
		local UnitTechLvl = self:GetUnitTechLvl()
		local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
		local Faction = self:GetFaction()
		local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')    
		local CreateBoneEffectsAttachedWithBag1 = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
        #LOG('*DEBUG: ManageDamageEffects, New: ', repr(newHealth), ' Old: ', repr(oldHealth))
 
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
				RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Attachpoint05', Army, SDEffectTemplate.CZAR_Center_Core_Breach01, 3.15, 'CoreBreachEffects1' )  
				RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Attachpoint05', Army, SDEffectTemplate.CZAR_Center_Core_Breach02, 3, 'CoreBreachEffects1' ) 
				RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'UAA0310', Army, SDEffectTemplate.CZAR_Air_Rushing_In, 1, 'CoreBreachEffects2' ) 
				RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Attachpoint05', Army, SDEffectTemplate.CZAR_Core_Rupture, 3, 'CoreBreachEffects1' )
				self:PlaySubBoomSound('CZARCoreDestroyed')	
				self.PlaySubBoomSound('CZARCoreDestroyed')					
            ##elseif oldHealth > 0.05 then
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
	sdexplosion.CreateFactionalExplosionAtBone( self, 'UAA0310', 8.5, SDEffectTemplate.ExplosionTECH2aeon )    
	self:PlayUnitSound('Killed')
	end,

    OnKilled = function(self, instigator, type, overkillRatio)
		if (self:GetCurrentLayer() == 'Air' ) then 
        
        local army = self:GetArmy()  
        local wep = self:GetWeaponByLabel('QuantumBeamGeneratorWeapon')
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

        self.detector = CreateCollisionDetector(self)
        self.Trash:Add(self.detector)
        self.detector:WatchBone('Left_Turret01_Muzzle')
        self.detector:WatchBone('Right_Turret01_Muzzle')
        self.detector:WatchBone('Left_Turret02_WepFocus')
        self.detector:WatchBone('Right_Turret02_WepFocus')
        self.detector:WatchBone('Left_Turret03_Muzzle')
        self.detector:WatchBone('Right_Turret03_Muzzle')
        self.detector:WatchBone('Attachpoint01')
        self.detector:WatchBone('Attachpoint02')
        self.detector:EnableTerrainCheck(true)
        self.detector:Enable()


        ##AAirUnit.OnKilled(self, instigator, type, overkillRatio)
		
		####Needed for custom booms####
		CreateAlmostDeadEffects = function( self, EffectTable, army, scale)
			for k, v in EffectTable do
			if self.RKEmittersAlmostDead == nil then self.RKEmittersAlmostDead = {} end
			local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmittersAlmostDead, emitter)
			self.Trash:Add(emitter)
			end
		end
		
		CreateEffects = function( self, EffectTable, army, scale)
			for k, v in EffectTable do
			if self.RKEmitters == nil then self.RKEmitters = {} end
			local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
			self.Trash:Add(emitter)
			end
		end
		
		local bp = self:GetBlueprint()
        local Army = self:GetArmy()
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
		
		if ((self.CoreBreachEffects1) != nil) then
		for k, v in self.CoreBreachEffects1 do
            v:Destroy()
        end
		end
		
		if ((self.CoreBreachEffects2) != nil) then
		for k, v in self.CoreBreachEffects2 do
            v:Destroy()
        end
		end
		
		
		##sdexplosion.CreateFactionalExplosionAtBone( self, 'Attachpoint02', 0.5, SDEffectTemplate.CZAR_Center_FallDown_Smoke )    
		##sdexplosion.CreateFactionalExplosionAtBone( self, 'Attachpoint06', 0.5, SDEffectTemplate.CZAR_Center_FallDown_Smoke )    
		##sdexplosion.CreateFactionalExplosionAtBone( self, 'Attachpoint08', 0.5, SDEffectTemplate.CZAR_Center_FallDown_Smoke )    
		
		self.CreateEffects( self, SDEffectTemplate.CZAR_Center_FallDown_Smoke, Army, 1 )
		self.CreateEffects( self, SDEffectTemplate.CZAR_Center_Charge, Army, 4 )
		RKExplosion.CreateInheritedVelocityDebrisProjectiles(self, 150, {self:GetVelocity()}, 12.75, 0.23, 50.35, ('/mods/rks_explosions/effects/entities/CZAR_Debris/CZAR_Debris_proj.bp'))
		self:CreateDeathExplosionTareThroughEffect()
		sdexplosion.CreateFactionalExplosionAtBone( self, 'UAA0310', 0.5, SDEffectTemplate.CZAR_Initial_Center_Explosion )    
		self:CreateDeathExplosionInitialShockwave()

        self:ForkThread(self.DeathThreadFn)
		
		end
        AAirUnit.OnKilled(self, instigator, type, overkillRatio)

    end,
	
	OnImpact = function(self, with, other)
		local army = self:GetArmy()
		local bp = self:GetBlueprint()
		local Army = self:GetArmy()
		local Faction = self:GetFaction()
		local UnitTechLvl = self:GetUnitTechLvl()
		local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
		local Faction = self:GetFaction()
		local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')    
	

		 # Damage the area we have impacted with.
        local bp = self:GetBlueprint()
        local i = 1
        local numWeapons = table.getn(bp.Weapon)

        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'DeathImpact') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end

        if with == 'Water' then
		    for k,v in self.RKEmitters do v:ScaleEmitter(0) end
            self:PlayUnitSound('AirUnitWaterImpact')
            self.CreateEffects( self, EffectTemplate.Splashy, Army, 12  )
			DefaultExplosionsStock.CreateFlash( self, -1, 1, Army )
			self.CreateEffects( self, SDEffectTemplate.OilSlick, Army, 7 )
            #self:Destroy()
	    self:ForkThread(self.SinkIntoWaterAfterDeath, self.OverKillRatio )   
        else
            # This is a bit of safety to keep us from calling the death thread twice in case we bounce twice quickly
            if not self.DeathBounce then
                self:ForkThread(self.DeathThread, self.OverKillRatio )
                self.DeathBounce = 1
            end
		sdexplosion.CreateFactionalExplosionAtBone( self, 'UAA0310', 4.5, SDEffectTemplate.CZARCenterImpactExplosion )
        end
    end,

    OnAnimTerrainCollision = function(self, bone,x,y,z)
		self:PlayUnitSound('TerrainImpact')
        DamageArea(self, {x,y,z}, 5, 1000, 'Default', true, false)
        sdexplosion.CreateFactionalExplosionAtBone( self, bone, 3.0, SDEffectTemplate.ExplosionTECH3aeon )
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
    end,

    BuildAttachBone = 'UAA0310',

    OnStopBeingBuilt = function(self,builder,layer)
        AAirUnit.OnStopBeingBuilt(self,builder,layer)
        ChangeState(self, self.IdleState)
    end,

    OnFailedToBuild = function(self)
        AAirUnit.OnFailedToBuild(self)
        ChangeState(self, self.IdleState)
    end,

    IdleState = State {
        Main = function(self)
            self:DetachAll(self.BuildAttachBone)
            self:SetBusy(false)
        end,

        OnStartBuild = function(self, unitBuilding, order)
            AAirUnit.OnStartBuild(self, unitBuilding, order)
            self.UnitBeingBuilt = unitBuilding
            ChangeState(self, self.BuildingState)
        end,
    },

    BuildingState = State {
        Main = function(self)
            local unitBuilding = self.UnitBeingBuilt
            self:SetBusy(true)
            local bone = self.BuildAttachBone
            self:DetachAll(bone)
            unitBuilding:HideBone(0, true)
            self.UnitDoneBeingBuilt = false
        end,

        OnStopBuild = function(self, unitBeingBuilt)
            AAirUnit.OnStopBuild(self, unitBeingBuilt)
            ChangeState(self, self.FinishedBuildingState)
        end,
    },

    FinishedBuildingState = State {
        Main = function(self)
            self:SetBusy(true)
            local unitBuilding = self.UnitBeingBuilt
            unitBuilding:DetachFrom(true)
            self:DetachAll(self.BuildAttachBone)
            if self:TransportHasAvailableStorage() then
                self:AddUnitToStorage(unitBuilding)
            else
                local worldPos = self:CalculateWorldPositionFromRelative({0, 0, -20})
                IssueMoveOffFactory({unitBuilding}, worldPos)
                unitBuilding:ShowBone(0,true)
            end
            self:SetBusy(false)
            self:RequestRefreshUI()
            ChangeState(self, self.IdleState)
        end,
    },
}

TypeClass = UAA0310
