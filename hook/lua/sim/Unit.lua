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

    CreateDestructionEffects = function( self, overKillRatio )
        local SDModifiedExplosion = import('/mods/rks_explosions/hook/lua/defaultexplosions.lua')
        SDModifiedExplosion.CreateScalableUnitExplosion( self, overKillRatio )
    end,

}
