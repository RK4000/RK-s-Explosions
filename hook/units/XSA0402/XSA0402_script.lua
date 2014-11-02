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
local EffectTemplate = import('/lua/EffectTemplates.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local BoomSoundBP = import('/mods/rks_explosions/boomsounds/BoomSounds.bp')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')
local Util = import('/lua/Utilities.lua')
local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function GetEffectTemplateFile(toggle)
	if toggle == 1 then
		return SDEffectTemplate
	else 
		return NEffectTemplate
	end
end

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
				RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, GetEffectTemplateFile(toggle).Ahwassa_Engine_PreFail_Electricity, 0.50, 'EngineFailing1' ) 
				##self:PlaySubBoomSound('SubBoomSoundseraphim')	
				RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, GetEffectTemplateFile(toggle).Ahwassa_Engine_PreFail_Smoke, 5.115, 'EngineFailing1' ) 				
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
	
	DeathThreadFn = function(self)
	local NumberForShake = (Util.GetRandomFloat( 1.5, 1.5 + 1 ) )/3.5
	self:PlayUnitSound('Killed3')
	self:PlayUnitSound('Killed')
	self:PlayUnitSound('Killed2')
	self:ShakeCamera( 30 * NumberForShake*7.5, NumberForShake*7.5, 0, NumberForShake*0.15 / 1.375)
	WaitSeconds(0.3)
	self:PlayUnitSound('Killed2')
	self:ShakeCamera( 30 * NumberForShake*7.5, NumberForShake*7.5, 0, NumberForShake*0.15 / 1.375)
	WaitSeconds(0.3)
	self:PlayUnitSound('Killed2')
	self:ShakeCamera( 30 * NumberForShake*7.5, NumberForShake*7.5, 0, NumberForShake*0.15 / 1.375)
	WaitSeconds(0.3)
	self:PlayUnitSound('Killed2')
	self:ShakeCamera( 30 * NumberForShake*4.5, NumberForShake*4.5, 0, NumberForShake*1.55 / 1.375)
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
		
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, GetEffectTemplateFile(toggle).Ahwassa_Engine_Critical_Explosion_Flashes, 4.20/2, 'EngineFail1' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, GetEffectTemplateFile(toggle).Ahwassa_Engine_Critical_Explosion_Sparks, 1.20/2, 'EngineFail1' )
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, GetEffectTemplateFile(toggle).Ahwassa_Engine_Critical_Smoke, 15.115/6, 'EngineFail1' ) 		
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, GetEffectTemplateFile(toggle).Ahwassa_Engine_Critical_Breach, 2, 'EngineFail2' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'Center_Muzzle', Army, GetEffectTemplateFile(toggle).Ahwassa_Engine_Critical_Breach_Electricity, 1, 'EngineFail2' ) 
		
		LOG(repr(self:GetVelocity()))
		RKExplosion.CreateInheritedVelocityDebrisProjectiles(self, 50, {self:GetVelocity()}, 17, 0.23, 50.35, ('/mods/rks_explosions/effects/entities/Ahwassa_Debris/Ahwassa_Debris_proj.bp'))
		
		self:ForkThread(self.DeathThreadFn)
		
		end
        SAirUnit.OnKilled(self, instigator, type, overkillRatio)
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
		self:PlayUnitSound('Destroyed')

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

		for k, v in self.EngineFail1 do
			v:Destroy()
		end
		
        if with == 'Water' then
		    for k,v in self.RKEmitters do v:ScaleEmitter(0) end
            self:PlayUnitSound('AirUnitWaterImpact')
            self.CreateEffects( self, EffectTemplate.Splashy, Army, 12  )
			DefaultExplosionsStock.CreateFlash( self, -1, 1, Army )
			self.CreateEffects( self, GetEffectTemplateFile(toggle).OilSlick, Army, 7 )
            #self:Destroy()
	    self:ForkThread(self.SinkIntoWaterAfterDeath, self.OverKillRatio )   
        else
            # This is a bit of safety to keep us from calling the death thread twice in case we bounce twice quickly
            if not self.DeathBounce then
                self:ForkThread(self.DeathThread, self.OverKillRatio )
                self.DeathBounce = 1
            end
		sdexplosion.CreateFactionalExplosionAtBone( self, 'XSA0402', 3.5, GetEffectTemplateFile(toggle).Ahwassa_Impact_Explosion )
		CreateLightParticle(self, -1, army, 10*2, 30*2, 'glow_02', 'ramp_quantum_warhead_flash_01')
		local NumberForShake = (Util.GetRandomFloat( 1.5, 1.5 + 1 ) )/3.5
		self:ShakeCamera( 30 * NumberForShake*8.5, NumberForShake*8.5, 0, NumberForShake*9.15 / 1.375)
        end
    end,

    OnAnimTerrainCollision = function(self, bone,x,y,z)
		self:PlayUnitSound('TerrainImpact')
        DamageArea(self, {x,y,z}, 5, 1000, 'Default', true, false)
        sdexplosion.CreateFactionalExplosionAtBone( self, bone, 2.5, GetEffectTemplateFile(toggle).BuildingExplosionTECH3seraphim )
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
    end,
    
    StartBeingBuiltEffects = function(self, builder, layer)
		SAirUnit.StartBeingBuiltEffects(self, builder, layer)
		self:ForkThread( EffectUtil.CreateSeraphimExperimentalBuildBaseThread, builder, self.OnBeingBuiltEffectsBag )
    end,    
}
TypeClass = XSA0402
