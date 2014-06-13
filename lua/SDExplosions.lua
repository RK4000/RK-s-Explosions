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
local util = import('utilities.lua')
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
##----------------------------------------(end of) NECCESARY STUFF----------------------------------------##

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

##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone UEF Explosions (Very Large/Large/Med/Small)---------
##---------------------------------------------------------
##---------------------------------------------------------

function CreateUEFSmallHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionSmallSD )
end

function CreateUEFMediumHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionMedium )
end

function CreateUEFLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionLarge )
    CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionEffectsLrg02 )
end

function CreateUEFLargeShortDurSmokeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionLargeShortDurSmoke )
    CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionEffectsLrg02 )
end

function CreateUEFVeryLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionVeryLarge )
    CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionEffectsLrg02 )
end

function CreateUEFVeryLargeShortDurSmokeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
    CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionVeryLargeShortDurSmoke )
    CreateBoneEffects( obj, boneName, army, EffectTemplate.ExplosionEffectsLrg02 )
end

##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone Cybran Explosions (Very Large/Large/Med/Small)
##---------------------------------------------------------
##---------------------------------------------------------

function CreateCybranSmallHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
	CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPMediumCybran )##:ScaleEmitter(1)
end

function CreateCybranMediumHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPMediumCybran )##:ScaleEmitter(2.5)
end

function CreateCybranLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPMediumCybran )##:ScaleEmitter(5)
end

function CreateCybranVeryLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPMediumCybran )##:ScaleEmitter(10)
end

function CreateCybranFinalLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPLargeCybran )##:ScaleEmitter(10)
end

##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone Aeon Explosions (Very Large/Large/Med/Small)
##---------------------------------------------------------
##---------------------------------------------------------

function CreateAeonSmallHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
	CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPMediumAeon )##:ScaleEmitter(1)
end

function CreateAeonMediumHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPMediumAeon )##:ScaleEmitter(2.5)
end

function CreateAeonLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPLargeAeon )##:ScaleEmitter(5)
end

function CreateAeonVeryLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPLargeAeon )##:ScaleEmitter(10)
end

function CreateAeonFinalLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPVeryLargeAeon )##:ScaleEmitter(10)
end

##---------------------------------------------------------
##---------------------------------------------------------
##--OnBone Sera Explosions (Very Large/Large/Med/Small)
##---------------------------------------------------------
##---------------------------------------------------------

function CreateSeraSmallHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
	CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPMediumSera )##:ScaleEmitter(1)
end

function CreateSeraMediumHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPMediumSera )##:ScaleEmitter(2.5)
end

function CreateSeraLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPLargeSera )##:ScaleEmitter(5)
end

function CreateSeraVeryLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPLargeSera )##:ScaleEmitter(10)
end

function CreateSeraFinalLargeHitExplosionAtBone( obj, boneName, scale )
    local army = obj:GetArmy()
    CreateFlash( obj, boneName, scale * 0.5, army )
		CreateBoneEffects( obj, boneName, army, SDEffectTemplate.ExplosionEXPLargeSera  )##:ScaleEmitter(10)
end