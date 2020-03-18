-- Scathis script
local explosion = import('/lua/defaultexplosions.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local sdexplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')

local oldURL0401 = URL0401
URL0401 = Class(oldURL0401) {
	
	DeathThreadLand = function(self, overkillratio, instigator) -- LAND BOOM
        local army = self:GetArmy()
        local NumberForShake = 0
		
		--Primary central explosion
		self:PlayUnitSound('DestroyedStep2')
		RKExplosion.CreateScorchMarkDecalRKSExpCyb(self, 12, army)
        sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'URL0401', 1.0)
		
		
		
		--Exhaust explosions
		WaitSeconds(0.8)
		
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Exhaust_Left_Front', Util.GetRandomFloat(0.5,1))
		WaitSeconds(Util.GetRandomFloat(0.1,0.3))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Exhaust_Right', Util.GetRandomFloat(0.5,1))
		WaitSeconds(Util.GetRandomFloat(0.0,0.3))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Exhaust_Right_Front', Util.GetRandomFloat(0.5,1))
		WaitSeconds(Util.GetRandomFloat(0.0,0.3))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Exhaust_Left', Util.GetRandomFloat(0.5,1))
		
		--Turret explosions
		WaitSeconds(0.5)
		
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Turret', Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Turret_Barrel_C_B0' .. Random(1,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_E_B0' .. Random(2,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Turret_Barrel_A_B0' .. Random(1,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_F_B0' .. Random(2,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.25,0.75))
		self:PlayUnitSound('DestroyedStep3alt')
		sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'Turret_Barrel_D_B03', Util.GetRandomFloat(0.2,0.7))
		if self:IsValidBone('Turret_Barrel_D_B03') then
            self:HideBone('Turret_Barrel_D_B03', true)
        end
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_B_B0' .. Random(2,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_C_B0' .. Random(1,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_E_B0' .. Random(2,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.2,0.5))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Turret', Util.GetRandomFloat(0.5,1))
		self:PlayUnitSound('DestroyedStep2')
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_A_B0' .. Random(1,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.1,0.4))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_C_B0' .. Random(2,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.35,0.85))
		self:PlayUnitSound('DestroyedStep3alt')
		sdexplosion.CreateCybranLargeHitExplosionAtBone(self, 'Turret_Barrel_B_B03', Util.GetRandomFloat(0.2,0.7))
		if self:IsValidBone('Turret_Barrel_B_B03') then
            self:HideBone('Turret_Barrel_B_B03', true)
        end
		WaitSeconds(Util.GetRandomFloat(0.2,0.5))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_C_B0' .. Random(2,3), Util.GetRandomFloat(0.2,0.7))
		WaitSeconds(Util.GetRandomFloat(0.2,0.6))
		self:PlayUnitSound('DestroyedStep2')
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_F_B0' .. Random(1,3), Util.GetRandomFloat(0.2,0.7))

		
        --Final explosion effects
		WaitSeconds(Util.GetRandomFloat(0.5,1.25))
		self:PlayUnitSound('DestroyedStep3')
		sdexplosion.CreateCybranFinalLargeHitExplosionAtBone(self, 'URL0401', 5)
		WaitSeconds(0.02)
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Turret_Barrel_C_B0' .. Random(1,3), Util.GetRandomFloat(0.3,0.7))
		self:PlayUnitSound('DestroyedStep2')
		WaitSeconds(0.02)
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_B_B0' .. Random(1,2), Util.GetRandomFloat(0.7,1.7))
		self:PlayUnitSound('DestroyedStep2')
		WaitSeconds(0.02)
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Turret_Barrel_A_B0' .. Random(1,3), Util.GetRandomFloat(0.3,0.7))
		self:PlayUnitSound('DestroyedStep2')
		WaitSeconds(0.02)
		sdexplosion.CreateCybranSmallHitExplosionAtBone(self, 'Turret_Barrel_D_B0' .. Random(1,2), Util.GetRandomFloat(0.7,1.7))
		self:PlayUnitSound('DestroyedStep2')
		WaitSeconds(0.02)
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Turret_Barrel_F_B0' .. Random(1,3), Util.GetRandomFloat(0.3,0.7))
		self:PlayUnitSound('DestroyedStep2')
		WaitSeconds(0.02)
		sdexplosion.CreateCybranMediumHitExplosionAtBone(self, 'Turret_Barrel_E_B0' .. Random(1,3), Util.GetRandomFloat(0.3,0.7))
		self:PlayUnitSound('DestroyedStep2')

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
