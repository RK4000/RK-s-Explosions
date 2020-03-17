#****************************************************************************
#**
#**  File     :  /cdimage/units/URL0304/URL0304_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Cybran Heavy Mobile Artillery Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CLandUnit = import('/lua/cybranunits.lua').CLandUnit
local CIFArtilleryWeapon = import('/lua/cybranweapons.lua').CIFArtilleryWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local Util = import('/lua/utilities.lua')
local barrelBones = { 'Turret_Barrel_F_B01', 'Turret_Barrel_E_B01', 'Turret_Barrel_D_B01', 'Turret_Barrel_C_B01', 'Turret_Barrel_B_B01', 'Turret_Barrel_A_B01' }
local recoilBones = { 'Turret_Barrel_F_B02', 'Turret_Barrel_E_B02', 'Turret_Barrel_D_B02', 'Turret_Barrel_C_B02', 'Turret_Barrel_B_B02', 'Turret_Barrel_A_B02' }
local muzzleBones = { 'Turret_Barrel_F_B03', 'Turret_Barrel_E_B03', 'Turret_Barrel_D_B03', 'Turret_Barrel_C_B03', 'Turret_Barrel_B_B03', 'Turret_Barrel_A_B03' }
local explosion = import('/lua/defaultexplosions.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

local oldURL0401 = URL0401
URL0401 = Class(oldURL0401) {
   
    Weapons = {
        Gun01 = Class(CIFArtilleryWeapon) {   
            
            OnCreate = function(self)
                CIFArtilleryWeapon.OnCreate(self)
                self.losttarget = false      
                self.initialaim = true
                self.PitchRotators = {}
                self.restdirvector = {}
                self.currentbarrel = 1                
            end,
            
            OnLostTarget = function(self)
                #Mark target lost 
                CIFArtilleryWeapon.OnLostTarget(self)
                self.losttarget = true                
            end,
            
            PlayFxWeaponPackSequence = function(self)
                if self.PitchRotators then
                    #We repacked the unit lets delete the rotators
                    for k, v in barrelBones do
                        if self.PitchRotators[k] then
                            self.PitchRotators[k]:Destroy()
                            self.PitchRotators[k] = nil
                        end
                    end                
                end
                self.losttarget = false      
                self.initialaim = true
                CIFArtilleryWeapon.PlayFxWeaponPackSequence(self)
                #self.currentbarrel = 1
            end, 
            
			LaunchEffects = function(self)   
				###LOG ("launch effects") 
				local FxLaunch = EffectTemplate.CArtilleryFlash02 

				for k, v in FxLaunch do
					CreateEmitterAtEntity( self.unit, self.unit:GetArmy(), v )
				end
			end, 	        
            
            CreateProjectileAtMuzzle = function(self, muzzle)
                if self.initialaim then
                    #CreateRotator(unit, bone, axis, [goal], [speed], [accel], [goalspeed])
                    self.Rotator = CreateRotator(self.unit, 'Turret_Fake', 'y')
                    self.unit.Trash:Add(self.Rotator)
                    #make pich rotators for each bone of the fake barrels
                    for k, v in barrelBones do
                        local tmprotator = CreateRotator(self.unit, v, 'x')
                        tmprotator:SetSpeed(30)
                        tmprotator:SetGoal(0)
                        self.PitchRotators[k] = tmprotator
                        self.unit.Trash:Add(self.PitchRotators[k])
                    end
                    self.Goal = 0
                
                    #Get the initial position after unpacking
                    local barrel = self.currentbarrel
                    self.restdirvector.x, self.restdirvector.y, self.restdirvector.z = self.unit:GetBoneDirection( barrelBones[barrel] )
                    local basedirvector = {}
                    basedirvector.x, basedirvector.y, basedirvector.z  = self.unit:GetBoneDirection('Turret_Aim')
                    self.basediftorest = Util.GetAngleInBetween(self.restdirvector, basedirvector)
                end
                if self.losttarget or self.initialaim then
                    #Setting pitch to aim barrel
                    local dirvector = {}
                    dirvector.x, dirvector.y, dirvector.z  = self.unit:GetBoneDirection('Turret_Aim_Barrel')
                    local basedirvector = {}
                    basedirvector.x, basedirvector.y, basedirvector.z  = self.unit:GetBoneDirection('Turret_Aim')
                    local basediftoaim = Util.GetAngleInBetween(dirvector, basedirvector)
                    self.pitchdif = self.basediftorest - basediftoaim
                    #Set all the barrels to the pitch of the aim barrel
                    for k, v in barrelBones do
                        self.PitchRotators[k]:SetGoal(self.pitchdif)
                    end
                    #Wait for pitch to finish before firing
                    WaitFor(self.PitchRotators[1])
                    WaitSeconds(0.2)
                    if self.losttarget then
                        self.losttarget = false
                    end 
                    if self.initialaim then
                        self.initialaim = false
                    end 
                end
                
                local muzzleIdx = 0
                for i=1, self.unit:GetBoneCount() do
                    if self.unit:GetBoneName(i) == 'Turret_Aim_Barrel_Muzzle' then
                        muzzleIdx = i
                        break
                    end
                end
                
                CIFArtilleryWeapon.CreateProjectileAtMuzzle(self, muzzleIdx)
                self:ForkThread(self.LaunchEffects)
                self:ForkThread(self.RotateBarrels)
            end,
	RotateBarrels = function(self)
                if not self.losttarget then
                    self.Rotator:SetSpeed(320)
                    self.Goal = self.Goal + 60
                    if self.Goal >= 360 then
                        self.Goal = 0
                    end
                    WaitSeconds(0.1)
                    self.Rotator:SetGoal(self.Goal)
                    self.currentbarrel = self.currentbarrel + 1
                    --Increment barrel number
                    if self.currentbarrel > 6 then
                        self.currentbarrel = 1
                    end
                    self.rotatedbarrel = true
                end
            end, 
        },		
    },
	
	DeathThreadLand = function(self, overkillratio, instigator) -- LAND BOOM
        local army = self:GetArmy()
        local NumberForShake = (Util.GetRandomFloat(1.5, 1.5 + 1))/3.5

        self:ShakeCamera(30 * NumberForShake*1.5, NumberForShake*1.5, 0, NumberForShake*1.5 / 1.375)
        self:PlayUnitSound('DestroyedStep2')
		
		RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 12, army)
		
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'URL0401', 0.25)
        sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'URL0401', 1.0)
		
		WaitSeconds(0.8)
		self:PlayUnitSound('DestroyedStep3')
		
        -- Create Initial explosion effects
        CreateAttachedEmitter(self, 'URL0401', army, '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp')
        CreateAttachedEmitter(self,'URL0401', army, '/effects/emitters/explosion_fire_sparks_02_emit.bp')
        
		sdexplosion.CreateCybranFinalLargeHitExplosionAtBone(self, 'URL0401', 9)
    end,
	
    DeathThread = function(self, overkillRatio, instigator)
        local army = self:GetArmy()
        local layer = self:GetCurrentLayer() 
        
        if layer == 'Water' or layer == 'Seabed' then
            self.DeathThreadWater(self, overkillRatio, instigator)
        else
            self.DeathThreadLand(self, overkillRatio, instigator)
        end

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
            else --VAPORIZED
                self.CreateUnitDestructionDebris(self, true, true, true)
            end
        end

        self:PlayUnitSound('DestroyedFinal')
        RKExplosion.CreateScorchMarkDecalRKSExpAeon(self, 20, army)
        self:Destroy()
	end,
}

TypeClass = URL0401
