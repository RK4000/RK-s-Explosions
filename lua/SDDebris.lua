local BaseGenericDebris = import('/lua/sim/DefaultProjectiles.lua').BaseGenericDebris
local EffectTemplates = import('/lua/EffectTemplates.lua')

local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')

local toggle = 0

function GetEffectTemplateFile(toggle)
	if toggle == 1 then
		return SDEffectTemplate
	else 
		return NEffectTemplate
	end
end

UEFFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).UEFFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).UEFFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

CybranFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).CybranFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).CybranFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

AeonFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AeonFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).AeonFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

SeraFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).SeraFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).SeraFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

AhwassaFlamingDebris = Class( BaseGenericDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AirExplosionTECH1seraphim,
    FxTrails = GetEffectTemplateFile(toggle).AhwassaFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}
CZAR_Debris= Class( BaseGenericDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AirExplosionTECH1aeon,
    FxTrails = GetEffectTemplateFile(toggle).AeonFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
} 
SR_Debris= Class( BaseGenericDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AirExplosionTECH2cybran,
    FxTrails = GetEffectTemplateFile(toggle).CybranFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}
Heart_Debris = Class( BaseGenericDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).Heart_Debris_Boom,
    FxTrails = GetEffectTemplateFile(toggle).Heart_Debris_Trail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}