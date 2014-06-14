local oldUnit = Unit
rklog = false

##Includes changes to the fundamental Unit class,
##in case some type of unit does not have a specifically modified OnKilled to use the 
##factional explosions, this acts as sort of a backup to still spawn them. 
##It is also neccesary because the changes here remove the current generic
##explosion, since it's replaced by the factional ones.

Unit = Class( oldUnit ) {

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
    		return 0.76
    	elseif UnitTechLvl == 'TECH3' then
    		return 1.025
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
        local Army = self:GetArmy()
		local Faction = self:GetFaction()
		local UnitTechLvl = self:GetUnitTechLvl()
		local UnitLayer = self:GetUnitLayer()
		local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
		
        local SDExplosion = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]

		if UnitLayer == 'NAVAL' then
			self.CreateEffects( self, SDEffectTemplate.AddNothing, Army, 0)
		else
			self.CreateEffects( self, SDExplosion, Army, Number)
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

        if self.PlayDeathAnimation and not self:IsBeingBuilt() then
            self:ForkThread(self.PlayAnimationThread, 'AnimationDeath')
            self:SetCollisionShape('None')
        end

        self:OnKilledVO()
        self:DoUnitCallbacks( 'OnKilled' )
        self:DestroyTopSpeedEffects()
		
        if UnitLayer == 'NAVAL' then
			self.CreateEffects( self, SDEffectTemplate.AddNothing, Army, 0)
		else
			self.CreateEffects( self, SDExplosion, Army, Number)
		end

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
