local BaseGenericDebris = import('/lua/sim/DefaultProjectiles.lua').BaseGenericDebris
local EffectTemplates = import('/lua/EffectTemplates.lua')
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

UEFFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.UEFFlamingDebrisLandImpact,
    FxTrails = SDEffectTemplate.UEFFlamingDebrisTrail,
	FxImpactWater = SDEffectTemplate.DebrisSplashyWater,
	FxImpactUnderWater = SDEffectTemplate.DebrisSplashyWater,
}

CybranFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.CybranFlamingDebrisLandImpact,
    FxTrails = SDEffectTemplate.CybranFlamingDebrisTrail,
	FxImpactWater = SDEffectTemplate.DebrisSplashyWater,
	FxImpactUnderWater = SDEffectTemplate.DebrisSplashyWater,
}

AeonFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.AeonFlamingDebrisLandImpact,
    FxTrails = SDEffectTemplate.AeonFlamingDebrisTrail,
	FxImpactWater = SDEffectTemplate.DebrisSplashyWater,
	FxImpactUnderWater = SDEffectTemplate.DebrisSplashyWater,
}

SeraFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.SeraFlamingDebrisLandImpact,
    FxTrails = SDEffectTemplate.SeraFlamingDebrisTrail,
	FxImpactWater = SDEffectTemplate.DebrisSplashyWater,
	FxImpactUnderWater = SDEffectTemplate.DebrisSplashyWater,
}

AhwassaFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = SDEffectTemplate.AirExplosionTECH1seraphim,
    FxTrails = SDEffectTemplate.AhwassaFlamingDebrisTrail,
	FxImpactWater = SDEffectTemplate.DebrisSplashyWater,
	FxImpactUnderWater = SDEffectTemplate.DebrisSplashyWater,
}
