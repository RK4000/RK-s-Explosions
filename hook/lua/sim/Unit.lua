local oldUnit = Unit
rklog = false

##Includes changes to the fundamental Unit class,
##in case some type of unit does not have a specifically modified OnKilled to use the 
##factional explosions, this acts as sort of a backup to still spawn them. 
##It is also neccesary because the changes here remove the current generic
##explosion, since it's replaced by the factional ones.

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle
local Util = import('/lua/utilities.lua')
local SDExplosions = import('/mods/rks_explosions/lua/SDExplosions.lua')





Unit = Class( oldUnit ) {

	GetAnimMultNumberByTechLvl = function(self, UnitTechLvl)

    	if UnitTechLvl == 'TECH1' then
   		return 2.0
    	elseif UnitTechLvl == 'TECH2' then
    		return 2.3
    	elseif UnitTechLvl == 'TECH3' then
    		return 2.875
    	else
    		return 3.0
    	end	
    end,

	PlayAnimationThreadShips = function(self, anim, rate)
		local bp = self:GetBlueprint().Display[anim]
		local TechLvl = self:GetUnitTechLvl()
		local AnimMultNumber = self:GetAnimMultNumberByTechLvl(TechLvl or 'TECH1')
		LOG(AnimMultNumber)
		if bp then
			local animBlock = self:ChooseAnimBlock( bp )
			if animBlock.Mesh then
				self:SetMesh(animBlock.Mesh)
			end
			if animBlock.Animation then
				local sinkAnim = CreateAnimator(self)
				self:StopRocking()
				self.DeathAnimManip = sinkAnim
				sinkAnim:PlayAnim(animBlock.Animation)
				rate = rate or 1
				if animBlock.AnimationRateMax and animBlock.AnimationRateMin then
					rate = Random(animBlock.AnimationRateMin * 10, animBlock.AnimationRateMax * 10) / 10
				end
				sinkAnim:SetRate(rate/AnimMultNumber)
				self.Trash:Add(sinkAnim)
				WaitFor(sinkAnim)
			end
		end
	end,

    GetFaction = function(self)
    return string.lower(self:GetBlueprint().General.FactionName or 'UEF')
    end,

    GetUnitTechLvl = function(self)
      	local Categories = self:GetBlueprint().Categories or {}
      	local Cats = {'TECH1', 'TECH2', 'TECH3' }
    	local UnitTechLvl = 'TECH1'
    	
    	for index, Cat in Cats do
    		if table.find(Categories, Cat) then
    			UnitTechLvl = Cat
    			break
    		end
    	end
    	
    	
     	return UnitTechLvl
     end,
	 
	 GetUnitLayer = function(self)
      	local Categories = self:GetBlueprint().Categories or {}
      	local Cats = {'NAVAL', 'LAND', 'AIR', 'STRUCTURE' }
    	local UnitTechLvl = 'NAVAL'
    	
    	for index, Cat in Cats do
    		if table.find(Categories, Cat) then
    			UnitLayer = Cat
    			break
    		end
    	end
    	
    	
     	return UnitLayer
     end,
	 
	 
    GetNumberByTechLvl = function(self, UnitTechLvl)

    	if UnitTechLvl == 'TECH1' then
   		return 0.425
    	elseif UnitTechLvl == 'TECH2' then
    		return 0.76/1.075
    	elseif UnitTechLvl == 'TECH3' then
    		return 1.025/1.175
    	else
    		return 1
    	end	
    end,

    CreateEffects = function( self, EffectTable, army, scale)
        for k, v in EffectTable do
            self.Trash:Add(CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale))
        end
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        self.Dead = true
        local bp = self:GetBlueprint()
		local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')
		
		if EntityCategoryContains(categories.AIR, self) then
		self:ForkThread(SDExplosions.AirImpactWater)
		else
		self:ForkThread(SDExplosions.ExplosionLand) ##Want to fork this from another fork (DeathThread) but that does odd things.
		end
		
        if self:GetCurrentLayer() == 'Water' and bp.Physics.MotionType == 'RULEUMT_Hover' then
            self:PlayUnitSound('HoverKilledOnWater')
        end
        
        if self:GetCurrentLayer() == 'Land' and bp.Physics.MotionType == 'RULEUMT_AmphibiousFloating' then
            --Handle ships that can walk on land...
            self:PlayUnitSound('AmphibiousFloatingKilledOnLand')
        else
            self:PlayUnitSound('Killed')
        end
        
        if EntityCategoryContains(categories.COMMAND, self) then
        	LOG('com is dead') 
			# If there is a killer, and it's not me 
        	if instigator and instigator:GetArmy() != self:GetArmy() then
        		local instigatorBrain = ArmyBrains[instigator:GetArmy()]
        		if instigatorBrain and not instigatorBrain:IsDefeated() then
					instigatorBrain:AddArmyStat("FAFWin", 1)        		
				end      		

        	end
	
			## Score change, we send the score of all players, yes mam !
			
			for index, brain in ArmyBrains do
				if brain and not brain:IsDefeated() then
					local result = string.format("%s %i", "score", math.floor(brain:GetArmyStat("FAFWin",0.0).Value + brain:GetArmyStat("FAFLose",0.0).Value) )
					table.insert( Sync.GameResult, { index, result } )
				end

			end
        end


        #If factory, destory what I'm building if I die
        if EntityCategoryContains(categories.FACTORY, self) then
            if self.UnitBeingBuilt and not self.UnitBeingBuilt:IsDead() and self.UnitBeingBuilt:GetFractionComplete() != 1 then
                self.UnitBeingBuilt:Kill()
            end
        end
		
		if self:GetCurrentLayer() == 'Water' then
			if self.PlayDeathAnimation and not self:IsBeingBuilt() then
				self:ForkThread(self.PlayAnimationThreadShips, 'AnimationDeath')
				self:SetCollisionShape('None')
			end
		else
			if self.PlayDeathAnimation and not self:IsBeingBuilt() then
				self:ForkThread(self.PlayAnimationThread, 'AnimationDeath')
				self:SetCollisionShape('None')
			end
		end

        ##self:OnKilledVO()
        self:DoUnitCallbacks( 'OnKilled' )
        self:DestroyTopSpeedEffects()
		
        if self.UnitBeingTeleported and not self.UnitBeingTeleported:IsDead() then
            self.UnitBeingTeleported:Destroy()
            self.UnitBeingTeleported = nil
        end

        #Notify instigator that you killed me.
        if instigator and IsUnit(instigator) then
            instigator:OnKilledUnit(self)
        end
        if self.DeathWeaponEnabled != false then
            self:DoDeathWeapon()
        end
        self:DisableShield()
        self:DisableUnitIntel()
        self:ForkThread(self.DeathThread, overkillRatio , instigator)
    end,
	
	SinkDestructionEffects = function(self)
        local Util = utilities
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz
        local army = self:GetArmy()
        local numBones = self:GetBoneCount() - 1
        local pos = self:GetPosition()
        local surfaceHeight = GetSurfaceHeight(pos[1], pos[3])
        local i = 0

        while true do
            local randBone = Util.GetRandomInt( 0, numBones)
            local boneHeight = self:GetPosition(randBone)[2]
            local toSurface = surfaceHeight - boneHeight
            local y = toSurface
            local rx, ry, rz = self:GetRandomOffset(0.3)
            local rs = math.max(math.min(2.5, vol / 20), 0.5)
            local scale = Util.GetRandomFloat(rs/2, rs)

            self:DestroyAllDamageEffects()
            if(toSurface < 1) then
                CreateAttachedEmitter(self, randBone, army,'/effects/emitters/destruction_water_sinking_ripples_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
                CreateAttachedEmitter(self, randBone, army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, y, rz):ScaleEmitter(scale)
            end

            if toSurface < 0 then
                ##explosion.CreateDefaultHitExplosionAtBone( self, randBone, scale*1.5)
            else
                local lifetime = Util.GetRandomInt(50, 200)

                if(toSurface > 1) then
                    CreateEmitterAtBone( self, randBone, army, '/effects/emitters/underwater_bubbles_01_emit.bp'):OffsetEmitter(rx, ry, rz)
                        :ScaleEmitter(scale)
                        :SetEmitterParam('LIFETIME', lifetime)

                    CreateAttachedEmitter(self, -1, army, '/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                end
                CreateEmitterAtBone( self, randBone, army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
                CreateEmitterAtBone( self, randBone, army, '/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(scale)
            end
            local rd = Util.GetRandomFloat( 0.4, 1.0)
            WaitSeconds(i + rd)
            i = i + 0.3
        end
    end,
	
	DeathThread = function( self, overkillRatio, instigator)
        local layer = self:GetCurrentLayer()
        local isNaval = EntityCategoryContains(categories.NAVAL, self)
        local isSinking = layer == 'Water' or layer == 'Sub'
        local isNavalFactory = (EntityCategoryContains(categories.FACTORY, self) and EntityCategoryContains(categories.STRUCTURE, self) and EntityCategoryContains(categories.NAVAL, self))
        WaitSeconds( utilities.GetRandomFloat( self.DestructionExplosionWaitDelayMin, self.DestructionExplosionWaitDelayMax) )
        self:DestroyAllDamageEffects()
        self:DestroyTopSpeedEffects()
        self:DestroyIdleEffects()
        self:DestroyBeamExhaust()

        if self.PlayDestructionEffects then
            self:CreateDestructionEffects(overkillRatio)
        end

        -- Make sure Naval units use their animation to sink
        if isSinking and not (isNaval and self.DeathAnimManip) then
            self:ForkThread(self.SinkThread)
        end

        if((self.ShowUnitDestructionDebris and overkillRatio)) then
            if overkillRatio <= 1 then
                self.CreateUnitDestructionDebris( self, true, true, false )
            elseif overkillRatio <= 2 then
                self.CreateUnitDestructionDebris( self, true, true, false )
            elseif overkillRatio <= 3 then
                self.CreateUnitDestructionDebris( self, true, true, true )
            else --VAPORIZED
                self.CreateUnitDestructionDebris( self, true, true, true )
            end
        end

        if self.DeathAnimManip and not isNaval then --Wait for non naval-units death animations
            if not isSinking then
                WaitFor(self.DeathAnimManip)
            end

            if self.PlayDestructionEffects and self.PlayEndAnimDestructionEffects then
                self:CreateDestructionEffects(overkillRatio )
            end
        end

        if isSinking and not isNavalFactory then
            self:ForkThread(self.SinkDestructionEffects)
            self:SeabedWatcher() -- Finishes when unit reached seabed
        end

        self:CreateWreckage( overkillRatio )
        WaitSeconds(self.DeathThreadDestructionWaitTime)

        if not isSinking then
           ## self:PlayUnitSound('Destroyed')
        end
        self:Destroy()
    end,

    #Sets if the unit can be killed.  val = true means it can be killed.
    #val = false means it can't be killed
    SetCanBeKilled = function(self, val)
        self.CanBeKilled = val
    end,

    CreateDestructionEffects = function( self, overKillRatio )
        local SDModifiedExplosion = import('/mods/rks_explosions/hook/lua/defaultexplosions.lua')
        SDModifiedExplosion.CreateScalableUnitExplosion( self, overKillRatio )
    end,

}
