------------------------------------------------------------------------------
--Nuke Script 1
------------------------------------------------------------------------------
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

local oldCIFEMPFluxWarhead01 = CIFEMPFluxWarhead01
CIFEMPFluxWarhead01 = Class(oldCIFEMPFluxWarhead01) { 

    -- Added RK's Explosions effects are below, change as necessary. Also added "Nuke intercepted" effect, table: FxOnKilled
	FxImpactAirUnit = SDEffectTemplate.CybranNuke,
    FxImpactLand = SDEffectTemplate.CybranNuke,
    FxImpactNone = SDEffectTemplate.CybranNuke,
    FxImpactProp = SDEffectTemplate.CybranNuke,
    FxImpactShield = SDEffectTemplate.CybranNuke,
    FxImpactWater = SDEffectTemplate.CybranNukeWater,
    FxImpactUnderWater = SDEffectTemplate.CybranNukeWater,
    FxImpactUnit = SDEffectTemplate.CybranNuke,
    FxImpactProjectile = SDEffectTemplate.CybranNuke,
    FxImpactProjectileUnderWater = SDEffectTemplate.CybranNuke,
    FxOnKilled = SDEffectTemplate.CybranNukeKilled,
	-- Added RK's Explosions effects are above, change as necessary. Also added "Nuke intercepted" effect, table: FxOnKilled
}

TypeClass = CIFEMPFluxWarhead01