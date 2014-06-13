local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local DefaultExplosions = import('/mods/rks_explosions/hook/lua/defaultexplosions.lua')
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')
local Entity = import('/lua/sim/entity.lua').Entity
local EffectTemplate = import('/mods/rks_explosions/hook/lua/EffectTemplates.lua')
local util = import('/lua/utilities.lua')
local GetRandomFloat = util.GetRandomFloat
local GetRandomInt = util.GetRandomInt
local GetRandomOffset = util.GetRandomOffset
local GetRandomOffset2 = util.GetRandomOffset2
local EfctUtil = import('/lua/EffectUtilities.lua')
local CreateEffects = EfctUtil.CreateEffects
local CreateEffectsWithOffset = EfctUtil.CreateEffectsWithOffset
local CreateEffectsWithRandomOffset = EfctUtil.CreateEffectsWithRandomOffset
local CreateBoneEffects = EfctUtil.CreateBoneEffects
local CreateBoneEffectsOffset = EfctUtil.CreateBoneEffectsOffset
local CreateRandomEffects = EfctUtil.CreateRandomEffects
local ScaleEmittersParam = EfctUtil.ScaleEmittersParam

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

function MakeExplosionEntitySpec(unit, overKillRatio)
    return {
        Army = unit:GetArmy(),
        Dimensions = {GetUnitSizes( unit )},
        BoundingXZRadius = GetAverageBoundingXZRadius(unit),
        BoundingXYZRadius = GetAverageBoundingXYZRadius(unit),
        OverKillRatio = overKillRatio,
        Volume = GetUnitVolume( unit ), 
        Layer = unit:GetCurrentLayer(),
    }    
end

function CreateUnitExplosionEntity( unit, overKillRatio )
    local localentity = Entity(MakeExplosionEntitySpec(unit, overKillRatio))
    Warp( localentity, unit:GetPosition())
    return localentity
end


function CreateScalableUnitExplosion( unit, overKillRatio )
	if unit then
		if IsUnit(unit) then 
			local explosionEntity = DefaultExplosions.CreateUnitExplosionEntity( unit, overKillRatio )
			ForkThread( _CreateScalableUnitExplosion, explosionEntity )
		end
	end
end

function _CreateScalableUnitExplosion( obj )
    local army = obj.Spec.Army
    local scale = obj.Spec.BoundingXZRadius
    local layer = obj.Spec.Layer
    local BaseEffectTable = {}
    local EnvironmentalEffectTable = {}
    local EffectTable = {}
    local ShakeTimeModifier = 0
    local ShakeMaxMul = 1 

    # Determine effect table to use, based on unit bounding box scale
    #LOG(scale)
    if layer == 'Land' then 
	    if scale < 1.1 then   ## Small units
             BaseEffectTable = SDEffectTemplate.AddNothing   ##Not needed, stuff uses custom explosions now.
		elseif scale > 3.75 then ## Large units
			BaseEffectTable = SDEffectTemplate.AddNothing   ##Not needed, stuff uses custom explosions now.
			ShakeTimeModifier = 1.0
			ShakeMaxMul = 0.25
		else                  ## Medium units
			BaseEffectTable = SDEffectTemplate.AddNothing   ##Not needed, stuff uses custom explosions now.
		end
	end
	
	if layer == 'Air' then 
	    if scale < 1.1 then   ## Small units
             BaseEffectTable = EffectTemplate.ExplosionSmallAir  
		elseif scale > 3 then ## Large units
			BaseEffectTable = EffectTemplate.ExplosionLarge
			ShakeTimeModifier = 1.0
			ShakeMaxMul = 0.25
		else                  ## Medium units
			BaseEffectTable = EffectTemplate.ExplosionMedium
		end
	end
	
	if layer == 'Water' then 
	    if scale < 1 then   ## Small units
             BaseEffectTable = EffectTemplate.ExplosionSmallWater 
		elseif scale > 3 then ## Large units
			BaseEffectTable = EffectTemplate.ExplosionMediumWater
			ShakeTimeModifier = 1.0
			ShakeMaxMul = 0.25
		else                  ## Medium units
			BaseEffectTable = EffectTemplate.ExplosionMediumWater
		end
	end

        if layer == 'Sub' then 
	    if scale < 1.1 then   ## Small units
             BaseEffectTable = EffectTemplate.ExplosionSmallUnderWater 
		elseif scale > 3 then ## Large units
			BaseEffectTable = EffectTemplate.ExplosionSmallUnderWater
			ShakeTimeModifier = 1.0
			ShakeMaxMul = 0.25
		else                  ## Medium units
			BaseEffectTable = EffectTemplate.ExplosionSmallUnderWater
		end
	end

    # Get Environmental effects for current layer
    EnvironmentalEffectTable = DefaultExplosions.GetUnitEnvironmentalExplosionEffects( layer, scale )

    # Merge resulting tables to final explosion emitter list
    if table.getn( EnvironmentalEffectTable ) != 0 then
        EffectTable = EffectTemplate.TableCat( BaseEffectTable, EnvironmentalEffectTable )
    else
        EffectTable = BaseEffectTable
    end
    
    #LOG( 'ExplosionEntity ', repr(obj), '\nEffect Table ', repr(EffectTable), '\nPosition ', repr(obj:GetPosition()) )

    #---------------------------------------------------------------
    # Create Generic emitter effects
    CreateEffects( obj, army, EffectTable )

    # Create Light particle flash
    DefaultExplosionsStock.CreateFlash( obj, -1, scale, army )

    # Create scorch mark
    if layer == 'Land' then
        if scale > 1.2 then
            DefaultExplosionsStock.CreateScorchMarkDecal( obj, scale, army )
        else
            DefaultExplosionsStock.CreateScorchMarkSplat( obj, scale, army )
        end
    end

    # Create GenericDebris chunks
    DefaultExplosionsStock.CreateDebrisProjectiles( obj, obj.Spec.BoundingXYZRadius, obj.Spec.Dimensions )

    # Camera Shake  (.radius .maxshake .minshake .lifetime)
    obj:ShakeCamera( 30 * scale, scale * ShakeMaxMul, 0, 0.5 + ShakeTimeModifier )
    #---------------------------------------------------------------
    #WaitSeconds( 5 )
    #_CreateScalableUnitExplosion( obj )
    obj:Destroy()
end

function GetUnitEnvironmentalExplosionEffects( layer, scale )
    local EffectTable = {}
    if layer == 'Water' then
        if scale < 0.5 then
            EffectTable = EffectTemplate.Splashy      
        elseif scale > 1.5 then
            EffectTable = EffectTemplate.ExplosionMediumWater      
        else
            EffectTable = EffectTemplate.ExplosionSmallWater      
        end
    end 
    return EffectTable
end

function CreateDebrisProjectiles( obj, volume, dimensions )
    local partamounts = (math.min(GetRandomInt( 1 + (volume * 50), (volume * 100) ) , 250) /2.15)
    ##local partamounts = GetRandomInt(1,3)
    local sx, sy, sz = unpack(dimensions)
	local vector = obj.Spec.OverKillRatio.debris_Vector
    for i = 1, partamounts do
        local xpos, xpos, zpos = GetRandomOffset( sx, sy, sz, 1 )
		local xdir,ydir,zdir = GetRandomOffset( sx, sy, sz, 10 )
		if vector then
			xdir = (vector[1] * 5) + GetRandomOffset2( sx, sy, sz, 3 )
			ydir = math.abs((vector[2] * 5 )) + GetRandomOffset( sx, sy, sz, 3 )
			zdir = (vector[3] * 5) + GetRandomOffset2( sx, sy, sz, 1 )
		end

        local rand = 4
		if volume < 0.2 then
			rand = 9
		elseif volume > 2 then
			rand = 10
		end
        obj:CreateProjectile('/effects/entities/DebrisMisc0' .. rand .. '/DebrisMisc0' .. rand .. '_proj.bp',xpos,xpos,zpos,xdir,ydir + 4.5,zdir)
    end
end
