local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')
local DefaultExplosions = import('/lua/defaultexplosions.lua')
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')
local Entity = import('/lua/sim/entity.lua').Entity
local EffectTemplate = import('/lua/EffectTemplates.lua')
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

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function CreateScalableUnitExplosion(unit, overKillRatio)
    if unit then
        if IsUnit(unit) then
            local explosionEntity = DefaultExplosions.CreateUnitExplosionEntity(unit, overKillRatio)
            ForkThread(_CreateScalableUnitExplosion, explosionEntity)
        end
    end
end

function CreateEffectsScalable(obj, army, EffectTable, scale)
    local emitters = {}
    for k, v in EffectTable do
        table.insert(emitters,CreateEmitterAtEntity( obj, army, v ):ScaleEmitter(scale))
    end
    return emitters
end

function CreateScorchMarkDecalRKS(obj, scale, army)
    CreateDecal(obj:GetPosition(),GetRandomFloat(0, 2*math.pi),ScorchDecalTextures[GetRandomInt(1,table.getn(ScorchDecalTextures))], '', 'Albedo', scale *3, scale *3, GetRandomFloat(200*4,350*4), GetRandomFloat(300,600), army)
end

ScorchDecalTextures = {
    'scorch_001_albedo',
    'scorch_002_albedo',
    'scorch_003_albedo',
    'scorch_004_albedo',
    'scorch_005_albedo',
    'scorch_006_albedo',
    'scorch_007_albedo',
    'scorch_008_albedo',
    'scorch_009_albedo',
    'scorch_010_albedo',
}

function _CreateScalableUnitExplosion(obj)
    local army = obj.Spec.Army
    local scale = (obj.Spec.BoundingXYZRadius) / 0.3333
    local scalefornavy = scale *0.333
    local layer = obj.Spec.Layer
    local BaseEffectTable = {}
    local EnvironmentalEffectTable = {}
    local EffectTable = {}
    local ShakeTimeModifier = 0
    local ShakeMaxMul = 1
    local Number = (scale - 0.2) *1.4
    local Numberfornavy = (scalefornavy - 0.2) *1.4

    -- Determine effect table to use, based on unit bounding box scale
    -- LOG(scale)
    if layer == 'Land' then
        if scale < 1.1 then   -- Small units
            if toggle == 1 then
                BaseEffectTable = SDEffectTemplate.AddNothing   ----Not needed, RKS only emits on start in a separate function
            else
                BaseEffectTable = NEffectTemplate.ExplosionSmallest
            end
        elseif scale > 3.75 then -- Large units
            if toggle == 1 then
                BaseEffectTable = SDEffectTemplate.AddNothing   ----Not needed, RKS only emits on start in a separate function
            else
                BaseEffectTable = NEffectTemplate.ExplosionSmall
            end
            ShakeTimeModifier = 1.0
            ShakeMaxMul = 0.25
        else                  -- Medium units
            if toggle == 1 then
                BaseEffectTable = SDEffectTemplate.AddNothing   ----Not needed, RKS only emits on start in a separate function
            else
                BaseEffectTable = NEffectTemplate.ExplosionSmaller
            end
        end
    end

    if layer == 'Air' then
        if scale < 1.1 then   ---- Small units
           BaseEffectTable = SDEffectTemplate.AddNothing
        elseif scale > 3 then ---- Large units
            BaseEffectTable = SDEffectTemplate.AddNothing
            ShakeTimeModifier = 1.0
            ShakeMaxMul = 0.25
        else                  ---- Medium units
            BaseEffectTable = SDEffectTemplate.AddNothing
        end
    end

    if layer == 'Water' then
        if scalefornavy < 1 then   ---- Small units
           BaseEffectTable = EffectTemplate.ExplosionSmallWater
        elseif scalefornavy > 3 then ---- Large units
            BaseEffectTable = EffectTemplate.ExplosionMediumWater
            ShakeTimeModifier = 1.0
            ShakeMaxMul = 0.25
        else                  ---- Medium units
            BaseEffectTable = EffectTemplate.ExplosionMediumWater
        end
    end

    if layer == 'Sub' then
        if scalefornavy < 1.1 then   ---- Small units
            BaseEffectTable = EffectTemplate.ExplosionSmallUnderWater
        elseif scalefornavy > 3 then ---- Large units
            BaseEffectTable = EffectTemplate.ExplosionSmallUnderWater
            ShakeTimeModifier = 1.0
            ShakeMaxMul = 0.25
        else                  ---- Medium units
            BaseEffectTable = EffectTemplate.ExplosionSmallUnderWater
        end
    end

    -- Get Environmental effects for current layer
    EnvironmentalEffectTable = DefaultExplosions.GetUnitEnvironmentalExplosionEffects( layer, scale )

    -- Merge resulting tables to final explosion emitter list
    if table.getn( EnvironmentalEffectTable ) ~= 0 then
        EffectTable = util.TableCat( BaseEffectTable, EnvironmentalEffectTable )
    else
        EffectTable = BaseEffectTable
    end

    -----------------------------------------------------------------
    -- Create Generic emitter effects
    if layer == 'Water' then
        CreateEffectsScalable( obj, army, EffectTable, Numberfornavy/2 )
    elseif scale > 3 then
        CreateEffectsScalable( obj, army, EffectTable, Number*0 )
    else
        CreateEffectsScalable( obj, army, EffectTable, Number )
    end
    ----LOG(Number)
    -- Create Light particle flash
    DefaultExplosionsStock.CreateFlash( obj, -1, 0, army )

    -- Create GenericDebris chunks
    -- DefaultExplosionsStock.CreateDebrisProjectiles( obj, obj.Spec.BoundingXYZRadius, obj.Spec.Dimensions )    No debris for now, need to improve the look of them first.
    -- Camera Shake  (.radius .maxshake .minshake .lifetime)
    if toggle == 1 then
        obj:ShakeCamera(0, 0, 0, 0 )
    else
        obj:ShakeCamera(30 * scale, scale * ShakeMaxMul, 0, 0.5 + ShakeTimeModifier)
    end
    obj:Destroy()
end

function CreateDebrisProjectiles(obj, volume, dimensions)
    local partamounts = (math.min(GetRandomInt(1 + (volume * 50), (volume * 100)) , 250) /2.15)
    local sx, sy, sz = unpack(dimensions)
    local vector = obj.Spec.OverKillRatio.debris_Vector
    for i = 1, partamounts do
        local xpos, xpos, zpos = GetRandomOffset(sx, sy, sz, 1)
        local xdir,ydir,zdir = GetRandomOffset(sx, sy, sz, 10)
        if vector then
            xdir = (vector[1] * 5) + GetRandomOffset2(sx, sy, sz, 3)
            ydir = math.abs((vector[2] * 5 )) + GetRandomOffset(sx, sy, sz, 3)
            zdir = (vector[3] * 5) + GetRandomOffset2(sx, sy, sz, 1)
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
