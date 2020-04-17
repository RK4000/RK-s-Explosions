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

-- Ship and Building debris

-- LIGHT DEBRIS

UEFFlamingLightDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).UEFFlamingLightDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).UEFFlamingLightDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

CybranFlamingLightDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).CybranFlamingLightDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).CybranFlamingLightDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

AeonFlamingLightDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AeonFlamingLightDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).AeonFlamingLightDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

SeraFlamingLightDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).SeraFlamingLightDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).SeraFlamingLightDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
    FxImpactNone = GetEffectTemplateFile(toggle).SeraFlamingLightDebrisLandImpact,
}

NomadsFlamingLightDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).NOMADSFlamingLightDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).NOMADSFlamingLightDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

-- MEDIUM DEBRIS

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
    FxImpactNone = GetEffectTemplateFile(toggle).SeraFlamingLightDebrisLandImpact,
}

NomadsFlamingDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).NOMADSFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).NOMADSFlamingDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

-- HEAVY DEBRIS

UEFFlamingHeavyDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).UEFFlamingHeavyDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).UEFFlamingHeavyDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

CybranFlamingHeavyDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).CybranFlamingHeavyDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).CybranFlamingHeavyDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

AeonFlamingHeavyDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AeonFlamingHeavyDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).AeonFlamingHeavyDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

SeraFlamingHeavyDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).SeraFlamingHeavyDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).SeraFlamingHeavyDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
    FxImpactNone = GetEffectTemplateFile(toggle).SeraFlamingLightDebrisLandImpact,
}

NomadsFlamingHeavyDebris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).NOMADSFlamingHeavyDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).NOMADSFlamingHeavyDebrisTrail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

-- Plane debris


--T1


PlaneDebrisUEFTECH1 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).UEFFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH1UEF,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisCYBRANTECH1 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).CybranFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH1CYBRAN,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisAEONTECH1 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AeonFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH1AEON,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisSERAPHIMTECH1 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).SeraFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH1SERAPHIM,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisNOMADSTECH1 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).NOMADSFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH1NOMADS,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

--T2


PlaneDebrisUEFTECH2 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).UEFFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH2UEF,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisCYBRANTECH2 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).CybranFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH2CYBRAN,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisAEONTECH2 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AeonFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH2AEON,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisSERAPHIMTECH2 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).SeraFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH2SERAPHIM,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisNOMADSTECH2 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).NOMADSFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH2NOMADS,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

--T3


PlaneDebrisUEFTECH3 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).UEFFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH3UEF,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisCYBRANTECH3 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).CybranFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH3CYBRAN,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisAEONTECH3 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).AeonFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH3AEON,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisSERAPHIMTECH3 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).SeraFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH3SERAPHIM,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

PlaneDebrisNOMADSTECH3 = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).NOMADSFlamingDebrisLandImpact,
    FxTrails = GetEffectTemplateFile(toggle).PlaneDebrisTECH3NOMADS,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}

-- Exp debris

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

-- Misc/Easter Egg debris

Heart_Debris = Class( FactionalDebris ){
    FxImpactLand = GetEffectTemplateFile(toggle).Heart_Debris_Boom,
    FxTrails = GetEffectTemplateFile(toggle).Heart_Debris_Trail,
	FxImpactWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
	FxImpactUnderWater = GetEffectTemplateFile(toggle).DebrisSplashyWater,
}