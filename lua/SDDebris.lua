local BaseGenericDebris = import('/lua/sim/DefaultProjectiles.lua').BaseGenericDebris
local EffectTemplates = import('/lua/EffectTemplates.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

UEFFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.UEFFlamingDebrisLandImpact,
    FxTrails = SDEffectTemplate.UEFFlamingDebrisTrail,
}

CybranFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.CybranFlamingDebrisLandImpact,
    FxTrails = SDEffectTemplate.CybranFlamingDebrisTrail,
}

AeonFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.AeonFlamingDebrisLandImpact,
    FxTrails = SDEffectTemplate.AeonFlamingDebrisTrail,
}

SeraFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.SeraFlamingDebrisLandImpact,
    FxTrails = SDEffectTemplate.SeraFlamingDebrisTrail,
}
