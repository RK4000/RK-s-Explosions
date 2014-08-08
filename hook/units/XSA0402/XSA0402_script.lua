#****************************************************************************
#**
#**  File     :  /units/XSA0402/XSA0402_script.lua
#**  Author(s):  Greg Kohne, Gordon Duclos
#**
#**  Summary  :  Seraphim Experimental Strategic Bomber Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SAALosaareAutoCannonWeapon = SeraphimWeapons.SAALosaareAutoCannonWeapon
local SB0OhwalliExperimentalStrategicBombWeapon = SeraphimWeapons.SB0OhwalliExperimentalStrategicBombWeapon
local EffectUtil = import('/lua/EffectUtilities.lua')
local explosion = import('/lua/defaultexplosions.lua')

local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local BoomSoundBP = import('/mods/rks_explosions/boomsounds/BoomSounds.bp')

XSA0402 = Class(SAirUnit) {
	
    DestroyNoFallRandomChance = 1.1,
    
    Weapons = {
        Bomb = Class(SB0OhwalliExperimentalStrategicBombWeapon) {},
        RightFrontAutocannon = Class(SAALosaareAutoCannonWeapon) {},
        LeftFrontAutocannon = Class(SAALosaareAutoCannonWeapon) {},
        RightRearAutocannon = Class(SAALosaareAutoCannonWeapon) {},
        LeftRearAutocannon = Class(SAALosaareAutoCannonWeapon) {},
    },
    
    ContrailEffects = {'/effects/emitters/contrail_ser_ohw_polytrail_01_emit.bp',},

	OnCreate = function(self)
       SAirUnit.OnCreate(self)
       lastDamageEffectThreshold = 1
	end,
	
    OnDamage = function(self, instigator, amount, vector, damageType)
        local maxHealth = self:GetMaxHealth()
        local oldHealthPercent = self:GetHealth()/maxHealth
        SAirUnit.OnDamage(self, instigator, amount, vector, damageType)
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
				RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, SDEffectTemplate.Ahwassa_Engine_PreFail_Electricity, 0.50, 'EngineFailing1' ) 
				##self:PlaySubBoomSound('SubBoomSoundseraphim')	
				RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, SDEffectTemplate.Ahwassa_Engine_PreFail_Smoke, 5.115, 'EngineFailing1' ) 				
            end
        else
            if newHealth <= 0.10 and newHealth > 0 then
                                for k, v in self.DamageEffectsBag[4] do
                    v:Destroy()
                end
            elseif newHealth <= 0.25 and newHealth > 0.10 then
                for k, v in self.EngineFailing1 do
					v:Destroy()
				end
				for k, v in self.EngineFailing1 do
					v:Destroy()
				end
				for k, v in self.DamageEffectsBag[3] do
                    v:Destroy()
                end
            elseif newHealth <= 0.5 and newHealth > 0.25 then
                for k, v in self.DamageEffectsBag[2] do
                    v:Destroy()
                end
				for k, v in self.EngineFailing1 do
					v:Destroy()
				end
				for k, v in self.EngineFailing1 do
					v:Destroy()
				end
            elseif newHealth <= 0.75 and newHealth > 0.5 then
                for k, v in self.DamageEffectsBag[1] do
                    v:Destroy()
                end
				for k, v in self.EngineFailing1 do
					v:Destroy()
				end
				for k, v in self.EngineFailing1 do
					v:Destroy()
				end
            elseif newHealth > 0.75 then
                self:DestroyAllDamageEffects()    
				for k, v in self.EngineFailing1 do
					v:Destroy()
				end
				for k, v in self.EngineFailing1 do
					v:Destroy()
				end
            end
        end
    end,
	
	
    OnKilled = function(self, instigator, type, overkillRatio)
		if (self:GetCurrentLayer() == 'Air' ) then 
		
			self.detector = CreateCollisionDetector(self)
			self.Trash:Add(self.detector)
			self.detector:WatchBone('Nose_Extent')
			self.detector:WatchBone('Right_Wing_Extent')
			self.detector:WatchBone('Left_Wing_Extent')
			self.detector:WatchBone('Tail_Extent')
			self.detector:EnableTerrainCheck(true)
			self.detector:Enable()
		
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
		
		if ((self.EngineFailing1) != nil) then
			for k, v in self.EngineFailing1 do
				v:Destroy()
			end
		end  
		
		local bp = self:GetBlueprint()
        local Army = self:GetArmy()
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
		
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, SDEffectTemplate.Ahwassa_Engine_Critical_Explosion_Flashes, 4.20/2, 'EngineFail1' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, SDEffectTemplate.Ahwassa_Engine_Critical_Explosion_Sparks, 1.20/2, 'EngineFail1' )
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, SDEffectTemplate.Ahwassa_Engine_Critical_Smoke, 15.115/6, 'EngineFail1' ) 		
		
		self:DestroyTopSpeedEffects()
        self:DestroyBeamExhaust()
        self.OverKillRatio = overkillRatio
        self:PlayUnitSound('Killed')
        self:DoUnitCallbacks('OnKilled')
        self:OnKilledVO()
        if instigator and IsUnit(instigator) then
            instigator:OnKilledUnit(self)
        end
		
		else
        self.DeathBounce = 1
        if instigator and IsUnit(instigator) then
            instigator:OnKilledUnit(self)
        end
        
        SAirUnit.OnKilled(self, instigator, type, overkillRatio)
		end
    end,

    OnAnimTerrainCollision = function(self, bone,x,y,z)
        DamageArea(self, {x,y,z}, 5, 1000, 'Default', true, false)
        explosion.CreateDefaultHitExplosionAtBone( self, bone, 5.0 )
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
    end,
    
    StartBeingBuiltEffects = function(self, builder, layer)
		SAirUnit.StartBeingBuiltEffects(self, builder, layer)
		self:ForkThread( EffectUtil.CreateSeraphimExperimentalBuildBaseThread, builder, self.OnBeingBuiltEffectsBag )
    end,    
}
TypeClass = XSA0402