--#****************************************************************************
--#**
--#**  File     :  /lua/SDExplosions.lua
--#**  Author(s):  RK4000
--#**
--#**  Summary  : Explosions used by Supreme Destruction/RK's Explosions
--#**
--#**  Copyright © 2011 RK Powered Games, Inc.  All rights reserved.
--#****************************************************************************
local EffectTemplate = import('/lua/EffectTemplates.lua')
local Util = import('/lua/utilities.lua')
local GetRandomFloat = Util.GetRandomFloat
local GetRandomInt = Util.GetRandomInt
local GetRandomOffset = Util.GetRandomOffset
local EfctUtil = import('/lua/EffectUtilities.lua')
local CreateEffects = EfctUtil.CreateEffects
local CreateEffectsWithOffset = EfctUtil.CreateEffectsWithOffset
local CreateEffectsWithRandomOffset = EfctUtil.CreateEffectsWithRandomOffset
local CreateBoneEffects = EfctUtil.CreateBoneEffects
local CreateBoneEffectsOffset = EfctUtil.CreateBoneEffectsOffset
local CreateRandomEffects = EfctUtil.CreateRandomEffects
local ScaleEmittersParam = EfctUtil.ScaleEmittersParam
local RKUtil = import('/mods/rks_explosions/lua/SDUtilities.lua')
local GetRandomFloatWithAvoidMiddleFactor = RKUtil.GetRandomFloatWithAvoidMiddleFactor
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua') 
local DefaultExplosionsStock = import('/lua/defaultexplosions.lua')

local GlobalExplosionScaleValueMain = 1
local GlobalExplosionScaleValue = 1 * GlobalExplosionScaleValueMain
LOG('      Global Explosion Scale:     ', GlobalExplosionScaleValue)

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function GetEffectTemplateFile(toggle)
    if toggle == 1 then
        return SDEffectTemplate
    else 
        return NEffectTemplate
    end
end

----------------------------------------NECCESARY STUFF----------------------------------------
function GetAverageBoundingXZRadius(unit)
    local bp = unit:GetBlueprint()
    return ((bp.SizeX or 0 + bp.SizeZ or 0) * 0.5)
end

function GetAverageBoundingXYZRadius(unit)
    local bp = unit:GetBlueprint()
    return ((bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0) * 0.333)
end

function QuatFromRotation(rotation, x, y, z)
    local angleRot, qw, qx, qy, qz, angle
    angle = 0.00872664625 * rotation
    angleRot = math.sin(angle)
    qw = math.cos(angle)
    qx = x * angleRot
    qy = y * angleRot
    qz = z * angleRot
    return qx, qy, qz, qw
end

local FlashTransparent = {
    '/mods/rks_explosions/textures/particles/glow_03_transparent.dds'
}

function CreateFlash(obj, bone, scale, army)
    CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale/1.575/1.5, GetRandomFloat(10.5*1.65, 14.5*1.65), FlashTransparent, 'ramp_flare_02')
    CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale/1.5, GetRandomFloat(10.5, 14.5), FlashTransparent, 'ramp_flare_02')
    CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale*1.575/1.5, GetRandomFloat(10.5/4.15, 14.5/4.15), FlashTransparent, 'ramp_flare_02')
end

function CreateFlashShort(obj, bone, scale, army, mult)
    -- CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale/1.575, GetRandomFloat(10.5*1.65, 14.5*1.65)/mult, FlashTransparent, 'ramp_flare_02')
    -- CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale, GetRandomFloat(10.5, 14.5)/mult, FlashTransparent, 'ramp_flare_02')
    CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale*1.575, GetRandomFloat(10.5/4.15, 14.5/4.15)/mult, FlashTransparent, 'ramp_flare_02')
end

function CreateFlashLong(obj, bone, scale, army, mult)
    CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale/1.575, GetRandomFloat(10.5*1.65, 14.5*1.65)*mult, FlashTransparent, 'ramp_flare_02')
    CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale, GetRandomFloat(10.5, 14.5)*mult, FlashTransparent, 'ramp_flare_02')
    CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale*1.775, GetRandomFloat(10.5/4.15, 14.5/4.15)*(mult/2), FlashTransparent, 'ramp_flare_02')
end

function CreateFlashOffset(obj, bone, scale, army)
    CreateLightParticle(obj, bone, army, GetRandomFloat(6,10) * scale, GetRandomFloat(10.5, 14.5), 'glow_03', 'ramp_flare_02')
end

local ScorchDecalTexturesShortLasting = {
    'scorch_006_albedo',
    'scorch_007_albedo',
}

local ScorchDecalTexturesAeon = {
    '/mods/rks_explosions/env/common/decals/Hi_Res_Scorch_Black.dds', -- '/mods/rks_explosions/env/common/decals/scorch_rk_01_aeon.dds',
}

function CreateScorchMarkDecalRKSExpAeon(obj, scale, army)
    local pos = obj:GetPosition()
    CreateDecal(pos, GetRandomFloat(0, 2 * math.pi), ScorchDecalTexturesShortLasting[GetRandomInt(1, table.getn(ScorchDecalTexturesShortLasting))], '', 'Albedo', scale, scale, 10000000, 500, army)
    CreateDecal(pos, GetRandomFloat(0, 2 * math.pi), ScorchDecalTexturesAeon[GetRandomInt(1, table.getn(ScorchDecalTexturesAeon))], '', 'Albedo', scale * 2, scale * 2, 1000000000, 1000000000, army)
end

local ScorchDecalTexturesCyb = {
    '/mods/rks_explosions/env/common/decals/Hi_Res_Scorch_Black.dds', -- '/mods/rks_explosions/env/common/decals/scorch_rk_01_cyb.dds',
}

function CreateScorchMarkDecalRKSExpCyb(obj, scale, army)
    local pos = obj:GetPosition()
    CreateDecal(pos, GetRandomFloat(0, 2 * math.pi), ScorchDecalTexturesShortLasting[GetRandomInt(1, table.getn(ScorchDecalTexturesShortLasting))], '', 'Albedo', scale, scale, 10000000, 500, army)
    CreateDecal(pos, GetRandomFloat(0, 2 * math.pi), ScorchDecalTexturesCyb[GetRandomInt(1, table.getn(ScorchDecalTexturesCyb))], '', 'Albedo', scale * 2, scale * 2, 1000000000, 1000000000, army)
end

local ScorchDecalTexturesSera = {
    '/mods/rks_explosions/env/common/decals/Hi_Res_Scorch_Black.dds', -- '/mods/rks_explosions/env/common/decals/scorch_rk_01_sera.dds',
}

function CreateScorchMarkDecalRKSExpSera(obj, scale, army)
    local pos = obj:GetPosition()
    CreateDecal(pos, GetRandomFloat(0, 2 * math.pi), ScorchDecalTexturesShortLasting[GetRandomInt(1, table.getn(ScorchDecalTexturesShortLasting))], '', 'Albedo', scale, scale, 10000000, 500, army)
    CreateDecal(pos, GetRandomFloat(0, 2 * math.pi), ScorchDecalTexturesSera[GetRandomInt(1, table.getn(ScorchDecalTexturesSera))], '', 'Albedo', scale * 2, scale * 2, 1000000000, 1000000000, army)
end

----------------------------------------(end of) NECCESARY STUFF--------------------------------------

---------------------------------
-- Air/Land Unit explosion thread
---------------------------------
function AddFalldownTrail(obj)
    local SDFallDownTrail = SDEffectTemplate['FallDownTrail' .. obj.TechLevel .. obj.factionCategory]
    local NFallDownTrail = NEffectTemplate['FallDownTrail' .. obj.TechLevel .. obj.factionCategory]

    if toggle == 1 then
        obj.CreateEffects(obj, SDFallDownTrail, obj.Army, (obj.TechLevelMultiplier * GlobalExplosionScaleValue/1.85)) -- Custom falling-down trail
    else
        obj.CreateEffects(obj, NFallDownTrail, obj.Army, (obj.TechLevelMultiplier * GlobalExplosionScaleValue)) -- No falling-down trail
    end
end

function ExplosionAirMidAir(obj)
    local SDExplosion = SDEffectTemplate['AirExplosion' .. obj.TechLevel .. obj.factionCategory]
    local SDFallDownTrail = SDEffectTemplate['FallDownTrail' .. obj.TechLevel .. obj.factionCategory]

    local NExplosion = NEffectTemplate['AirExplosion'.. obj.TechLevel .. obj.factionCategory]
    local NFallDownTrail = NEffectTemplate['FallDownTrail' .. obj.TechLevel .. obj.factionCategory]

    local NumberForShake = (GetRandomFloat(obj.TechLevelMultiplier, obj.TechLevelMultiplier + 1))/4.5
    obj:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)

    if toggle == 1 then
        obj.CreateEffects(obj, SDExplosion, obj.Army, (obj.TechLevelMultiplier/1.95*GlobalExplosionScaleValue)) -- Custom explosion when unit is in the air
        obj.CreateEffects(obj, SDFallDownTrail, obj.Army, (obj.TechLevelMultiplier*GlobalExplosionScaleValue/1.85)) -- Custom falling-down trail
    else
        obj.CreateEffects(obj, NExplosion, obj.Army, (obj.TechLevelMultiplier/1.95*GlobalExplosionScaleValue)) -- Default explosion when unit is in the air
        obj.CreateEffects(obj, NFallDownTrail, obj.Army, (obj.TechLevelMultiplier*GlobalExplosionScaleValue)) -- No falling-down trail
    end

    if obj.TechLevel == 'TECH1' then
        CreateFlash(obj, -1, (obj.TechLevelMultiplier)/2.5/2.5*2, obj.Army)
    elseif obj.TechLevel == 'TECH2' then
        CreateFlash(obj, -1, (obj.TechLevelMultiplier)/2.15/2*2, obj.Army)
    else
        CreateFlash(obj, -1, (obj.TechLevelMultiplier)/2.75/1.85*2, obj.Army)
    end

    --obj.ForkThread(AddFalldownTrail) For some reason, when this was added, the unit exploded twice upon impact with ground.
end

function ExplosionAirImpact(obj)
    local SDExplosionImpact = SDEffectTemplate['Explosion'.. obj.TechLevel ..obj.factionCategory]  
    local NExplosionImpact = NEffectTemplate['Explosion'.. obj.TechLevel ..obj.factionCategory]
    local NumberForShake = (GetRandomFloat(obj.TechLevelMultiplier, obj.TechLevelMultiplier + 1))/3.5

    obj:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
    obj:PlayUnitSound('Destroyed')

    if toggle == 1 then
        obj.CreateEffects(obj, SDExplosionImpact, obj.Army, (obj.TechLevelMultiplier / 1.95 * GlobalExplosionScaleValue)) --Custom explosion when unit is in the air         
    else
        obj.CreateEffects(obj, NExplosionImpact, obj.Army, 1) --Default explosion when unit is in the air
    end
            
    if obj.TechLevel == 'TECH1' then
        CreateFlash(obj, -1, (obj.TechLevelMultiplier)/2.5/2.5*2, obj.Army)
    elseif obj.TechLevel == 'TECH2' then
        CreateFlash(obj, -1, (obj.TechLevelMultiplier)/2.15/2*2, obj.Army)
    else
        CreateFlash(obj, -1, (obj.TechLevelMultiplier)/2.75/1.85*2, obj.Army)
    end
    
    local scale = (DefaultExplosionsStock.GetAverageBoundingXYZRadius(obj)) / 0.3333
    if obj.TechLevel == 'TECH1' then
        DefaultExplosionsStock.CreateScorchMarkDecalRKS(obj, 0.875, obj.Army)
    elseif obj.TechLevel == 'TECH2' then
        DefaultExplosionsStock.CreateScorchMarkDecalRKS(obj, 1.3, obj.Army)
    elseif obj.TechLevel == 'TECH3' then 
        DefaultExplosionsStock.CreateScorchMarkDecalRKS(obj, 1.6, obj.Army)
    else 
        DefaultExplosionsStock.CreateScorchMarkDecalRKS(obj, 5, obj.Army)
    end
end

function AirImpactWater(obj)
    local SDExplosionImpact = SDEffectTemplate['Explosion'.. obj.TechLevel ..obj.factionCategory]  
    local NExplosionImpact = NEffectTemplate['Explosion'.. obj.TechLevel ..obj.factionCategory]
    local NumberForShake = (GetRandomFloat(obj.TechLevelMultiplier, obj.TechLevelMultiplier + 1))/3.5
    
    EfctUtil.CreateEffects(obj, obj.Army, EffectTemplate.Splashy)
    CreateFlash(obj, -1, (obj.TechLevelMultiplier)/3, obj.Army)
    if (toggle == 1) then 
        obj.CreateEffects(obj, SDEffectTemplate.OilSlick, obj.Army, 0.3*obj.TechLevelMultiplier*(GetRandomInt(0.7, 1.5)))
    else 
        obj.CreateEffects(obj, NEffectTemplate.OilSlick, obj.Army, 0.3*obj.TechLevelMultiplier*(GetRandomInt(0.7, 1.5)))
    end
end

function ExplosionLand(obj)
    local scale = (DefaultExplosionsStock.GetAverageBoundingXYZRadius(obj)) / 0.333
    local ScaleForScorch = (scale - 0.2)*1.5  
    local SDExplosion = SDEffectTemplate['Explosion'.. obj.TechLevel ..obj.factionCategory]
    local NExplosion = NEffectTemplate['Explosion'.. obj.TechLevel ..obj.factionCategory]
    local NumberForShake = (GetRandomFloat(obj.TechLevelMultiplier, obj.TechLevelMultiplier + 1))/2.5
	
    obj:PlayUnitSound('Destroyed')
    obj:PlayUnitSound('Killed')

    if obj.layerCategory == 'NAVAL' then
        obj.CreateEffects(obj, SDEffectTemplate.AddNothing, obj.Army, 0)
    else
        if (toggle == 1) then
            obj.CreateEffects(obj, SDExplosion, obj.Army, obj.TechLevelMultiplier)
        else
            obj.CreateEffects(obj, SDEffectTemplate.AddNothing, obj.Army, obj.TechLevelMultiplier)
        end
    end

    CreateFlash(obj, -1, obj.TechLevelMultiplier/1.65/1.3, obj.Army) 

    if toggle == 1 then
        obj:ShakeCamera(30 * NumberForShake, NumberForShake, 0, NumberForShake / 1.375)
    else
        obj:ShakeCamera(0, 0, 0, 0) --Stock explosions handle shaking in CreateScalableUnitExplosion
    end

    DefaultExplosionsStock.CreateScorchMarkDecalRKS(obj, ScaleForScorch , obj.Army)
end

---------
-- Debris
---------
function CreateGenericFactionalDebrisOnBone(obj, maxNumOfDebris, speed, boneName)

    local numDebris = (GetRandomInt(maxNumOfDebris/2, maxNumOfDebris))
    
    local bonePos = obj:GetPosition(boneName)
    local unitPos = obj:GetPosition(0)

    for i = 0, (numDebris - 1) do
        
        local xposB, yposB, zposB = unpack(bonePos) 
        local xposU, yposU, zposU = unpack(unitPos)
        
        local xpos = GetRandomFloat( (xposB - xposU) * 0.9 , (xposB - xposU) * 1.1 )
        local ypos = (yposB - yposU) + 0.25
        local zpos = GetRandomFloat( (zposB - zposU) * 0.9 , (zposB - zposU) * 1.1 )
        
        local xdir = GetRandomFloat(-speed, speed) 
        local ydir = GetRandomFloat(speed / 2, speed * 1.5)
        local ydirNomadsLightDebris = GetRandomFloat (-speed, speed)
        local zdir = GetRandomFloat(-speed, speed) 
        
        local velocity = GetRandomFloat(speed / 1.5, speed) /1.5
        local velocityUL = GetRandomFloat(speed / 1.2, speed) /1.5 -- Less velocity variance for ultralight debris
        
        local debrisTypeRandomizer = GetRandomInt(0, 16)

        if debrisTypeRandomizer >= 3 and debrisTypeRandomizer < 11 then         -- Light debris that fizzle out
            if obj.factionCategory == 'UEF' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEF/DebrisFlamingUEF_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'CYBRAN' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybran/DebrisFlamingCybran_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'AEON' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeon/DebrisFlamingAeon_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'SERAPHIM' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphim/DebrisFlamingSeraphim_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity*1.5)
            elseif obj.factionCategory == 'NOMADS' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomads/DebrisFlamingNomads_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.25)
            end
        elseif debrisTypeRandomizer >= 12 then                                  -- Ultralight debris that fizzle out very fast
            if obj.factionCategory == 'UEF' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEFLight/DebrisFlamingUEFLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'CYBRAN' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybranLight/DebrisFlamingCybranLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'AEON' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeonLight/DebrisFlamingAeonLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'SERAPHIM' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphimLight/DebrisFlamingSeraphimLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'NOMADS' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomadsLight/DebrisFlamingNomadsLight_proj.bp',xpos,ypos,zpos,xdir,ydirNomadsLightDebris,zdir):SetVelocity(velocityUL*2.7)
            end
        else                                                                    -- Heavy debris that fizzle out slower/don't fizzle (depending on faction
            if obj.factionCategory == 'UEF' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEFHeavy/DebrisFlamingUEFHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir*1.1,zdir):SetVelocity(velocity/1.4)
            elseif obj.factionCategory == 'CYBRAN' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybranHeavy/DebrisFlamingCybranHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.4)
            elseif obj.factionCategory == 'AEON' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeonHeavy/DebrisFlamingAeonHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.4)
            elseif obj.factionCategory == 'SERAPHIM' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphimHeavy/DebrisFlamingSeraphimHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.4)
            elseif obj.factionCategory == 'NOMADS' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomadsHeavy/DebrisFlamingNomadsHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.8)
            end
        end
    end
end

function CreateGenericFactionalDebrisOnBoneWithOffset(obj, maxNumOfDebris, speed, boneName, offsetX, offsetY, offsetZ)

    local numDebris = (GetRandomInt(maxNumOfDebris/2, maxNumOfDebris))
    
    local bonePos = obj:GetPosition(boneName)
    local unitPos = obj:GetPosition(0)

    for i = 0, (numDebris - 1) do
        
        local xposB, yposB, zposB = unpack(bonePos) 
        local xposU, yposU, zposU = unpack(unitPos)
        
        local xpos = (xposB - xposU) + offsetX
        local ypos = (yposB - yposU) + offsetY
        local zpos = (zposB - zposU) + offsetZ
        
        local xdir = GetRandomFloat(-speed, speed) 
        local ydir = GetRandomFloat(speed / 2, speed * 1.5)
        local ydirNomadsLightDebris = GetRandomFloat (-speed, speed)
        local zdir = GetRandomFloat(-speed, speed) 
        
        local velocity = GetRandomFloat(speed / 1.5, speed) /1.5
        local velocityUL = GetRandomFloat(speed / 1.2, speed) /1.5 -- Less velocity variance for ultralight debris
        
        local debrisTypeRandomizer = GetRandomInt(0, 16)

        if debrisTypeRandomizer >= 3 and debrisTypeRandomizer < 11 then         -- Light debris that fizzle out
            if obj.factionCategory == 'UEF' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEF/DebrisFlamingUEF_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'CYBRAN' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybran/DebrisFlamingCybran_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'AEON' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeon/DebrisFlamingAeon_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'SERAPHIM' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphim/DebrisFlamingSeraphim_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity*1.5)
            elseif obj.factionCategory == 'NOMADS' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomads/DebrisFlamingNomads_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.25)
            end
        elseif debrisTypeRandomizer >= 12 then                                  -- Ultralight debris that fizzle out very fast
            if obj.factionCategory == 'UEF' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEFLight/DebrisFlamingUEFLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'CYBRAN' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybranLight/DebrisFlamingCybranLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'AEON' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeonLight/DebrisFlamingAeonLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'SERAPHIM' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphimLight/DebrisFlamingSeraphimLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'NOMADS' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomadsLight/DebrisFlamingNomadsLight_proj.bp',xpos,ypos,zpos,xdir,ydirNomadsLightDebris,zdir):SetVelocity(velocityUL*2.7)
            end
        else                                                                    -- Heavy debris that fizzle out slower/don't fizzle (depending on faction
            if obj.factionCategory == 'UEF' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEFHeavy/DebrisFlamingUEFHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir*1.1,zdir):SetVelocity(velocity/1.4)
            elseif obj.factionCategory == 'CYBRAN' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybranHeavy/DebrisFlamingCybranHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.4)
            elseif obj.factionCategory == 'AEON' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeonHeavy/DebrisFlamingAeonHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.4)
            elseif obj.factionCategory == 'SERAPHIM' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphimHeavy/DebrisFlamingSeraphimHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.4)
            elseif obj.factionCategory == 'NOMADS' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomadsHeavy/DebrisFlamingNomadsHeavy_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.8)
            end
        end
    end
end

function CreateGenericFactionalDebrisOnBoneWithOffsetBuilding(obj, maxNumOfDebris, speed, boneName, offsetX, offsetY, offsetZ)

    local numDebris = (GetRandomInt(maxNumOfDebris/2, maxNumOfDebris))
    
    local bonePos = obj:GetPosition(boneName)
    local unitPos = obj:GetPosition(0)

    for i = 0, (numDebris - 1) do
        
        local xposB, yposB, zposB = unpack(bonePos) 
        local xposU, yposU, zposU = unpack(unitPos)
        
        local xpos = (xposB - xposU) + offsetX
        local ypos = (yposB - yposU) + offsetY
        local zpos = (zposB - zposU) + offsetZ
        
        local xdir = GetRandomFloat(-speed, speed) 
        local ydir = GetRandomFloat(speed / 2, speed * 1.5)
        local ydirNomadsLightDebris = GetRandomFloat (-speed, speed)
        local zdir = GetRandomFloat(-speed, speed) 
        
        local velocity = GetRandomFloat(speed / 1.5, speed) /1.5
        local velocityUL = GetRandomFloat(speed / 1.2, speed) /1.5 -- Less velocity variance for ultralight debris
        
        local debrisTypeRandomizer = GetRandomInt(0, 10)

        if debrisTypeRandomizer > 5 then         -- Light debris that fizzle out
            if obj.factionCategory == 'UEF' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEF/DebrisFlamingUEF_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'CYBRAN' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybranLight/DebrisFlamingCybranLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'AEON' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeon/DebrisFlamingAeon_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity)
            elseif obj.factionCategory == 'SERAPHIM' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphim/DebrisFlamingSeraphim_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity*1.5)
            elseif obj.factionCategory == 'NOMADS' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomads/DebrisFlamingNomads_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocity/1.25)
            end
        else                                    -- Ultralight debris that fizzle out very fast
            if obj.factionCategory == 'UEF' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEFLight/DebrisFlamingUEFLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'CYBRAN' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybranLight/DebrisFlamingCybranLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'AEON' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeonLight/DebrisFlamingAeonLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'SERAPHIM' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphimLight/DebrisFlamingSeraphimLight_proj.bp',xpos,ypos,zpos,xdir,ydir,zdir):SetVelocity(velocityUL*1.3)
            elseif obj.factionCategory == 'NOMADS' then
                obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomadsLight/DebrisFlamingNomadsLight_proj.bp',xpos,ypos,zpos,xdir,ydirNomadsLightDebris,zdir):SetVelocity(velocityUL*2.7)
            end
        end
    end
end

function CreateShipFlamingDebrisProjectiles(obj, volume, dimensions)
    local partamounts = (math.min(GetRandomInt(1 + (volume * 50), (volume * 100)) ,250)) / 10
    local sx, sy, sz = unpack(dimensions)
    local vector = obj.Spec.OverKillRatio.debris_Vector

    for i = 1, partamounts do
        local xpos, xpos, zpos = GetRandomOffset(sx, sy, sz, 1)
        local xdir,ydir,zdir = GetRandomOffset(sx, sy, sz, 3)
        if vector then
            xdir = (vector[1] * 5) + 0 -- + GetRandomOffset2(sx, sy, sz, 3)
            ydir = math.abs((vector[2] * 5)) + 0 -- + GetRandomOffset(sx, sy, sz, 3)
            zdir = (vector[3] * 5) + 0 -- + GetRandomOffset2(sx, sy, sz, 1)
        end

        local rand = 4
        if volume < 0.2 then
            rand = 9
        elseif volume > 2 then
            rand = 10
        end

        if obj.factionCategory == 'UEF' then
            obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingUEF/DebrisFlamingUEF_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        elseif obj.factionCategory == 'CYBRAN' then
            obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingCybran/DebrisFlamingCybran_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        elseif obj.factionCategory == 'AEON' then
            obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingAeon/DebrisFlamingAeon_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        elseif obj.factionCategory == 'SERAPHIM' then
            obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingSeraphim/DebrisFlamingSeraphim_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        elseif obj.factionCategory == 'NOMADS' then
            obj:CreateProjectile('/mods/rks_explosions/effects/entities/DebrisFlamingNomads/DebrisFlamingNomads_proj.bp',xpos,xpos,zpos,xdir,ydir,zdir)
        end
    end
end

function CreateInheritedVelocityDebrisProjectiles(obj, numOfDebris, speed, preVelocity, spreadMul, spread, debris)
    local vx, vy, vz = unpack(speed)
    -- Create several other projectiles in a dispersal pattern
    local angle = (2*math.pi) / numOfDebris
    local angleInitial = GetRandomFloat(0, angle)
    
    -- Randomization of the spread
    local angleVariation = angle * spread -- Adjusts angle variance spread       
    
    local xVec = 0 
    local yVec = 0
    local zVec = 0

    -- Launch projectiles at semi-random angles away from split location
    for i = 0, (numOfDebris -1) do
        local velocity = GetRandomFloat(preVelocity / 2, preVelocity * 2)
        xVec = vx + (GetRandomInt(0.6, 1.3) * ((math.sin(angleInitial + (i * angle) + GetRandomFloat(-angleVariation, angleVariation))) * spreadMul)) + GetRandomFloat(-0.3, 0.3)
        zVec = vz + (GetRandomInt(0.6, 1.3) * ((math.cos(angleInitial + (i * angle) + GetRandomFloat(-angleVariation, angleVariation))) * spreadMul)) + GetRandomFloat(-0.3, 0.3)
        yVec = vy + (GetRandomInt(0.6, 1.3) * ((math.cos(angleInitial + (i * angle) + GetRandomFloat(-angleVariation, angleVariation))) * spreadMul)) + GetRandomFloat(-0.3, 0.3) + GetRandomFloat(0, 0.5) --Eject upward a bit more
        obj:CreateProjectile(debris):SetVelocity(xVec,yVec,zVec):SetVelocity(velocity)        
    end
end

function CreateUpwardsVelocityDebrisProjectiles(obj, numOfDebris, speed, preVelocity, spreadMul, spread, debris)
    local vx, vy, vz = unpack(speed)

    -- Create several other projectiles in a dispersal pattern
    local angle = (2 * math.pi) / numOfDebris
    local angleInitial = GetRandomFloat(0, angle)

    -- Randomization of the spread
    local angleVariation = angle * spread -- Adjusts angle variance spread       

    local xVec = 0 
    local yVec = 0
    local zVec = 0

    -- Launch projectiles at semi-random angles away from split location
    for i = 0, (numOfDebris -1) do
        local velocity = GetRandomFloat(preVelocity / 2, preVelocity * 2)
        xVec = vx + (GetRandomInt(0.6, 1.3) * ((math.sin(angleInitial + (i * angle) + GetRandomFloat(-angleVariation, angleVariation))) * spreadMul)) + GetRandomFloat(-0.3, 0.3) + GetRandomFloat(-2.0, 2.5) --Eject upward a bit more
        zVec = vz + (GetRandomInt(0.6, 1.3) * ((math.cos(angleInitial + (i * angle) + GetRandomFloat(-angleVariation, angleVariation))) * spreadMul)) + GetRandomFloat(-0.3, 0.3) + GetRandomFloat(-2.0, 2.5) --Eject upward a bit more
        yVec = vy + (GetRandomInt(0.6, 1.3) * ((math.cos(angleInitial + (i * angle) + GetRandomFloat(-angleVariation, angleVariation))) * spreadMul)) + GetRandomFloat(-0.3, 0.3) + GetRandomFloat(-2.0, 2.5) --Eject upward a bit more
        obj:CreateProjectile(debris):SetVelocity(xVec,yVec,zVec):SetVelocity(velocity)        
    end
end

-----------------------------------
--OnBone Underwater Flash Explosion 
-----------------------------------
function CreateGenericFlashExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).AddNothing)
end


-------------------------
--OnBone Varied Explosion 
-------------------------
function CreateFactionalExplosionAtBone(obj, boneName, scale, EXPLOSION)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, EXPLOSION)
end

-----------------------------------------------------
-- OnBone UEF Explosions (Very Large/Large/Med/Small)
-----------------------------------------------------
function CreateUEFSmallHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionSmallSD)
end

function CreateUEFMediumHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionMediumSD)
end

function CreateUEFLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionLargeShortDurSmoke)
    -- CreateBoneEffects(obj, boneName, obj.Army, EffectTemplate.ExplosionEffectsLrg02)
end

function CreateUEFLargeShortDurSmokeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionLargeShortDurSmoke)
    -- CreateBoneEffects(obj, boneName, obj.Army, EffectTemplate.ExplosionEffectsLrg02)
end

function CreateUEFVeryLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionVeryLarge)
    -- CreateBoneEffects(obj, boneName, obj.Army, EffectTemplate.ExplosionEffectsLrg02)
end

function CreateUEFVeryLargeShortDurSmokeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionVeryLargeShortDurSmoke)
    -- CreateBoneEffects(obj, boneName, obj.Army, EffectTemplate.ExplosionEffectsLrg02)
end

--------------------------------------------------------
-- OnBone Cybran Explosions (Very Large/Large/Med/Small)
--------------------------------------------------------
function CreateCybranSmallHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.2, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPSmallCybran) -- :ScaleEmitter(1)
end

function CreateCybranMediumHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.3, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPMediumCybran) -- :ScaleEmitter(2.5)
end

function CreateCybranLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.35, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPLargeCybran) -- :ScaleEmitter(5)
end

function CreateCybranVeryLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPMediumCybran) -- :ScaleEmitter(10)
end

function CreateCybranFinalLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPFinalLargeCybran) -- :ScaleEmitter(10)
end

------------------------------------------------------
-- OnBone Aeon Explosions (Very Large/Large/Med/Small)
------------------------------------------------------
function CreateAeonSmallHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPSmallAeon) -- :ScaleEmitter(1)
end

function CreateAeonMediumHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPMediumAeon) -- :ScaleEmitter(2.5)
end

function CreateAeonLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPLargeAeon) -- :ScaleEmitter(5)
end
function CreateAeonLargeInitialHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPLargeInitialAeon) -- :ScaleEmitter(5)
end

function CreateAeonVeryLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPLargeAeon) -- :ScaleEmitter(10)
end

function CreateGCFinalLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPGCFinalAeon) -- :ScaleEmitter(10)
end

function CreateAeonFinalLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPVeryLargeAeon) -- :ScaleEmitter(10)
end

------------------------------------------------------
-- OnBone Sera Explosions (Very Large/Large/Med/Small)
------------------------------------------------------
function CreateSeraSmallHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPMediumSera) -- :ScaleEmitter(1)
end

function CreateSeraMediumHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPMediumSera) -- :ScaleEmitter(2.5)
end

function CreateSeraLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPLargeSera) -- :ScaleEmitter(5)
end

function CreateSeraVeryLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPLargeSera) -- :ScaleEmitter(10)
end

function CreateSeraFinalLargeHitExplosionAtBone(obj, boneName, scale)
    CreateFlash(obj, boneName, scale * 0.5, obj.Army)
    CreateBoneEffects(obj, boneName, obj.Army, GetEffectTemplateFile(toggle).ExplosionEXPLargeSera) -- :ScaleEmitter(10)
end
