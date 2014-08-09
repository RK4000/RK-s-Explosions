#****************************************************************************
#**
#**  File     :  /cdimage/units/URA0401/URA0401_script.lua
#**  Author(s):  John Comes, Andres Mendez, Gordon Duclos
#**
#**  Summary  :  Cybran Gunship Script
#**
#**  Copyright © 2006 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CAirUnit = import('/lua/cybranunits.lua').CAirUnit
local CDFRocketIridiumWeapon = import('/lua/cybranweapons.lua').CDFRocketIridiumWeapon
local CAAMissileNaniteWeapon = import('/lua/cybranweapons.lua').CAAMissileNaniteWeapon
local CDFHeavyElectronBolterWeapon = import('/lua/cybranweapons.lua').CDFHeavyElectronBolterWeapon
local util = import('/lua/utilities.lua')
local Util = import('/lua/utilities.lua')
local fxutil = import('/lua/effectutilities.lua')
local RKEffectUtil = import('/mods/rks_explosions/lua/RKEffectUtilities.lua')
local BoomSoundBP = import('/mods/rks_explosions/boomsounds/BoomSounds.bp')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')

URA0401 = Class(CAirUnit) {
    Weapons = {
        Missile01 = Class(CDFRocketIridiumWeapon) {},
        Missile02 = Class(CDFRocketIridiumWeapon) {},
        HeavyBolter = Class(CDFHeavyElectronBolterWeapon){},
        HeavyBolterBack = Class(CDFHeavyElectronBolterWeapon){},
        AAMissile01 = Class(CAAMissileNaniteWeapon) {},
        AAMissile02 = Class(CAAMissileNaniteWeapon) {},
    },
    
    MovementAmbientExhaustBones = {
		'Exhaust_Left01',
		'Exhaust_Left02',
		'Exhaust_Left03',
		'Exhaust_Right01',
		'Exhaust_Right02',
		'Exhaust_Right03',
    },

    DestructionPartsChassisToss = {'URA0401',},
    DestroyNoFallRandomChance = 1.1,

    OnStopBeingBuilt = function(self,builder,layer)
        CAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.AnimManip = CreateAnimator(self)
        self.Trash:Add(self.AnimManip)
        #self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTakeOff, false):SetRate(1)
    end,
    
    OnMotionHorzEventChange = function(self, new, old )
		CAirUnit.OnMotionHorzEventChange(self, new, old)
	
		if self.ThrustExhaustTT1 == nil then 
			if self.MovementAmbientExhaustEffectsBag then
				fxutil.CleanupEffectBag(self,'MovementAmbientExhaustEffectsBag')
			else
				self.MovementAmbientExhaustEffectsBag = {}
			end
			self.ThrustExhaustTT1 = self:ForkThread(self.MovementAmbientExhaustThread)
		end
		
        if new == 'Stopped' and self.ThrustExhaustTT1 != nil then
			KillThread(self.ThrustExhaustTT1)
			fxutil.CleanupEffectBag(self,'MovementAmbientExhaustEffectsBag')
			self.ThrustExhaustTT1 = nil
        end		 
    end,
    
    MovementAmbientExhaustThread = function(self)
		while not self:IsDead() do
			local ExhaustEffects = {
				'/effects/emitters/dirty_exhaust_smoke_01_emit.bp',
				'/effects/emitters/dirty_exhaust_sparks_01_emit.bp',			
			}
			local ExhaustBeam = '/effects/emitters/missile_exhaust_fire_beam_03_emit.bp'
			local army = self:GetArmy()			
			
			for kE, vE in ExhaustEffects do
				for kB, vB in self.MovementAmbientExhaustBones do
					table.insert( self.MovementAmbientExhaustEffectsBag, CreateAttachedEmitter(self, vB, army, vE ))
					table.insert( self.MovementAmbientExhaustEffectsBag, CreateBeamEmitterOnEntity( self, vB, army, ExhaustBeam ))
				end
			end
			
			WaitSeconds(2)
			fxutil.CleanupEffectBag(self,'MovementAmbientExhaustEffectsBag')
							
			WaitSeconds(util.GetRandomFloat(1,7))
		end	
    end,

    OnMotionVertEventChange = function(self, new, old)
        CAirUnit.OnMotionVertEventChange(self, new, old)

        if ((new == 'Top' or new == 'Up') and old == 'Down') then
            self.AnimManip:SetRate(-1)
        elseif (new == 'Down') then
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationLand, false):SetRate(1.5)
        elseif (new == 'Up') then
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTakeOff, false):SetRate(1)
        end
    end,
	
	OnKilled = function(self, instigator, type, overkillRatio)
		
		
		if (self:GetCurrentLayer() == 'Air' ) then 
		
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
		local numBones = self:GetBoneCount() - 1
		
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, Util.GetRandomInt( 0, numBones), Army, SDEffectTemplate.SoulRipper_Ambient_Electricity, 0.40/2, 'HullDamage' ) 
		
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'URA0401', Army, SDEffectTemplate.SoulRipper_Ambient_Electricity_Upper, 0.60/2, 'HullDamage' ) 
		RKEffectUtil.CreateBoneEffectsAttachedWithBag(self, 'URA0401', Army, SDEffectTemplate.SoulRipper_Fall_Down_Smoke, 1, 'FallDown1')
		
		self:DestroyTopSpeedEffects()
        self:DestroyBeamExhaust()
        self.OverKillRatio = overkillRatio
		self:ForkThread(self.DeathThreadFn)
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
        
        CAirUnit.OnKilled(self, instigator, type, overkillRatio)
		end
    end,
	

	
	ExplodingThreadFn = function(self)
	local numBones = self:GetBoneCount() - 1
	WaitSeconds(6.25)
	LOG("Starting first series of booms")
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 3.5), SDEffectTemplate.SoulRipper_First_Series_Booms)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 3))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 3.5), SDEffectTemplate.SoulRipper_First_Series_Booms)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 3))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 3.5), SDEffectTemplate.SoulRipper_First_Series_Booms)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 3))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 3.5), SDEffectTemplate.SoulRipper_First_Series_Booms)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 3))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 3.5), SDEffectTemplate.SoulRipper_First_Series_Booms)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 3))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 3.5), SDEffectTemplate.SoulRipper_First_Series_Booms)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 3))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 3.5), SDEffectTemplate.SoulRipper_First_Series_Booms)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 3))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 3.5), SDEffectTemplate.SoulRipper_First_Series_Booms)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 3))
	###################### 2nd series of booms
	WaitSeconds(5)
	LOG("Starting second series of booms")
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 1.5), SDEffectTemplate.ExplosionTECH2cybran)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 1))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 1.5), SDEffectTemplate.ExplosionTECH2cybran)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 1))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 1.5), SDEffectTemplate.ExplosionTECH2cybran)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 1))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 1.5), SDEffectTemplate.ExplosionTECH2cybran)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 1))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 1.5), SDEffectTemplate.ExplosionTECH2cybran)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 1))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 1.5), SDEffectTemplate.ExplosionTECH2cybran)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 1))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 1.5), SDEffectTemplate.ExplosionTECH2cybran)
	self:PlayUnitSound('SubBooms')
	local rd = (Util.GetRandomFloat(0, 1))
	WaitSeconds(rd)
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 1.5), SDEffectTemplate.ExplosionTECH2cybran)
	self:PlayUnitSound('SubBooms')
	###################### 3rd series of booms
	WaitSeconds(5)
	LOG("Starting third series of booms")
	local rd = (Util.GetRandomFloat(0, 4))
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 4.5), SDEffectTemplate.ExplosionEXPMediumCybran)
	self:PlayUnitSound('SubBooms')
	WaitSeconds(rd)
	local rd = (Util.GetRandomFloat(0, 4))
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 4.5), SDEffectTemplate.ExplosionEXPMediumCybran)
	self:PlayUnitSound('SubBooms')
	WaitSeconds(rd)
	local rd = (Util.GetRandomFloat(0, 4))
	RKExplosion.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), Util.GetRandomFloat(1, 4.5), SDEffectTemplate.ExplosionEXPMediumCybran)
	self:PlayUnitSound('SubBooms')
	
	for k, v in self.HullDamage do
		v:Destroy()
	end
	###################### Final boom
	WaitSeconds(5)
	LOG(repr({self:GetVelocity()}))
	RKExplosion.CreateUpwardsVelocityDebrisProjectiles(self, 150, {self:GetVelocity()}, 12.75, 0.23, 50.35, ('/mods/rks_explosions/effects/entities/SR_Debris/SR_Debris_proj.bp'))
	RKExplosion.CreateFactionalExplosionAtBone( self, 'URA0401', Util.GetRandomFloat(1, 7.5), SDEffectTemplate.SoulRipper_Final_Boom)
	self:PlayUnitSound('FinalBoom')
	self:CreateWreckage()
	self:Destroy()
	
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
		
		for k, v in self.FallDown1 do
			v:Destroy()
		end

		
        if with == 'Water' then
		    for k,v in self.RKEmitters do v:ScaleEmitter(0) end
            self:PlayUnitSound('AirUnitWaterImpact')
            self.CreateEffects( self, EffectTemplate.Splashy, Army, 12  )
			DefaultExplosionsStock.CreateFlash( self, -1, 1, Army )
			self.CreateEffects( self, SDEffectTemplate.OilSlick, Army, 7 )
			
            ##self:Destroy()
	    self:ForkThread(self.SinkIntoWaterAfterDeath, self.OverKillRatio )   
        else
            # This is a bit of safety to keep us from calling the death thread twice in case we bounce twice quickly
            if not self.DeathBounce then
				self:ForkThread(self.ExplodingThreadFn)
                ##self:ForkThread(self.DeathThread, self.OverKillRatio )
                self.DeathBounce = 1
            end
		RKExplosion.CreateFactionalExplosionAtBone( self, 'URA0401', 3.5, SDEffectTemplate.SoulRipper_Impact_Explosion )
		CreateLightParticle(self, -1, army, 10*2, 30*2, 'glow_02', 'ramp_quantum_warhead_flash_01')
		
        end
    end,
	
	
	
	
	
	
}

TypeClass = URA0401