local BaseGenericDebris = import('/lua/sim/DefaultProjectiles.lua').BaseGenericDebris
local EffectTemplates = import('/lua/EffectTemplates.lua')

local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function GetEffectTemplateFile(toggle)
	if toggle == 1 then
		return SDEffectTemplate
	else 
		return NEffectTemplate
	end
end

local Projectile = import('/lua/sim/Projectile.lua').Projectile

FDEmitterProjectile = Class(Projectile) {
    FxTrailScale = 1,
    FxTrailOffset = 0,

    OnCreate = function(self)
        Projectile.OnCreate(self)
        for i in self.FxTrails do
            CreateEmitterOnEntity(self, self.Army, self.FxTrails[i]):ScaleEmitter(self.FxTrailScale):OffsetEmitter(0, 0, self.FxTrailOffset)
        end
    end,
}

FactionalDebris = Class(FDEmitterProjectile){
    FxUnitHitScale = 0.25,
    FxImpactWater = false,
    FxWaterHitScale = 0.25,
    FxImpactUnderWater = true,
    FxUnderWaterHitScale = 0.25,
    FxNoneHitScale = 0.25,
    FxImpactLand = true,
    FxLandHitScale = 0.5,
    FxTrails = true,
    FxTrailScale = 1,
}

UEFFlamingDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).UEFFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).UEFFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

CybranFlamingDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).CybranFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).CybranFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

AeonFlamingDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AeonFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).AeonFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

SeraFlamingDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).SeraFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).SeraFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

AhwassaFlamingDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AsswasherDebrisImpact,
    FxTrails = GetEffectTemplateFile(toggle).AhwassaFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}
CZAR_Debris= Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).CZARDebrisImpact,
    FxTrails = GetEffectTemplateFile(toggle).AeonFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
} 
SR_Debris= Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).SRDebrisImpact,
    FxTrails = GetEffectTemplateFile(toggle).CybranFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}
Heart_Debris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).Heart_Debris_Boom,
    FxTrails = GetEffectTemplateFile(toggle).Heart_Debris_Trail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}