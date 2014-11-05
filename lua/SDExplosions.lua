#****************************************************************************
#**
#**  File     :  /lua/SDExplosions.lua
#**  Author(s):  RK4000
#**
#**  Summary  : Explosions used by Supreme Destruction
#**
#**  Copyright © 2011 RL Powered Games, Inc.  All rights reserved.
#****************************************************************************

local Entity = import('/lua/sim/entity.lua').Entity
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local util = import('/lua/utilities.lua')
local Util = import('/lua/utilities.lua')
local GetRandomFloat = util.GetRandomFloat
local GetRandomInt = util.GetRandomInt
local GetRandomOffset = util.GetRandomOffset
local EfctUtil = import('EffectUtilities.lua')
local CreateEffects = EfctUtil.CreateEffects
local CreateEffectsWithOffset = EfctUtil.CreateEffectsWithOffset
local CreateEffectsWithRandomOffset = EfctUtil.CreateEffectsWithRandomOffset
local CreateBoneEffects = EfctUtil.CreateBoneEffects
local CreateBoneEffectsOffset = EfctUtil.CreateBoneEffectsOffset
local CreateRandomEffects = EfctUtil.CreateRandomEffects
local ScaleEmittersParam = EfctUtil.ScaleEmittersParam
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')	
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')


local GlobalExplosionScaleValueMain = 1
local GlobalExplosionScaleValue = 1 * GlobalExplosionScaleValueMain
WARN('		Global Explosion Scale:		', GlobalExplosionScaleValue )

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle


function GetEffectTemplateFile(toggle)
	if toggle == 1 then
		return SDEffectTemplate
	else 
		return NEffectTemplate
	end
end

##----------------------------------------NECCESARY STUFF----------------------------------------##
function GetUnitSizes( unit )
    local bp = unit:GetBlueprint()
    return bp.SizeX or 0, bp.SizeY or 0, bp.SizeZ or 0
end

function GetUnitVolume( unit )
    local x,y,z = GetUnitSizes( unit )
    return x*y*z
end

function GetAverageBoundingXZRadius( unit )
    local bp = unit:GetBlueprint()
    return ((bp.SizeX or 0 + bp.SizeZ or 0) * 0.5)
end

function GetAverageBoundingXYZRadius( unit )
    local bp = unit:GetBlueprint()
    return ((bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0) * 0.333)
end

function QuatFromRotation( rotation, x, y, z )
    local angleRot, qw, qx, qy, qz, angle
    angle = 0.00872664625 * rotation
    angleRot = math.sin( angle )
    qw = math.cos( angle )
    qx = x * angleRot
    qy = y * angleRot
    qz = z * angleRot
    return qx, qy, qz, qw
end

function CreateFlash( obj, bone, scale, army )
    CreateLightParticle( obj, bone, army, GetRandomFloat(6,10) * scale, GetRandomFloat(10.5, 14.5), 'glow_03', 'ramp_flare_02' )
end

function CreateFlashOffset( obj, bone, scale, army )
    CreateLightParticle( obj, bone, army, GetRandomFloat(6,10) * scale, GetRandomFloat(10.5, 14.5), 'glow_03', 'ramp_flare_02' )
end

function CreateScorchMarkDecalRKSExpAeon( obj, scale, army )
    CreateDecal(obj:GetPosition(),GetRandomFloat(0,2*math.pi),ScorchDecalTexturesAeon[GetRandomInt(1,table.getn(ScorchDecalTexturesAeon))], '', 'Albedo', scale, scale, 1000000000, 1000000000, army)
end

ScorchDecalTexturesAeon = {
    '/mods/rks_explosions/env/common/decals/scorch_rk_01_aeon.dds',
}

function CreateScorchMarkDecalRKSExpCyb( obj, scale, army )
    CreateDecal(obj:GetPosition(),GetRandomFloat(0,2*math.pi),ScorchDecalTexturesCyb[GetRandomInt(1,table.getn(ScorchDecalTexturesCyb))], '', 'Albedo', scale, scale, 1000000000, 1000000000, army)
end

ScorchDecalTexturesCyb = {
    '/mods/rks_explosions/env/common/decals/scorch_rk_01_cyb.dds',
}

function CreateScorchMarkDecalRKSExpSera( obj, scale, army )
    CreateDecal(obj:GetPosition(),GetRandomFloat(0,2*math.pi),ScorchDecalTexturesSera[GetRandomInt(1,table.getn(ScorchDecalTexturesSera))], '', 'Albedo', scale, scale, 1000000000, 1000000000, army)
end

ScorchDecalTexturesSera = {
    '/mods/rks_explosions/env/common/decals/Hi_Res_Scorch.dds',##'/mods/rks_explosions/env/common/decals/scorch_rk_01_sera.dds',
}

##----------------------------------------(end of) NECCESARY STUFF----------------------------------------##

##---------------------------------------------------------
##---------------------------------------------------------
##--Air/Land Unit explosion thread
##---------------------------------------------------------
##---------------------------------------------------------
function AddFalldownTrail(obj)
	local Army = obj:GetArmy()
	local Faction = obj:GetFaction()
	local UnitTechLvl = obj:GetUnitTechLvl()
	local Number = obj:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
	
    local SDFallDownTrail = SDEffectTemplate[UnitTechLvl.. Faction..'FallDownTrail']
    local NFallDownTrail = NEffectTemplate[UnitTechLvl.. Faction..'FallDownTrail']
	
	if (toggle == 1) then
	obj.CreateEffects( obj, SDFallDownTrail, Army, (Number*GlobalExplosionScaleValue/1.85) ) ##Custom falling-down trail
	else
	obj.CreateEffects( obj, NFallDownTrail, Army, (Number*GlobalExplosionScaleValue)) ##No falling-down trail
	end
	
end
function ExplosionAirMidAir(obj)
    local Army = obj:GetArmy()
	local Faction = obj:GetFaction()
	local UnitTechLvl = obj:GetUnitTechLvl()
	local Number = obj:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
	
    local SDExplosion = SDEffectTemplate['AirExplosion'.. UnitTechLvl ..Faction]
    local SDFallDownTrail = SDEffectTemplate[UnitTechLvl.. Faction..'FallDownTrail']
	
	local NExplosion = NEffectTemplate['AirExplosion'.. UnitTechLvl ..Faction]
    local NFallDownTrail = NEffectTemplate[UnitTechLvl.. Faction..'FallDownTrail']
	
	local NumberForShake = (Util.GetRandomFloat( Number, Number + 1 ) )/4.5
	obj:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
	
	if (toggle == 1) then
		obj.CreateEffects( obj, SDExplosion, Army, (Number/1.95*GlobalExplosionScaleValue)) ##Custom explosion when unit is in the air
		obj.CreateEffects( obj, SDFallDownTrail, Army, (Number*GlobalExplosionScaleValue/1.85) ) ##Custom falling-down trail
	else
		obj.CreateEffects( obj, NExplosion, Army, (Number/1.95*GlobalExplosionScaleValue)) ##Default explosion when unit is in the air
		obj.CreateEffects( obj, NFallDownTrail, Army, (Number*GlobalExplosionScaleValue)) ##No falling-down trail
	end
			
	if ( obj:GetUnitTechLvl() == 'TECH1' ) then
		DefaultExplosionsStock.CreateFlash( obj, -1, (Number)/2.5/2.5*2, Army )
	elseif ( obj:GetUnitTechLvl() == 'TECH2' ) then
		DefaultExplosionsStock.CreateFlash( obj, -1, (Number)/2.15/2*2, Army )
	else
		DefaultExplosionsStock.CreateFlash( obj, -1, (Number)/2.75/1.85*2, Army )
	end
	
	##obj.ForkThread(AddFalldownTrail) For some reason, when this was added, the unit exploded twice upon impact with ground.
	
end

function ExplosionAirImpact(obj)
    local Army = obj:GetArmy()
	local Faction = obj:GetFaction()
	local UnitTechLvl = obj:GetUnitTechLvl()
	local Number = obj:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
	
    local SDExplosionImpact = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]  
	local NExplosionImpact = NEffectTemplate['Explosion'.. UnitTechLvl ..Faction]
	local NumberForShake = (Util.GetRandomFloat( Number, Number + 1 ) )/3.5
	
	obj:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
	obj:PlayUnitSound('Destroyed')
	
	if (toggle == 1) then
		obj.CreateEffects( obj, SDExplosionImpact, Army, (Number/1.95*GlobalExplosionScaleValue)) ##Custom explosion when unit is in the air			
	else
		obj.CreateEffects( obj, NExplosionImpact, Army, 1) ##Default explosion when unit is in the air
	end
			
	if ( obj:GetUnitTechLvl() == 'TECH1' ) then
		DefaultExplosionsStock.CreateFlash( obj, -1, (Number)/2.5/2.5, Army )
	elseif ( obj:GetUnitTechLvl() == 'TECH2' ) then
		DefaultExplosionsStock.CreateFlash( obj, -1, (Number)/2.15/2, Army )
	else
		DefaultExplosionsStock.CreateFlash( obj, -1, (Number)/2.75/1.85, Army )
	end
	
	local scale = (DefaultExplosionsStock.GetAverageBoundingXYZRadius(obj)) / 0.3333
	if (UnitTechLvl == 'TECH1') then
	DefaultExplosionsStock.CreateScorchMarkDecalRKS( obj, 0.875, Army )
	elseif (UnitTechLvl == 'TECH2') then
	DefaultExplosionsStock.CreateScorchMarkDecalRKS( obj, 1.3, Army )
	elseif (UnitTechLvl == 'TECH3') then 
	DefaultExplosionsStock.CreateScorchMarkDecalRKS( obj, 1.6, Army )
	else 
	DefaultExplosionsStock.CreateScorchMarkDecalRKS( obj, 5, Army )
	end
end

function AirImpactWater(obj)
    local Army = obj:GetArmy()
	local Faction = obj:GetFaction()
	local UnitTechLvl = obj:GetUnitTechLvl()
	local Number = obj:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
	
    local SDExplosionImpact = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]  
	local NExplosionImpact = NEffectTemplate['Explosion'.. UnitTechLvl ..Faction]
	local NumberForShake = (Util.GetRandomFloat( Number, Number + 1 ) )/3.5
	
	EfctUtil.CreateEffects( obj, obj:GetArmy(), EffectTemplate.Splashy )
	DefaultExplosionsStock.CreateFlash( obj, -1, (Number)/3, Army )
	if (toggle == 1) then 
		obj.CreateEffects( obj, SDEffectTemplate.OilSlick, Army, 0.3*Number*(Util.GetRandomInt(0.1, 1.5)) )
	else 
		obj.CreateEffects( obj, NEffectTemplate.OilSlick, Army, 0.3*Number*(Util.GetRandomInt(0.1, 1.5)) )
	end
end

function ExplosionLand(obj)
	local scale = (DefaultExplosionsStock.GetAverageBoundingXYZRadius(obj)) / 0.333
	local ScaleForScorch = (scale - 0.2 )*1.5
	local Army = obj:GetArmy()
	local army = obj:GetArmy()
	local Faction = obj:GetFaction()
	local UnitTechLvl = obj:GetUnitTechLvl()
	local UnitLayer = obj:GetUnitLayer()
	local BaseEffectTable = {}
    local EnvironmentalEffectTable = {}
    local EffectTable = {}
	local Number = obj:GetNumberByTechLvl(UnitTechLvl or 'TECH1')
    local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
	local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua') 	
	local SDExplosion = SDEffectTemplate['Explosion'.. UnitTechLvl ..Faction]
	local NExplosion = NEffectTemplate['Explosion'.. UnitTechLvl ..Faction]
	local NumberForShake = (Util.GetRandomFloat( Number, Number + 1 ) )/2.5
		obj:PlayUnitSound('Destroyed')
	
		if UnitLayer == 'NAVAL' then
			obj.CreateEffects( obj, SDEffectTemplate.AddNothing, Army, 0)
		else
			if (toggle == 1) then
				obj.CreateEffects( obj, SDExplosion, Army, Number)
			else
				obj.CreateEffects( obj, SDEffectTemplate.AddNothing, Army, Number)
			end
		end
		
		DefaultExplosionsStock.CreateFlash( obj, -1, Number/1.65, Army ) 
		
		if (toggle == 1) then
			obj:ShakeCamera( 30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
		else
			obj:ShakeCamera( 0, 0, 0, 0) ##Stock explosions handle shaking in CreateScalableUnitExplosion
		end
		
        DefaultExplosionsStock.CreateScorchMarkDecalRKS( obj, ScaleForScorch , army )
		
end
##---------------------------------------------------------
##---------------------------------------------------------
##--Debris 
##---------------------------------------------------------
##---------------------------------------------------------
function CreateShipFlamingDebrisProjectiles( obj, volume, dimensions )
    local bp = obj:GetBlueprint()
    local Army = obj:GetArmy()
    local Faction = obj:GetFaction()

    local partamounts = (math.min(GetRandomInt( 1 + (volume * 50), (volume * 100) ) , 250)) /10
    local sx, sy, sz = unpack(dimensions)
	local vector = obj.Spec.OverKillRatio.debris_Vector
    for i = 1, partamounts do
        local xpos, xpos, zpos = GetRandomOffset( sx, sy, sz, 1 )
		local xdir,ydir,zdir = GetRandomOffset( sx, sy, sz, 3 ) ##sx, sy, sz, 
		if vector then
			xdir = (vector[1] * 5) + 0##+ GetRandomOffset2( sx, sy, sz, 3 )
			ydir = math.abs((vector[2] * 5 )) + 0##+ GetRandomOffset( sx, sy, sz, 3 )
			zdir = (vector[3] * 5) + 0##+ GetRandomOffset2( sx, sy, sz, 1 )
		end

        local rand = 4
		if volume < 0.2 then
			rand = 9
		elseif volume > 2 then
			rand = 10
		end
        if Faction == 'uef' then
        obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEF/DebrisFlamingUEF_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        elseif Faction == 'cybran' then
        obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybran/DebrisFlamingCybran_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        elseif Faction == 'aeon' then
        obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeon/DebrisFlamingAeon_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        elseif Faction == 'seraphim' then
        obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphim/DebrisFlamingSeraphim_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        end
    end
end

function CreateInheritedVelocityDebrisProjectiles( obj, numOfDebris, speed, preVelocity, spreadMul, spread, debris )
	local RandomFloat = import('/lua/utilities.lua').GetRandomFloat
    local bp = obj:GetBlueprint()
    local Army = obj:GetArmy()
    local Faction = obj:GetFaction()
	

    local vx, vy, vz = unpack(speed)
   		
		# Create several other projectiles in a dispersal pattern
        local angle = (2*math.pi) / numOfDebris
        local angleInitial = RandomFloat( 0, angle )
        
        # Randomization of the spread
        local angleVariation = angle * spread # Adjusts angle variance spread       
        
        local xVec = 0 
        local yVec = 0
        local zVec = 0

        # Launch projectiles at semi-random angles away from split location
        for i = 0, (numOfDebris -1) do
		local velocity = util.GetRandomFloat(preVelocity/2, preVelocity*2)
		
            xVec = vx + (GetRandomInt(0.6, 1.3) * ((math.sin(angleInitial + (i*angle) + RandomFloat(-angleVariation, angleVariation))) * spreadMul)) + util.GetRandomFloat(-0.3, 0.3)
            zVec = vz + (GetRandomInt(0.6, 1.3) * ((math.cos(angleInitial + (i*angle) + RandomFloat(-angleVariation, angleVariation))) * spreadMul)) + util.GetRandomFloat(-0.3, 0.3)
			yVec = vy + (GetRandomInt(0.6, 1.3) * ((math.cos(angleInitial + (i*angle) + RandomFloat(-angleVariation, angleVariation))) * spreadMul)) + util.GetRandomFloat(-0.3, 0.3) + util.GetRandomFloat(0, 0.5) ##Eject upward a bit more
            obj:CreateProjectile(debris):SetVelocity(xVec,yVec,zVec):SetVelocity(velocity)        
        end
end

function CreateUpwardsVelocityDebrisProjectiles( obj, numOfDebris, speed, preVelocity, spreadMul, spread, debris )
	local RandomFloat = import('/lua/utilities.lua').GetRandomFloat
    local bp = obj:GetBlueprint()
    local Army = obj:GetArmy()
    local Faction = obj:GetFaction()
	

    local vx, vy, vz = unpack(speed)
   		
		# Create several other projectiles in a dispersal pattern
        local angle = (2*math.pi) / numOfDebris
        local angleInitial = RandomFloat( 0, angle )
        
        # Randomization of the spread
        local angleVariation = angle * spread # Adjusts angle variance spread       
        
        local xVec = 0 
        local yVec = 0
        local zVec = 0

        # Launch projectiles at semi-random angles away from split location
        for i = 0, (numOfDebris -1) do
		local velocity = util.GetRandomFloat(preVelocity/2, preVelocity*2)
		
            xVec = vx + (GetRandomInt(0.6, 1.3) * ((math.sin(angleInitial + (i*angle) + RandomFloat(-angleVariation, angleVariation))) * spreadMul)) + util.GetRandomFloat(-0.3, 0.3) + util.GetRandomFloat(-2.0, 2.5) ##Eject upward a bit more
            zVec = vz + (GetRandomInt(0.6, 1.3) * ((math.cos(angleInitial + (i*angle) + RandomFloat(-angleVariation, angleVariation))) * spreadMul)) + util.GetRandomFloat(-0.3, 0.3) + util.GetRandomFloat(-2.0, 2.5) ##Eject upward a bit more
			yVec = vy + (GetRandomInt(0.6, 1.3) * ((math.cos(angleInitial + (i*angle) + RandomFloat(-angleVariation, angleVariation))) * spreadMul)) + util.GetRandomFloat(-0.3, 0.3) + util.GetRandomFloat(-2.0, 2.5) ##Eject upward a bit more
            obj:CreateProjectile(debris):SetVelocity(xVec,yVec,zVec):SetVelocity(velocity)        
        end
end

##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone Varied Explosion 
##---------------------------------------------------------
##---------------------------------------------------------
function CreateFactionalExplosionAtBone( obj, boneName, scale, EXPLOSION )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, EXPLOSION )
end
##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone UEF Explosions (Very Large/Large/Med/Small)---------
##---------------------------------------------------------
##---------------------------------------------------------

function CreateUEFSmallHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionSmallSD )
end

function CreateUEFMediumHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionMediumSD )
end

function CreateUEFLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionLargeShortDurSmoke )
    ##CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionEffectsLrg02 )
end

function CreateUEFLargeShortDurSmokeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionLargeShortDurSmoke )
    ##CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionEffectsLrg02 )
end

function CreateUEFVeryLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionVeryLarge )
    ##CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionEffectsLrg02 )
end

function CreateUEFVeryLargeShortDurSmokeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionVeryLargeShortDurSmoke )
    ##CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionEffectsLrg02 )
end

##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone Cybran Explosions (Very Large/Large/Med/Small)
##---------------------------------------------------------
##---------------------------------------------------------

function CreateCybranSmallHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
	CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPMediumCybran )##:ScaleEmitter(1)
end

function CreateCybranMediumHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPMediumCybran )##:ScaleEmitter(2.5)
end

function CreateCybranLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPMediumCybran )##:ScaleEmitter(5)
end

function CreateCybranVeryLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPMediumCybran )##:ScaleEmitter(10)
end

function CreateCybranFinalLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPLargeCybran )##:ScaleEmitter(10)
end

##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone Aeon Explosions (Very Large/Large/Med/Small)
##---------------------------------------------------------
##---------------------------------------------------------

function CreateAeonSmallHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
	CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPSmallAeon )##:ScaleEmitter(1)
end

function CreateAeonMediumHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPMediumAeon )##:ScaleEmitter(2.5)
end

function CreateAeonLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPLargeAeon )##:ScaleEmitter(5)
end
function CreateAeonLargeInitialHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPLargeInitialAeon )##:ScaleEmitter(5)
end

function CreateAeonVeryLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPLargeAeon )##:ScaleEmitter(10)
end

function CreateAeonFinalLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPVeryLargeAeon )##:ScaleEmitter(10)
end

##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone Sera Explosions (Very Large/Large/Med/Small)
##---------------------------------------------------------
##---------------------------------------------------------

function CreateSeraSmallHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
	CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPMediumSera )##:ScaleEmitter(1)
end

function CreateSeraMediumHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPMediumSera )##:ScaleEmitter(2.5)
end

function CreateSeraLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPLargeSera )##:ScaleEmitter(5)
end

function CreateSeraVeryLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPLargeSera )##:ScaleEmitter(10)
end

function CreateSeraFinalLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, GetEffectTemplateFile(toggle).ExplosionEXPLargeSera  )##:ScaleEmitter(10)
end