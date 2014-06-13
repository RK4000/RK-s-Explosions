local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local RKExplosion = import('/mods/rks_explosions/lua/SDExplosions.lua')
local EffectUtil = import('/mods/rks_explosions/hook/lua/EffectUtilities.lua')
local RKEffectsUtil = import('/mods/rks_explosions/lua/SDEffectUtilities.lua')
local BlueprintUtil = import('/lua/system/Blueprints.lua')
local BoomSoundBP = import('/mods/rks_explosions/boomsounds/BoomSounds.bp')

local GlobalExplosionScaleValue = 1
WARN('		Global Explosion Scale:		', GlobalExplosionScaleValue )

local oldAirUnit = AirUnit
AirUnit = Class( oldAirUnit ) {
    ##Get faction
    GetFaction = function(self) 
    return string.lower(self:GetBlueprint().General.FactionName or 'UEF')
    end,

    ##Get Tech number
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
    
    ##Get explosion scale based off Tech number
    GetNumberByTechLvl = function(self, UnitTechLvl)

    	if UnitTechLvl == 'TECH1' then
   		return 0.665
    	elseif UnitTechLvl == 'TECH2' then
    		return 1.125
    	elseif UnitTechLvl == 'TECH3' then
    		return 1.515
    	else
    		return 6.0
    	end	
    end,

    ####Needed for custom booms####
    CreateEffects = function( self, EffectTable, army, scale)
        for k, v in EffectTable do
		if self.RKEmitters == nil then self.RKEmitters = {} end
			local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
			self.Trash:Add(emitter)
        end
    end,

    CreateUnitAirDestructionEffects = function( self, scale )
    end,
    ####Needed for custom booms####

    ##Make sure we use factional damage effects
    OnCreate = function(self)
        MobileUnit.OnCreate(self)
        self:AddPingPong()
		if self.RKEmitters == nil then self.RKEmitters = {} end
        local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()
        local SDFactionalSmallSmoke = SDEffectTemplate['SmallAirUnitSmoke'.. UnitTechLvl ..Faction]
        local SDFactionalSmallFire = SDEffectTemplate['SmallAirUnitFire'.. UnitTechLvl ..Faction]
        local SDFactionalBigFireSmoke = SDEffectTemplate['BigAirUnitFireSmoke'.. UnitTechLvl ..Faction]

        ####Air unit factional-specific damage effects and smoke
        self.FxDamage1 = { SDFactionalSmallSmoke, EffectTemplate.DamageSparks01 } ## 75% HP
        self.FxDamage2 = { SDFactionalSmallFire } ## 50% HP
        self.FxDamage3 = { SDFactionalBigFireSmoke } ## 25% HP
        ####Air unit factional-specific damage effects and smoke

    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        local bp = self:GetBlueprint()
        local Army = self:GetArmy()
	local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()
	local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]
        local SDFallDownTrail = SDEffectTemplate[UnitTechLvl.. Faction..'FallDownTrail']
		self.FxDamage1Amount = 0
		self.FxDamage2Amount = 0
		self.FxDamage3Amount = 0
            ##self.FxDamage1 = { SDEffectTemplate.AddNothing }  ##Attempt to remove the damage effects when the plane gets shot down
            ##self.FxDamage2 = { SDEffectTemplate.AddNothing }  ##since the main falling-down effect that is spawned when it gets killed
            ##self.FxDamage3 = { SDEffectTemplate.AddNothing }  ##is much bigger and should cover up the fact that these get removed

        #if (self:GetCurrentLayer() == 'Air' and Random() < self.DestroyNoFallRandomChance) then
        if (self:GetCurrentLayer() == 'Air' ) then 
            local army = self:GetArmy()  
			self:DestroyAllDamageEffects()			
            self.CreateEffects( self, SDExplosion, Army, (Number/1.95*GlobalExplosionScaleValue)) ##Custom explosion when unit is in the air
            self.CreateEffects( self, SDFallDownTrail, Army, (Number*GlobalExplosionScaleValue)) ##Custom falling-down trail
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
            MobileUnit.OnKilled(self, instigator, type, overkillRatio)
        end
    end,

    OnImpact = function(self, with, other)
    local army = self:GetArmy()
    local bp = self:GetBlueprint()
    local Army = self:GetArmy()
	local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()
	local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
    local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')    
    local SDExplosionImpact = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]  
        self.CreateEffects( self, SDExplosionImpact, Army, ((Number/1.75)*GlobalExplosionScaleValue) )
        ##self.CreateUnitAirDestructionEffects( self, 1.0 )		
        ## ^ Custion explosion when unit hits the ground                                                                              
        ##(scaled to be bigger than when it explodes in the air because PHYSICS YO)

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

        if with == 'Water' then  ##This will need to be played with to remove all custom effects while the unit is sinking
		    for k,v in self.RKEmitters do v:ScaleEmitter(0) end
            self:PlayUnitSound('AirUnitWaterImpact')
            EffectUtil.CreateEffects( self, self:GetArmy(), EffectTemplate.Splashy )
			self.CreateEffects( self, SDEffectTemplate.OilSlick, Army, 0.3*Number*(GetRandomInt(0.1, 1.5)) )
			##self.CreateEffects( self, SDEffectTemplate.OilSlick, Army, 0.3*Number )
            #self:Destroy()
	    self:ForkThread(self.SinkIntoWaterAfterDeath, self.OverKillRatio )   
        else
            # This is a bit of safety to keep us from calling the death thread twice in case we bounce twice quickly
            if not self.DeathBounce then
                self:ForkThread(self.DeathThread, self.OverKillRatio )
                self.DeathBounce = 1
            end
        end
    end,
}

local oldSeaUnit = SeaUnit
SeaUnit = Class( oldSeaUnit ) {
    ##Get faction
    GetFaction = function(self) 
    return string.lower(self:GetBlueprint().General.FactionName or 'UEF')
    end,

    ##Get Tech number
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

    ##Get explosion scale based off Tech number
    GetNumberByTechLvlShip = function(self, UnitTechLvl)

    	if UnitTechLvl == 'TECH1' then
   		return 1.5665
    	elseif UnitTechLvl == 'TECH2' then
    		return 1.9
    	elseif UnitTechLvl == 'TECH3' then
    		return 2.515
    	else
    		return 6.0
    	end	
    end,

    ##Get size of unit
    GetSizeOfUnit = function(self)
        local bp = self:GetBlueprint()
        return (math.abs(bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0))
    end,

    ####Needed for the custom booms####
    CreateEffects = function( self, EffectTable, army, scale)
        for k, v in EffectTable do
            self.Trash:Add(CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale))
        end
    end,
    
    CreateFactionalExplosionAtBone = function( self, boneName, scale )
        local army = self:GetArmy()
		local bp = self:GetBlueprint()
		local Army = self:GetArmy()
		local Faction = self:GetFaction()
		local UnitTechLvl = self:GetUnitTechLvl()
		local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
        local SDFactionalShipSubExplosion = SDEffectTemplate[Faction.. 'ShipSubExpl' ..UnitTechLvl]

        EffectUtil.CreateBoneEffects( self, boneName, army, SDFactionalShipSubExplosion ):ScaleEmitter(scale) ##<-- if added, returns an error that "scale" is a nil value...

    end,

    CreateUnitSeaDestructionEffects = function( self, scale )
        local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()

        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
        RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
    end,

    PlaySubBoomSound = function(self, sound)
    	local bp = BoomSoundBP.Audio
    	if bp and bp[sound] then
    		self:PlaySound(bp[sound])
    		return true
   	end
    	return false
    end,
    ####Needed for the custom booms####

    ##Make sure we use factional damage effects
    OnCreate = function(self)
        MobileUnit.OnCreate(self)
        self:AddPingPong()
        local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()
        local SDFactionalSmallSmoke = SDEffectTemplate['SmallAirUnitSmoke'.. UnitTechLvl ..Faction]  ##Using airplane damage effects 
        local SDFactionalSmallFire = SDEffectTemplate['SmallAirUnitFire'.. UnitTechLvl ..Faction]  ##for now, yea, i know, it's cheap,
        local SDFactionalBigFireSmoke = SDEffectTemplate['BigAirUnitFireSmoke'.. UnitTechLvl ..Faction]##so sue me, i don't care :P

        ####Sea unit factional-specific damage effects and smoke
        self.FxDamage1 = { SDFactionalSmallSmoke, EffectTemplate.DamageSparks01 } ## 75% HP
        self.FxDamage2 = { SDFactionalSmallFire } ## 50% HP
        self.FxDamage3 = { SDFactionalBigFireSmoke } ## 25% HP
        ####Sea unit factional-specific damage effects and smoke

    end,

    OnKilled = function(self, instigator, type, overkillRatio)
		local nrofBones = self:GetBoneCount() -1
                local watchBone = self:GetBlueprint().WatchBone or 0
                local Army = self:GetArmy()
                local UnitTechLvl = self:GetUnitTechLvl()
                local BoomScale = self:GetNumberByTechLvlShip(UnitTechLvl or 'TECH1')
                local BoomScale2 = self:GetSizeOfUnit()
                LOG('	Oil slick scale multiplier (tech): ', self:GetNumberByTechLvlShip(UnitTechLvl or 'TECH1') )
                LOG('	Oil slick scale multiplier (scale): ', self:GetSizeOfUnit() )

		--LOG(self:GetBlueprint().Description, " watchbone is ", watchBone)
                
                self.CreateEffects( self, SDEffectTemplate.OilSlick, Army, ( (BoomScale)*((BoomScale2)/2)) *GlobalExplosionScaleValue )
 		self:ForkThread(function()
			-- LOG("Sinker thread created")
			local pos = self:GetPosition()
			local seafloor = GetTerrainHeight(pos[1], pos[3]) + GetTerrainTypeOffset(pos[1], pos[3])
			while self:GetPosition(watchBone)[2] > seafloor do
				WaitSeconds(0.1)
				-- LOG("Sinker: ", repr(self:GetPosition()))
			end
			##CreateScaledBoom(self, overkillRatio, watchBone) ##Removing generic explosion
			self:CreateWreckage(overkillRatio, instigator)
			self:Destroy()
		end)
         
		local layer = self:GetCurrentLayer()
        self:DestroyIdleEffects()
        self:CreateUnitSeaDestructionEffects( self, 1.0 )
        if (layer == 'Water' or layer == 'Seabed' or layer == 'Sub') then
            self.SinkExplosionThread = self:ForkThread(self.ExplosionThread)
            self.SinkThread = self:ForkThread(self.SinkingThread)
        end
	
	local layer = self:GetCurrentLayer()
        self:DestroyIdleEffects()
        
	if(layer == 'Water' or layer == 'Seabed' or layer == 'Sub')then
            self.SinkExplosionThread = self:ForkThread(self.ExplosionThread)
            self.SinkThread = self:ForkThread(self.SinkingThread)
        end
        MobileUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

    GetSizeOfUnitForSubBooms = function(self)
        local bp = self:GetBlueprint()

        ##if bp.SizeX < 1 then
        ##    bp.SizeX = 1
        ##end

        ##if bp.SizeY < 1 then
        ##    bp.SizeY = 1
        ##end

        ##if bp.SizeZ < 1 then
        ##    bp.SizeZ = 1
        ##end
         
        return (math.abs( (bp.SizeX)*(bp.SizeX)) or 0 + ((bp.SizeY)*(bp.SizeY)) or 0 + ((bp.SizeZ)*(bp.SizeZ)) or 0 ) ##For bigger difference between big and small units
        
    end,

    ExplosionThread = function(self) ##EXPLOSIONNNNNNNNN
        ##Kidding aside, this stock explosion code is scripted very clumsily... It assumes bigger ships have longer sinking animations, and that all animations put the ship below water at the same rate...
        ##All of this code will probably need to be rewritten as this offers me too little control. For now, it has just
        ##been modified to use factional sub-explosions, and nothing else... But as stated, needs a rewrite soon.

        local SubExplCountBasedOffSizeMax = (self:GetSizeOfUnitForSubBooms()-self:GetSizeOfUnit()) /1.15      
        local SubExplCountBasedOffSizeMin = (self:GetSizeOfUnitForSubBooms()-(self:GetSizeOfUnit()-4)) /2.15           

        local maxcount = Util.GetRandomInt(SubExplCountBasedOffSizeMin,SubExplCountBasedOffSizeMax)
        local i = maxcount # initializing the above surface counter
        local d = 0 # delay offset after surface explosions cease
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz
        local army = self:GetArmy()
        local numBones = self:GetBoneCount() - 1

        local Faction = self:GetFaction()

        while true do
            if i > 0 then
                local rx, ry, rz = self:GetRandomOffset(1)
                local rs = Random(vol/2, vol*2) / (vol*2)
                local UnitTechLvl = self:GetUnitTechLvl()
                local UnitSize = self:GetSizeOfUnit()

                ##Make faction boom
                self.CreateFactionalExplosionAtBone( self, Util.GetRandomInt( 0, numBones), UnitSize )
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
                self:PlaySubBoomSound('SubBoomSound'..Faction)
                ##Make faction boom
                
            else        
                d = d + 1 # if submerged, increase delay offset
                self:DestroyAllDamageEffects()
            end
            i = i - 1

            local rx, ry, rz = self:GetRandomOffset(0.25)
            local rs = Random(vol/2, vol*2) / (vol*2)
            local randBone = Util.GetRandomInt( 0, numBones)
            
            

            CreateEmitterAtBone( self, randBone, army, '/effects/emitters/destruction_underwater_explosion_flash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(rs)
            CreateEmitterAtBone( self, randBone, army, '/effects/emitters/destruction_underwater_explosion_splash_01_emit.bp'):OffsetEmitter(rx, ry, rz):ScaleEmitter(rs)

            local rd = Util.GetRandomFloat( 0.4*3.5, 1*2.25 )        
            WaitSeconds(rd)
        end
    end,
    
   SinkingThread = function(self) ##Well i guess we need to sink too, while exploding... fine with me! :D
        local i = 8 # initializing the above surface counter
        local sx, sy, sz = self:GetUnitSizes()
        local vol = sx * sy * sz
        local army = self:GetArmy()

        while true do
            if i > 0 then
                local rx, ry, rz = self:GetRandomOffset(1)
                local rs = Random(vol/2, vol*2) / (vol*2) 
                CreateAttachedEmitter(self,-1,army,'/effects/emitters/destruction_water_sinking_ripples_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)

                local rx, ry, rz = self:GetRandomOffset(1)
                CreateAttachedEmitter(self,self.LeftFrontWakeBone,army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)

                local rx, ry, rz = self:GetRandomOffset(1)
                CreateAttachedEmitter(self,self.RightFrontWakeBone,army, '/effects/emitters/destruction_water_sinking_wash_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)
            end

            local rx, ry, rz = self:GetRandomOffset(1)
            local rs = Random(vol/2, vol*2) / (vol*2)
            CreateAttachedEmitter(self,-1,army,'/effects/emitters/destruction_underwater_sinking_wash_01_emit.bp'):OffsetEmitter(rx, 0, rz):ScaleEmitter(rs)

            i = i - 1
            WaitSeconds(1)
        end
    end,
}

local Unit = import('/lua/sim/Unit.lua').Unit
StructureUnit = Class(Unit) {
    LandBuiltHiddenBones = {'Floatation'},
    MinConsumptionPerSecondEnergy = 1,
    MinWeaponRequiresEnergy = 0,
    
    # Stucture unit specific damage effects and smoke
    FxDamage1 = { EffectTemplate.DamageStructureSmoke01, EffectTemplate.DamageStructureSparks01 },
    FxDamage2 = { EffectTemplate.DamageStructureFireSmoke01, EffectTemplate.DamageStructureSparks01 },
    FxDamage3 = { EffectTemplate.DamageStructureFire01, EffectTemplate.DamageStructureSparks01 },    

    OnCreate = function(self)
        Unit.OnCreate(self)
        LOG('Are we even fucking hooking!?')
        self.WeaponMod = {}
        self.FxBlinkingLightsBag = {} 
        if self:GetCurrentLayer() == 'Land' and self:GetBlueprint().Physics.FlattenSkirt then
            self:FlattenSkirt()
        end        
    end,

    ##Get faction
    GetFaction = function(self) 
    return string.lower(self:GetBlueprint().General.FactionName or 'UEF')
    end,

    ##Get Tech number
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

    ##Get explosion scale based off Tech number
    GetNumberByTechLvlBuilding = function(self, UnitTechLvl)

    	if UnitTechLvl == 'TECH1' then
   		return 2
    	elseif UnitTechLvl == 'TECH2' then
    		return 3
    	elseif UnitTechLvl == 'TECH3' then
    		return 3.5
    	else
    		return 6.0
    	end	
    end,

    ##Get sub-explosion number multiplier based off Tech number
    GetNumberByTechLvlBuilding2 = function(self, UnitTechLvl)

    	if UnitTechLvl == 'TECH1' then
   		return 1/6
    	elseif UnitTechLvl == 'TECH2' then
    		return 3/6
    	elseif UnitTechLvl == 'TECH3' then
    		return 6/6
    	else
    		return 6.0
    	end	
    end,

    ##Get final boom multiplier based off Tech number
    GetNumberTechFinalBoom = function(self)##, UnitTechLvl)
    local UnitTechLvl = self:GetUnitTechLvl()

    	if UnitTechLvl == 'TECH1' then
   		return 1
    	elseif UnitTechLvl == 'TECH2' then
    		return 0.65
    	elseif UnitTechLvl == 'TECH3' then
    		return 0.415
    	end	
    end,

    ##Get total size of unit
    GetSizeOfBuilding = function(self)
        local bp = self:GetBlueprint()
        return (math.abs(bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0))
    end,

    ##Get the sizes of the unit
    GetUnitSizes = function( self )
        local bp = self:GetBlueprint()
        return (bp.SizeX) or 0, (bp.SizeY-(bp.SizeY/2.20)) or 0, (bp.SizeZ) or 0
    end,

    ##For speeding up Sera building explosions, they call the destruction thread twice, so i'm halving the num of explosions.
    GetNumberBasedOffFaction = function(self)
        local Faction = self:GetFaction()
        if Faction == 'seraphim' then
            return 0.25
        else
            return 0.5
        end
    end,

    ##For final boom semi-final scale tweaking, based off faction
    GetFinalBoomMultBasedOffFaction = function(self)
        local Faction = self:GetFaction()
        if Faction == 'seraphim' then
            return 1.25
        elseif Faction == 'cybran' then
            return 1.425
        else
            return 1
        end
    end,

    ##For final boom final scale tweaking, for cyb
    GetFinalBoomMultBasedOffFaction = function(self)
        local UnitTechLvl = self:GetUnitTechLvl()
        local Faction = self:GetFaction()
        if ( (Faction == 'cybran') and (UnitTechLvl == 'TECH3') )  then
            return 1.525
        else
            return 1
        end
    end,

    ####Needed for the custom booms####
    CreateEffects = function( self, EffectTable, army, scale)
        for k, v in EffectTable do
            self.Trash:Add(CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale))
        end
    end,
    
    CreateTimedFactionalStuctureUnitExplosion = function( self )
        local bp = self:GetBlueprint()
        local Army = self:GetArmy()
	local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()
        local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
	local ExplosionMultiplierTech = self:GetNumberByTechLvlBuilding2(UnitTechLvl or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]
        local NumExplFaction = self:GetNumberBasedOffFaction()

        local numExplosions = (self:GetSizeOfBuilding(self) * Util.GetRandomFloat(1,2.5) * NumExplFaction)
        local x,y,z = self:GetUnitSizes(self)
        LOG('	Sub-explosion number: ', numExplosions )
        self:ShakeCamera( 30*1.65, 1*1.65, 0, 0.45 * numExplosions *1.65 )
        for i = 0, numExplosions do
            self.CreateFactionalHitExplosionOffset( self, 1.0, unpack({Util.GetRandomOffset(x,y,z,1.2)}))
            self:PlayUnitSound('DeathExplosion')
            WaitSeconds( Util.GetRandomFloat( (0.3 * NumExplFaction), (0.6* NumExplFaction) ) )
        end
    end,

    CreateFactionalHitExplosionOffset = function( self, scale, xOffset, yOffset, zOffset )
        local bp = self:GetBlueprint()
        local Army = self:GetArmy()
	local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()
	local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]

        if self:BeenDestroyed() then 
            return
        end
    
        local army = self:GetArmy()
        EffectUtil.CreateBoneEffectsOffset( self, -1, army, SDExplosion, xOffset, yOffset, zOffset )
    end,

    CreateFactionalExplosionAtBone = function( self, boneName, scale )
        local bp = self:GetBlueprint()
        local Army = self:GetArmy()
	local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()
	local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]

        EffectUtil.CreateBoneEffects( self, boneName, army, SDExplosion )##:ScaleEmitter(scale) ##<-- if added, returns an error that "scale" is a nil value...

    end,

    ####Needed for the custom booms####

    OnStopBeingBuilt = function(self,builder,layer)
        Unit.OnStopBeingBuilt(self,builder,layer)
        self:PlayActiveAnimation()
    end,

    OnFailedToBeBuilt = function(self)
        Unit.OnFailedToBeBuilt(self)
        self:DestroyTarmac()
    end,

    FlattenSkirt = function(self)
        local x, y, z = unpack(self:GetPosition())
        local x0,z0,x1,z1 = self:GetSkirtRect()
        x0,z0,x1,z1 = math.floor(x0),math.floor(z0),math.ceil(x1),math.ceil(z1)
        FlattenMapRect(x0, z0, x1-x0, z1-z0, y)
    end,

    CreateTarmac = function(self, albedo, normal, glow, orientation, specTarmac, lifeTime)
        if self:GetCurrentLayer() != 'Land' then return end
        local tarmac
        local bp = self:GetBlueprint().Display.Tarmacs
        if not specTarmac then
            if bp and table.getn(bp) > 0 then
                local num = Random(1, table.getn(bp))
                #LOG('*DEBUG: NUM + ', repr(num))
                tarmac = bp[num]
            else
                return false
            end
        else
            tarmac = specTarmac
        end
        
        local army = self:GetArmy()
        local w = tarmac.Width
        local l = tarmac.Length
        local fadeout = tarmac.FadeOut

        local x, y, z = unpack(self:GetPosition())
        
        #I'm disabling this for now since there are so many things wrong with it.
        #SetTerrainTypeRect(self.tarmacRect, {TypeCode= (aiBrain:GetFactionIndex() + 189) } )
        local orient = orientation
        if not orientation then
            if tarmac.Orientations and table.getn(tarmac.Orientations) > 0 then
                orient = tarmac.Orientations[Random(1, table.getn(tarmac.Orientations))]
                orient = (0.01745 * orient)
            else
                orient = 0
            end
        end

        if not self.TarmacBag then
            self.TarmacBag = {
                Decals = {},
                Orientation = orient,
                CurrentBP = tarmac,
            }
        end
        
        local GetTarmac = import('/lua/tarmacs.lua').GetTarmacType
        
        local terrain = GetTerrainType(x, z)
        local terrainName
        if terrain then
            terrainName = terrain.Name
        end
        #Players and AI can build buildings outside of their faction. Get the *building's* faction to determine the correct tarrain-specific tarmac
        local factionTable = {e=1, a=2, r=3, s=4}
        local faction  = factionTable[string.sub(self:GetUnitId(),2,2)]

        if albedo and tarmac.Albedo then
            local albedo2 = tarmac.Albedo2
            if albedo2 then 
                albedo2 = albedo2 .. GetTarmac(faction, terrain)
            end
            
            local tarmacHndl = CreateDecal(self:GetPosition(), orient, tarmac.Albedo .. GetTarmac(faction, terrainName) , albedo2 or '', 'Albedo', w, l, fadeout, lifeTime or 0, army, 0)
            table.insert(self.TarmacBag.Decals, tarmacHndl)
            if tarmac.RemoveWhenDead then
                self.Trash:Add(tarmacHndl)
            end
        end
        if normal and tarmac.Normal then
            local tarmacHndl = CreateDecal(self:GetPosition(), orient, tarmac.Normal .. GetTarmac(faction, terrainName), '', 'Alpha Normals', w, l, fadeout, lifeTime or 0, army, 0)
            
            table.insert(self.TarmacBag.Decals, tarmacHndl)
            if tarmac.RemoveWhenDead then
                self.Trash:Add(tarmacHndl)
            end
        end
        if glow and tarmac.Glow then
            local tarmacHndl = CreateDecal(self:GetPosition(), orient, tarmac.Glow .. GetTarmac(faction, terrainName), '', 'Glow', w, l, fadeout, lifeTime or 0, army, 0)
            
            table.insert(self.TarmacBag.Decals, tarmacHndl)
            if tarmac.RemoveWhenDead then
                self.Trash:Add(tarmacHndl)
            end
        end
    end,

    DestroyTarmac = function(self)
        if not self.TarmacBag then return end
        for k, v in self.TarmacBag.Decals do
            v:Destroy()
        end

        self.TarmacBag.Orientation = nil
        self.TarmacBag.CurrentBP = nil
    end,
    
    HasTarmac = function(self)
        if not self.TarmacBag then return false end
        return (table.getn(self.TarmacBag.Decals) != 0)
    end,

    OnMassStorageStateChange = function(self, state)
    end,

    OnEnergyStorageStateChange = function(self, state)
    end,

    CreateBlinkingLights = function(self, color)
        self:DestroyBlinkingLights()
        local bp = self:GetBlueprint().Display.BlinkingLights
        local bpEmitters = self:GetBlueprint().Display.BlinkingLightsFx
        if bp then
            local fxbp = bpEmitters[color]
            for k, v in bp do
                if type(v) == 'table' then
                    local fx = CreateAttachedEmitter(self, v.BLBone, self:GetArmy(), fxbp)
                    fx:OffsetEmitter(v.BLOffsetX or 0, v.BLOffsetY or 0, v.BLOffsetZ or 0)
                    fx:ScaleEmitter(v.BLScale or 1)
                    table.insert(self.FxBlinkingLightsBag, fx)
                    self.Trash:Add(fx)
                end
            end
        end
    end,

    DestroyBlinkingLights = function(self)
        for k, v in self.FxBlinkingLightsBag do
            v:Destroy()
        end
        self.FxBlinkingLightsBag = {}
    end,

    CreateDestructionEffects = function( self, overKillRatio )
        local bp = self:GetBlueprint()
        local Army = self:GetArmy()
	local Faction = self:GetFaction()
	local UnitTechLvl = self:GetUnitTechLvl()
	local Number = self:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
        local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
        local SDExplosion = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]

        local BoomScale = self:GetSizeOfBuilding() + 0.125
        local BoomScale2 = self:GetNumberByTechLvlBuilding(UnitTechLvl or 'TECH1')
        local BuildingSize = self:GetSizeOfBuilding()

        local FinalBoomMultiplier = (self:GetSizeOfBuilding()*self:GetNumberTechFinalBoom()*self:GetFinalBoomMultBasedOffFaction()*self:GetFinalBoomMultBasedOffFaction())

        LOG('Final Boom Tech Mult', self:GetNumberTechFinalBoom() )
        LOG('Final Boom Size Mult', self:GetSizeOfBuilding() )
        LOG('Final Boom Faction Mult', self:GetFinalBoomMultBasedOffFaction() )
        LOG('Final Boom Cyb Mult', self:GetFinalBoomMultBasedOffFaction() )
        LOG('	Final boom multiplier: ', (self:GetSizeOfBuilding()*self:GetNumberTechFinalBoom()) )
        
        local GlobalBuildingBoomScaleDivider = 7.5

        if( self:GetSizeOfBuilding(self) < 2.0 ) then
            self.CreateEffects( self, SDExplosion, Army, ( (BoomScale*(BoomScale2/2)) /GlobalBuildingBoomScaleDivider)) ##Custom explosion for smaller buildings. 
        else
            LOG('	STARTING BOOM PROCESS ON: ', bp.General.UnitName )
            LOG('	Building Size: ', self:GetSizeOfBuilding() )
            LOG('	Building Tech: ', self:GetUnitTechLvl() )
            LOG('	Global Building Boom Divider: ', 4.5 )
            LOG('	Tech Scale: ', self:GetNumberByTechLvlBuilding(UnitTechLvl or 'TECH1') )
            LOG('	Size Scale: ', self:GetSizeOfBuilding() )
            self.CreateTimedFactionalStuctureUnitExplosion( self )
            WaitSeconds( 0.1 )
            self.CreateEffects( self, SDExplosion, Army, ( ((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue) )
            self:PlayUnitSound('DeathExplosion')
            RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
            WaitSeconds( 1.15)
            self.CreateEffects( self, SDExplosion, Army, ( (((BoomScale*BoomScale2/2) /GlobalBuildingBoomScaleDivider)*GlobalExplosionScaleValue)*FinalBoomMultiplier) )
            if UnitTechLvl == 'TECH1' then
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
            elseif UnitTechLvl == 'TECH2' then
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
            elseif UnitTechLvl == 'TECH3' then
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
                RKExplosion.CreateShipFlamingDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})
            end
            self:PlayUnitSound('DeathExplosion')
            self:PlayUnitSound('DeathExplosion')
        end
    end,

    -- Modified to use same upgrade logic as the ui. This adds more upgrade options via General.UpgradesFromBase blueprint option
    OnStartBuild = function(self, unitBeingBuilt, order )
        Unit.OnStartBuild(self,unitBeingBuilt, order)
        self.UnitBeingBuilt = unitBeingBuilt
	
	--LOG("structure onstartbuild")
	
	local builderBp = self:GetBlueprint()
	local targetBp = unitBeingBuilt:GetBlueprint()
	local performUpgrade = false
	
	if targetBp.General.UpgradesFrom == builderBp.BlueprintId then
	   performUpgrade = true
	elseif targetBp.General.UpgradesFrom == builderBp.General.UpgradesTo then
	   performUpgrade = true
	elseif targetBp.General.UpgradesFromBase != "none" then
	   # try testing against the base
	   if targetBp.General.UpgradesFromBase == builderBp.BlueprintId then
	      performUpgrade = true
	   elseif targetBp.General.UpgradesFromBase == builderBp.General.UpgradesFromBase then
	      performUpgrade = true
	   end
	end
	
	--if unitBeingBuilt:GetUnitId() != builderBp.General.UpgradesTo then
	if performUpgrade and order == 'Upgrade' then
	   ChangeState(self, self.UpgradingState)
	end
	--end
     end,
    
    
    IdleState = State {
        Main = function(self)
        end,
    },

    UpgradingState = State {
        Main = function(self)
            self:StopRocking()
            local bp = self:GetBlueprint().Display
            self:DestroyTarmac()
            self:PlayUnitSound('UpgradeStart')
            self:DisableDefaultToggleCaps()
            if bp.AnimationUpgrade then
                local unitBuilding = self.UnitBeingBuilt
                self.AnimatorUpgradeManip = CreateAnimator(self)
                self.Trash:Add(self.AnimatorUpgradeManip)
                local fractionOfComplete = 0
                self:StartUpgradeEffects(unitBuilding)
                self.AnimatorUpgradeManip:PlayAnim(bp.AnimationUpgrade, false):SetRate(0)

                while fractionOfComplete < 1 and not self:IsDead() do
                    fractionOfComplete = unitBuilding:GetFractionComplete()
                    self.AnimatorUpgradeManip:SetAnimationFraction(fractionOfComplete)
                    WaitTicks(1)
                end
                if not self:IsDead() then
                    self.AnimatorUpgradeManip:SetRate(1)
                end
            end
        end,

        OnStopBuild = function(self, unitBuilding)
            Unit.OnStopBuild(self, unitBuilding)
            self:EnableDefaultToggleCaps()
            
            if unitBuilding:GetFractionComplete() == 1 then
                NotifyUpgrade(self, unitBuilding)
                self:StopUpgradeEffects(unitBuilding)
                self:PlayUnitSound('UpgradeEnd')
                self:Destroy()
            end
        end,

        OnFailedToBuild = function(self)
            Unit.OnFailedToBuild(self)
            self:EnableDefaultToggleCaps()
            
            if self.AnimatorUpgradeManip then self.AnimatorUpgradeManip:Destroy() end
            
            if self:GetCurrentLayer() == 'Water' then
                self:StartRocking()
            end
            self:PlayUnitSound('UpgradeFailed')
            self:PlayActiveAnimation()
            self:CreateTarmac(true, true, true, self.TarmacBag.Orientation, self.TarmacBag.CurrentBP)
            ChangeState(self, self.IdleState)
        end,
        
    },
    
    StartBeingBuiltEffects = function(self, builder, layer)
		Unit.StartBeingBuiltEffects(self, builder, layer)
		local bp = self:GetBlueprint()
		local FactionName = bp.General.FactionName
		
		if FactionName == 'UEF' then
			self:HideBone(0, true)
			self.BeingBuiltShowBoneTriggered = false
			if bp.General.UpgradesFrom != builder:GetUnitId() then
				self:ForkThread( EffectUtil.CreateBuildCubeThread, builder, self.OnBeingBuiltEffectsBag )	
			end					
		elseif FactionName == 'Aeon' then
			if bp.General.UpgradesFrom != builder:GetUnitId() then
				self:ForkThread( EffectUtil.CreateAeonBuildBaseThread, builder, self.OnBeingBuiltEffectsBag )
			end
		elseif FactionName == 'Cybran' then
		elseif FactionName == 'Seraphim' then
			if bp.General.UpgradesFrom != builder:GetUnitId() then
				self:ForkThread( EffectUtil.CreateSeraphimBuildBaseThread, builder, self.OnBeingBuiltEffectsBag )
			end		
		end
    end,
    
    StopBeingBuiltEffects = function(self, builder, layer)
        local FactionName = self:GetBlueprint().General.FactionName
        if FactionName == 'Aeon' then
            WaitSeconds( 2.0 )
        elseif FactionName == 'UEF' and not self.BeingBuiltShowBoneTriggered then 
            self:ShowBone(0, true)
            self:HideLandBones()            
        end
		Unit.StopBeingBuiltEffects(self, builder, layer)    
    end,
    
    StartBuildingEffects = function(self, unitBeingBuilt, order)
        Unit.StartBuildingEffects(self, unitBeingBuilt, order)
    end,
    
    StopBuildingEffects = function(self, unitBeingBuilt)
        Unit.StopBuildingEffects(self, unitBeingBuilt)
    end,
    
    StartUpgradeEffects = function(self, unitBeingBuilt)
        unitBeingBuilt:HideBone(0, true)
    end,
    
    StopUpgradeEffects = function(self, unitBeingBuilt)
        unitBeingBuilt:ShowBone(0, true)
    end,
    
    PlayActiveAnimation = function(self)
        
    end,
    
    #Adding into OnKilled the ability to destroy the tarmac but put a new one down that looks exactly like it but
    #will time out over the time spec'd or 300 seconds.
    OnKilled = function(self, instigator, type, overkillRatio)
        Unit.OnKilled(self, instigator, type, overkillRatio)
        local orient = self.TarmacBag.Orientation
        local currentBP = self.TarmacBag.CurrentBP
        self:DestroyTarmac()
        self:CreateTarmac(true, true, true, orient, currentBP, currentBP.DeathLifetime or 300)
    end,
    
    #---------------------------------------------------------------------------------------------
    #  Adjacency
    #---------------------------------------------------------------------------------------------
    
    #When we're adjacent, try to all all the possible bonuses.
    OnAdjacentTo = function(self, adjacentUnit, triggerUnit)
        if self:IsBeingBuilt() then return end
        if adjacentUnit:IsBeingBuilt() then return end
        
        local adjBuffs = self:GetBlueprint().Adjacency
        if not adjBuffs then return end
        
        for k,v in AdjacencyBuffs[adjBuffs] do
            Buff.ApplyBuff(adjacentUnit, v, self)
        end
        self:RequestRefreshUI()
        adjacentUnit:RequestRefreshUI()
    end,
    
    #When we're not adjacent, try to remove all the possible bonuses.
    OnNotAdjacentTo = function(self, adjacentUnit)
        local adjBuffs = self:GetBlueprint().Adjacency
        if adjBuffs and AdjacencyBuffs[adjBuffs] then 
            for k,v in AdjacencyBuffs[adjBuffs] do
                if Buff.HasBuff(adjacentUnit, v) then
                    Buff.RemoveBuff(adjacentUnit, v)
                end
            end
        end
        self:DestroyAdjacentEffects()
        
        self:RequestRefreshUI()
        adjacentUnit:RequestRefreshUI()
    end,

    #---------
    # Add/Remove Adjacency Effects
    #---------
    
    CreateAdjacentEffect = function(self, adjacentUnit)
        #Create trashbag to hold all these entities and beams
        if not self.AdjacencyBeamsBag then
            self.AdjacencyBeamsBag = {}
        end
        
        for k,v in self.AdjacencyBeamsBag do
            if v.Unit:GetEntityId() == adjacentUnit:GetEntityId() then
                return
            end
        end
            
		self:ForkThread( EffectUtil.CreateAdjacencyBeams, adjacentUnit, self.AdjacencyBeamsBag )
    end,

    DestroyAdjacentEffects = function(self, adjacentUnit)
        if not self.AdjacencyBeamsBag then return end
        for k, v in self.AdjacencyBeamsBag do
            # if any of the adjacent units are destroyed or the passed in unit is found: Kill the effect
            if v.Unit:BeenDestroyed() or v.Unit:IsDead() then #or v.Unit:GetEntityId() == adjacentUnit:GetEntityId() then
                v.Trash:Destroy()
                self.AdjacencyBeamsBag[k] = nil
            end
        end
    end,
    
}

FactoryUnit = Class(StructureUnit) {
    OnCreate = function(self)

	-- Engymod addition: If a normal factory is created, we should check for research stations
	if EntityCategoryContains(categories.FACTORY, self) then
	   self:updateBuildRestrictions()
	end

        StructureUnit.OnCreate(self)
        self.BuildingUnit = false
    end,

    -- Added to add engymod logic
    OnDestroy = function(self)
        --LOG("Something ondestroy")
		   
	-- Figure out if we're a research station
	if EntityCategoryContains(categories.RESEARCH, self) then
	   --LOG("Research station Destroyed")
	   
	   local aiBrain = self:GetAIBrain()
	   local buildRestrictionVictims = aiBrain:GetListOfUnits(categories.FACTORY+categories.ENGINEER, false)
	   
	   for id, unit in buildRestrictionVictims do
	      unit:updateBuildRestrictions()
	   end

	   
	end
	
	StructureUnit.OnDestroy(self)
     end,

    
    OnPaused = function(self)
        #When factory is paused take some action
        self:StopUnitAmbientSound( 'ConstructLoop' )
        StructureUnit.OnPaused(self)
    end,
    
    OnUnpaused = function(self)
        if self.BuildingUnit then
            self:PlayUnitAmbientSound( 'ConstructLoop' )
        end
        StructureUnit.OnUnpaused(self)
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        local aiBrain = GetArmyBrain(self:GetArmy())
        aiBrain:ESRegisterUnitMassStorage(self)
        aiBrain:ESRegisterUnitEnergyStorage(self)
        local curEnergy = aiBrain:GetEconomyStoredRatio('ENERGY')
        local curMass = aiBrain:GetEconomyStoredRatio('MASS')
        if curEnergy > 0.11 and curMass > 0.11 then
            self:CreateBlinkingLights('Green')
            self.BlinkingLightsState = 'Green'
        else
            self:CreateBlinkingLights('Red')
            self.BlinkingLightsState = 'Red'
        end
	
	-- If we're a research station, update build restrictions for all factories
	if EntityCategoryContains(categories.RESEARCH, self) then
	   --LOG("Research station OnStopBeingBuilt")
	   
	   local buildRestrictionVictims = aiBrain:GetListOfUnits(categories.FACTORY + categories.ENGINEER, false)
	   for id, unit in buildRestrictionVictims do
	      unit:updateBuildRestrictions()
	   end
	end
     
	StructureUnit.OnStopBeingBuilt(self,builder,layer)
     end,

    ChangeBlinkingLights = function(self, state)
        local bls = self.BlinkingLightsState
        if state == 'Yellow' then
            if bls == 'Green' then
                self:CreateBlinkingLights('Yellow')
                self.BlinkingLightsState = state
            end
        elseif state == 'Green' then
            if bls == 'Yellow' then
                self:CreateBlinkingLights('Green')
                self.BlinkingLightsState = state
            elseif bls == 'Red' then
                local aiBrain = GetArmyBrain(self:GetArmy())
                local curEnergy = aiBrain:GetEconomyStoredRatio('ENERGY')
                local curMass = aiBrain:GetEconomyStoredRatio('MASS')
                if curEnergy > 0.11 and curMass > 0.11 then
                    if self:GetNumBuildOrders(categories.ALLUNITS) == 0 then
                        self:CreateBlinkingLights('Green')
                        self.BlinkingLightsState = state
                    else
                        self:CreateBlinkingLights('Yellow')
                        self.BlinkingLightsState = 'Yellow'
                    end
                end
            end
        elseif state == 'Red' then
            self:CreateBlinkingLights('Red')
            self.BlinkingLightsState = state
        end
    end,

    OnMassStorageStateChange = function(self, newState)
        if newState == 'EconLowMassStore' then
            self:ChangeBlinkingLights('Red')
        else
            self:ChangeBlinkingLights('Green')
        end
    end,

    OnEnergyStorageStateChange = function(self, newState)
        if newState == 'EconLowEnergyStore' then
            self:ChangeBlinkingLights('Red')
        else
            self:ChangeBlinkingLights('Green')
        end
    end,

    OnStartBuild = function(self, unitBeingBuilt, order )
        self:ChangeBlinkingLights('Yellow')
        StructureUnit.OnStartBuild(self, unitBeingBuilt, order )
        self.BuildingUnit = true
        if order != 'Upgrade' then
            ChangeState(self, self.BuildingState)
            self.BuildingUnit = false
        end
        self.FactoryBuildFailed = false
    end,

    OnStopBuild = function(self, unitBeingBuilt, order )
        StructureUnit.OnStopBuild(self, unitBeingBuilt, order )
        
        if not self.FactoryBuildFailed then
            if not EntityCategoryContains(categories.AIR, unitBeingBuilt) then
                self:RollOffUnit()
            end
            self:StopBuildFx()
            self:ForkThread(self.FinishBuildThread, unitBeingBuilt, order )
        end
        self.BuildingUnit = false
    end,

    FinishBuildThread = function(self, unitBeingBuilt, order )
        self:SetBusy(true)
        self:SetBlockCommandQueue(true)
        local bp = self:GetBlueprint()
        local bpAnim = bp.Display.AnimationFinishBuildLand
        if bpAnim and EntityCategoryContains(categories.LAND, unitBeingBuilt) then
            self.RollOffAnim = CreateAnimator(self):PlayAnim(bpAnim)
            self.Trash:Add(self.RollOffAnim)
            WaitTicks(1)
            WaitFor(self.RollOffAnim)
        end
        if unitBeingBuilt and not unitBeingBuilt:IsDead() then
            unitBeingBuilt:DetachFrom(true)
        end
        self:DetachAll(bp.Display.BuildAttachBone or 0)
        self:DestroyBuildRotator()
        if order != 'Upgrade' then
            ChangeState(self, self.RollingOffState)
        else
            self:SetBusy(false)
            self:SetBlockCommandQueue(false)
        end
    end,

    CheckBuildRestriction = function(self, target_bp)
        if self:CanBuild(target_bp.BlueprintId) then
            return true
        else
            return false
        end
    end,
    
    OnFailedToBuild = function(self)
        self.FactoryBuildFailed = true        
        StructureUnit.OnFailedToBuild(self)
        self:DestroyBuildRotator()
        self:StopBuildFx()
        ChangeState(self, self.IdleState)
    end,

    RollOffUnit = function(self)
        local spin, x, y, z = self:CalculateRollOffPoint()
        local units = { self.UnitBeingBuilt }
        self.MoveCommand = IssueMove(units, Vector(x, y, z))
    end,
    
    CalculateRollOffPoint = function(self)
        local bp = self:GetBlueprint().Physics.RollOffPoints
        local px, py, pz = unpack(self:GetPosition())
        if not bp then return 0, px, py, pz end
        local vectorObj = self:GetRallyPoint()
        local bpKey = 1
        local distance, lowest = nil
        for k, v in bp do
            distance = VDist2(vectorObj[1], vectorObj[3], v.X + px, v.Z + pz)
            if not lowest or distance < lowest then
                bpKey = k
                lowest = distance
            end
        end
        local fx, fy, fz, spin
        local bpP = bp[bpKey]
        local unitBP = self.UnitBeingBuilt:GetBlueprint().Display.ForcedBuildSpin
        if unitBP then
            spin = unitBP
        else
            spin = bpP.UnitSpin
        end
        fx = bpP.X + px
        fy = bpP.Y + py
        fz = bpP.Z + pz
        return spin, fx, fy, fz
    end,
    
    StartBuildFx = function(self, unitBeingBuilt)
        
    end,
    
    StopBuildFx = function(self)
        
    end,

    PlayFxRollOff = function(self)
    end,
    
    PlayFxRollOffEnd = function(self)
        if self.RollOffAnim then        
            self.RollOffAnim:SetRate(-1)
            WaitFor(self.RollOffAnim)
            self.RollOffAnim:Destroy()
            self.RollOffAnim = nil
        end
    end,
    
    CreateBuildRotator = function(self)
        if not self.BuildBoneRotator then
            local spin = self:CalculateRollOffPoint()
            local bp = self:GetBlueprint().Display
            self.BuildBoneRotator = CreateRotator(self, bp.BuildAttachBone or 0, 'y', spin, 10000)
            self.Trash:Add(self.BuildBoneRotator)
        end
    end,
    
    DestroyBuildRotator = function(self)
        if self.BuildBoneRotator then
            self.BuildBoneRotator:Destroy()
            self.BuildBoneRotator = nil
        end
    end,
    
    RolloffBody = function(self)
        self:SetBusy(true)
        self:SetBlockCommandQueue(true)
        self:PlayFxRollOff()
        # Wait until unit has left the factory
        while not self.UnitBeingBuilt:IsDead() and self.MoveCommand and not IsCommandDone(self.MoveCommand) do
            WaitSeconds(0.5)
        end
        self.MoveCommand = nil
        self:PlayFxRollOffEnd()
        self:SetBusy(false)
        self:SetBlockCommandQueue(false)
        ChangeState(self, self.IdleState)
    end,
            
    IdleState = State {

        Main = function(self)
            self:ChangeBlinkingLights('Green')
            self:SetBusy(false)
            self:SetBlockCommandQueue(false)
            self:DestroyBuildRotator()
        end,
    },

    BuildingState = State {

        Main = function(self)
            local unitBuilding = self.UnitBeingBuilt
            local bp = self:GetBlueprint()
            local bone = bp.Display.BuildAttachBone or 0
            self:DetachAll(bone)
            unitBuilding:AttachBoneTo(-2, self, bone)
            self:CreateBuildRotator()
            self:StartBuildFx(unitBuilding)
        end,
    },


    RollingOffState = State {
        Main = function(self)
            self:RolloffBody()
        end,
    },

    OnKilled = function(self, instigator, type, overkillRatio)
        StructureUnit.OnKilled(self, instigator, type, overkillRatio)
        if self.UnitBeingBuilt then
            self.UnitBeingBuilt:Destroy()
        end
    end,
}


#-------------------------------------------------------------
#  AIR FACTORY UNITS
#-------------------------------------------------------------
AirFactoryUnit = Class(FactoryUnit) {
}

#-------------------------------------------------------------
#  AIR STAGING PLATFORMS UNITS
#-------------------------------------------------------------
AirStagingPlatformUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},

    OnStopBeingBuilt = function(self,builder,layer)
        StructureUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetMaintenanceConsumptionActive()
    end,
}

#-------------------------------------------------------------
#  ENERGY CREATION UNITS
#-------------------------------------------------------------
ConcreteStructureUnit = Class(StructureUnit) {
    OnCreate = function(self)
        StructureUnit.OnCreate(self)
        self:Destroy()
    end
}


#-------------------------------------------------------------
#  ENERGY CREATION UNITS
#-------------------------------------------------------------
EnergyCreationUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},

}


#-------------------------------------------------------------
#  ENERGY STORAGE UNITS
#-------------------------------------------------------------
EnergyStorageUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},

    OnStopBeingBuilt = function(self,builder,layer)
        StructureUnit.OnStopBeingBuilt(self,builder,layer)
        local aiBrain = GetArmyBrain(self:GetArmy())
        aiBrain:ESRegisterUnitEnergyStorage(self)
        local curEnergy = aiBrain:GetEconomyStoredRatio('ENERGY')
        if curEnergy > 0.11 then
            self:CreateBlinkingLights('Yellow')
        else
            self:CreateBlinkingLights('Red')
        end
    end,

    OnEnergyStorageStateChange = function(self, newState)
        if newState == 'EconLowEnergyStore' then
            self:CreateBlinkingLights('Red')
        elseif newState == 'EconMidEnergyStore' then
            self:CreateBlinkingLights('Yellow')
        elseif newState == 'EconFullEnergyStore' then
            self:CreateBlinkingLights('Green')
        end
    end,

}

#-------------------------------------------------------------
#  LAND FACTORY UNITS
#-------------------------------------------------------------
LandFactoryUnit = Class(FactoryUnit) {}




#-------------------------------------------------------------
#  MASS COLLECTION UNITS
#-------------------------------------------------------------
MassCollectionUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},

    OnCreate = function(self)
        StructureUnit.OnCreate(self)
        local markers = ScenarioUtils.GetMarkers()
        local unitPosition = self:GetPosition()

        for k, v in pairs(markers) do
            if(v.type == 'MASS') then
                local massPosition = v.position
                if( (massPosition[1] < unitPosition[1] + 1) and (massPosition[1] > unitPosition[1] - 1) and
                    (massPosition[2] < unitPosition[2] + 1) and (massPosition[2] > unitPosition[2] - 1) and
                    (massPosition[3] < unitPosition[3] + 1) and (massPosition[3] > unitPosition[3] - 1)) then
                    self:SetProductionPerSecondMass(self:GetProductionPerSecondMass() * (v.amount / 100))
                    break
                end
            end
        end
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        StructureUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetMaintenanceConsumptionActive()
    end,


    OnStartBuild = function(self, unitbuilding, order)
        StructureUnit.OnStartBuild(self, unitbuilding, order)
        self:AddCommandCap('RULEUCC_Stop')
        local massConsumption = self:GetConsumptionPerSecondMass()
        local massProduction = self:GetProductionPerSecondMass()
        self.UpgradeWatcher = self:ForkThread(self.WatchUpgradeConsumption, massConsumption, massProduction)
    end,

    OnStopBuild = function(self, unitbuilding, order)
        StructureUnit.OnStopBuild(self, unitbuilding, order)
        self:RemoveCommandCap('RULEUCC_Stop')
        if self.UpgradeWatcher then
            KillThread(self.UpgradeWatcher)
            self:SetConsumptionPerSecondMass(0)
            self:SetProductionPerSecondMass(self:GetBlueprint().Economy.ProductionPerSecondMass or 0)                  
        end  
    end,
    # band-aid on lack of multiple separate resource requests per unit...  
    # if mass econ is depleted, take all the mass generated and use it for the upgrade

	###Old WatchUpgradeConsumption replaced with this on, enabling mex to not use resources when paused
    WatchUpgradeConsumption = function(self, massConsumption, massProduction)

        # Fix for weird mex behaviour when upgrading with depleted resource stock or while paused [100]
        # Replaced Gowerly's fix with this which is very much inspired by his code. My code looks much better and 
        # seems to work a little better aswell.
        
        local aiBrain = self:GetAIBrain()

        local CalcEnergyFraction = function()
            local fraction = 1
            if aiBrain:GetEconomyStored( 'ENERGY' ) < self:GetConsumptionPerSecondEnergy() then
                fraction = math.min( 1, aiBrain:GetEconomyIncome('ENERGY') / aiBrain:GetEconomyRequested('ENERGY') )
            end
            return fraction
        end

        local CalcMassFraction = function()
            local fraction = 1
            if aiBrain:GetEconomyStored( 'MASS' ) < self:GetConsumptionPerSecondMass() then
                fraction = math.min( 1, aiBrain:GetEconomyIncome('MASS') / aiBrain:GetEconomyRequested('MASS') )
            end
            return fraction
        end

        while not self:IsDead() do

            if self:IsPaused() then
                # paused mex upgrade (another bug here that caused paused upgrades to continue use resources)
                self:SetConsumptionPerSecondMass( 0 )
                self:SetProductionPerSecondMass( massProduction * CalcEnergyFraction() )

            elseif aiBrain:GetEconomyStored( 'MASS' ) < 1 then
                # mex upgrade while out of mass (this is where the engine code has a bug)
                self:SetConsumptionPerSecondMass( massConsumption )
                self:SetProductionPerSecondMass( massProduction / CalcMassFraction() )
                # to use Gowerly's words; the above division cancels the engine bug like matter and anti-matter.
                # the engine seems to do the exact opposite of this division.

            else
                # mex upgrade while enough mass (don't care about energy, that works fine)
                self:SetConsumptionPerSecondMass( massConsumption )
                self:SetProductionPerSecondMass( massProduction * CalcEnergyFraction() )

            end

            WaitTicks(1)
        end
    end,    
    
    OnPaused = function(self)
        StructureUnit.OnPaused(self)
	end,

	OnUnpaused = function(self)
	    StructureUnit.OnUnpaused(self)
	end,
	
    OnProductionPaused = function(self)
        StructureUnit.OnProductionPaused(self)
        self:StopUnitAmbientSound( 'ActiveLoop' )
    end,

    OnProductionUnpaused = function(self)
        StructureUnit.OnProductionUnpaused(self)
        self:PlayUnitAmbientSound( 'ActiveLoop' )
    end,	
}

#-------------------------------------------------------------
#  MASS FABRICATION UNITS
#-------------------------------------------------------------
MassFabricationUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},

    OnStopBeingBuilt = function(self,builder,layer)
        StructureUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetMaintenanceConsumptionActive()
        self:SetProductionActive(true)
    end,

    OnConsumptionActive = function(self)
        StructureUnit.OnConsumptionActive(self)
        self:SetMaintenanceConsumptionActive()
        self:SetProductionActive(true)
    end,

    OnConsumptionInActive = function(self)
        StructureUnit.OnConsumptionInActive(self)
        self:SetMaintenanceConsumptionInactive()
        self:SetProductionActive(false)
    end,
    
    OnPaused = function(self)
        StructureUnit.OnPaused(self)
	end,

	OnUnpaused = function(self)
	    StructureUnit.OnUnpaused(self)
	end,
	
    OnProductionPaused = function(self)
        StructureUnit.OnProductionPaused(self)
        self:StopUnitAmbientSound( 'ActiveLoop' )
    end,

    OnProductionUnpaused = function(self)
        StructureUnit.OnProductionUnpaused(self)
        self:PlayUnitAmbientSound( 'ActiveLoop' )
    end,
	
}

#-------------------------------------------------------------
#  MASS STORAGE UNITS
#-------------------------------------------------------------
MassStorageUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},


    OnStopBeingBuilt = function(self,builder,layer)
        StructureUnit.OnStopBeingBuilt(self,builder,layer)
        local aiBrain = GetArmyBrain(self:GetArmy())
        aiBrain:ESRegisterUnitMassStorage(self)
        local curMass = aiBrain:GetEconomyStoredRatio('MASS')
        if curMass > 0.11 then
            self:CreateBlinkingLights('Yellow')
        else
            self:CreateBlinkingLights('Red')
        end
    end,


    OnMassStorageStateChange = function(self, newState)
        if newState == 'EconLowMassStore' then
            self:CreateBlinkingLights('Red')
        elseif newState == 'EconMidMassStore' then
            self:CreateBlinkingLights('Yellow')
        elseif newState == 'EconFullMassStore' then
            self:CreateBlinkingLights('Green')
        end
    end,

}

#-------------------------------------------------------------
#  RADAR UNITS
#-------------------------------------------------------------
RadarUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},
#Leave Radar on per design 11/14/06
#    # Shut down intel while upgrading
#    OnStartBuild = function(self, unitbuilding, order)
#        StructureUnit.OnStartBuild(self, unitbuilding, order)
#        self:SetMaintenanceConsumptionInactive()
#    end,
#
#    # If we abort the upgrade, re-enable the intel
#    OnStopBuild = function(self, unitBeingBuilt)
#        StructureUnit.OnStopBuild(self, unitBeingBuilt)
#        self:SetMaintenanceConsumptionActive()
#    end,
#
#    # If we abort the upgrade, re-enable the intel
#    OnFailedToBuild = function(self)
#        StructureUnit.OnStopBuild(self)
#        self:SetMaintenanceConsumptionActive()
#    end,

    OnStopBeingBuilt = function(self,builder,layer)
        StructureUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetMaintenanceConsumptionActive()
    end,
    
    OnIntelDisabled = function(self)
        StructureUnit.OnIntelDisabled(self)
        self:DestroyIdleEffects()
        self:DestroyBlinkingLights()
        self:CreateBlinkingLights('Red')
    end,

    OnIntelEnabled = function(self)
        StructureUnit.OnIntelEnabled(self)
        self:DestroyBlinkingLights()
        self:CreateBlinkingLights('Green')
        self:CreateIdleEffects()
    end,
}


#-------------------------------------------------------------
#  RADAR JAMMER UNITS
#-------------------------------------------------------------
RadarJammerUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},

    # Shut down intel while upgrading
    OnStartBuild = function(self, unitbuilding, order)
        StructureUnit.OnStartBuild(self, unitbuilding, order)
        self:SetMaintenanceConsumptionInactive()
        self:DisableIntel('Jammer')
        self:DisableIntel('RadarStealthField')
    end,

    # If we abort the upgrade, re-enable the intel
    OnStopBuild = function(self, unitBeingBuilt)
        StructureUnit.OnStopBuild(self, unitBeingBuilt)
        self:SetMaintenanceConsumptionActive()
        self:EnableIntel('Jammer')
        self:EnableIntel('RadarStealthField')
    end,

    # If we abort the upgrade, re-enable the intel
    OnFailedToBuild = function(self)
        StructureUnit.OnStopBuild(self)
        self:SetMaintenanceConsumptionActive()
        self:EnableIntel('Jammer')
        self:EnableIntel('RadarStealthField')
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        StructureUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetMaintenanceConsumptionActive()
    end,
    
    OnIntelEnabled = function(self)
        StructureUnit.OnIntelEnabled(self)
        if self.IntelEffects and not self.IntelFxOn then
			self.IntelEffectsBag = {}
			self.CreateTerrainTypeEffects( self, self.IntelEffects, 'FXIdle',  self:GetCurrentLayer(), nil, self.IntelEffectsBag )
			self.IntelFxOn = true
		end
    end,

    OnIntelDisabled = function(self)
        StructureUnit.OnIntelDisabled(self)
        EffectUtil.CleanupEffectBag(self,'IntelEffectsBag')
        self.IntelFxOn = false
    end,       
}

#-------------------------------------------------------------
#  SONAR UNITS
#-------------------------------------------------------------
SonarUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},
#Leave Sonar On during upgrade, per design 11/14/06
#    # Shut down intel while upgrading
#    OnStartBuild = function(self, unitbuilding, order)
#        StructureUnit.OnStartBuild(self, unitbuilding, order)
#        self:SetMaintenanceConsumptionInactive()
#        self:DisableIntel('Sonar')
#    end,
#
#    # If we abort the upgrade, re-enable the intel
#    OnStopBuild = function(self, unitBeingBuilt)
#        StructureUnit.OnStopBuild(self, unitBeingBuilt)
#        self:SetMaintenanceConsumptionActive()
#        self:EnableIntel('Sonar')
#    end,
#
#    # If we abort the upgrade, re-enable the intel
#    OnFailedToBuild = function(self)
#        StructureUnit.OnStopBuild(self)
#        self:SetMaintenanceConsumptionActive()
#        self:EnableIntel('Sonar')
#    end,

    OnStopBeingBuilt = function(self,builder,layer)
        StructureUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetMaintenanceConsumptionActive()
    end,
    
    CreateIdleEffects = function(self)
        StructureUnit.CreateIdleEffects(self)
        self.TimedSonarEffectsThread = self:ForkThread( self.TimedIdleSonarEffects )
    end,
    
    TimedIdleSonarEffects = function( self )
        local layer = self:GetCurrentLayer()
        local army = self:GetArmy()
        local pos = self:GetPosition()
        
        if self.TimedSonarTTIdleEffects then
            while not self:IsDead() do
                for kTypeGroup, vTypeGroup in self.TimedSonarTTIdleEffects do
                    local effects = self.GetTerrainTypeEffects( 'FXIdle', layer, pos, vTypeGroup.Type, nil )
                    
                    for kb, vBone in vTypeGroup.Bones do
                        for ke, vEffect in effects do
                            emit = CreateAttachedEmitter(self,vBone,army,vEffect):ScaleEmitter(vTypeGroup.Scale or 1)
                            if vTypeGroup.Offset then
                                emit:OffsetEmitter(vTypeGroup.Offset[1] or 0, vTypeGroup.Offset[2] or 0,vTypeGroup.Offset[3] or 0)
                            end
                        end
                    end                    
                end
                self:PlayUnitSound('Sonar')
                WaitSeconds( 6.0 )                
            end
        end
    end,
    
    DestroyIdleEffects = function(self)
        self.TimedSonarEffectsThread:Destroy()
        StructureUnit.DestroyIdleEffects(self)
    end,    
    
    OnIntelDisabled = function(self)
        StructureUnit.OnIntelDisabled(self)
        self:DestroyBlinkingLights()
        self:CreateBlinkingLights('Red')
    end,

    OnIntelEnabled = function(self)
        StructureUnit.OnIntelEnabled(self)
        self:DestroyBlinkingLights()
        self:CreateBlinkingLights('Green')
    end,
}



#-------------------------------------------------------------
#  SEA FACTORY UNITS
#-------------------------------------------------------------
SeaFactoryUnit = Class(FactoryUnit) {
    # Disable the default rocking behavior
    StartRocking = function(self)
    end,

    StopRocking = function(self)
    end,
}



#-------------------------------------------------------------
#  SHIELD STRCUTURE UNITS
#-------------------------------------------------------------
ShieldStructureUnit = Class(StructureUnit) {
    
	UpgradingState = State(StructureUnit.UpgradingState) {
        Main = function(self)
#            self.MyShield:TurnOff()
            StructureUnit.UpgradingState.Main(self)
        end,

        OnFailedToBuild = function(self)
#            self.MyShield:TurnOn()
            StructureUnit.UpgradingState.OnFailedToBuild(self)
        end,
    }
}

#-------------------------------------------------------------
#  TRANSPORT BEACON UNITS
#-------------------------------------------------------------
TransportBeaconUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},
    FxTransportBeacon = {'/effects/emitters/red_beacon_light_01_emit.bp'},
    #{'/effects/emitters/red_smoke_beacon_01_emit.bp'},
    FxTransportBeaconScale = 0.5,

    # invincibility!  (the only way to kill a transport beacon is
    # to kill the transport unit generating it)
    OnDamage = function(self, instigator, amount, vector, damageType)
    end,

    OnCreate = function(self)
        StructureUnit.OnCreate(self)
        self:SetCapturable(false)
        self:SetReclaimable(false)
    end,
}


#-------------------------------------------------------------
#  WALL STRCUTURE UNITS
#-------------------------------------------------------------
WallStructureUnit = Class(StructureUnit) {
    LandBuiltHiddenBones = {'Floatation'},
}

#-------------------------------------------------------------
#  QUANTUM GATE UNITS
#-------------------------------------------------------------
QuantumGateUnit = Class(FactoryUnit) {
    OnKilled = function(self, instigator, type, overkillRatio)
        self:StopUnitAmbientSound( 'ActiveLoop' )
        FactoryUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

}

