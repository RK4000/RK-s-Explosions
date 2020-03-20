------------------------------------------------------------------------------
--Nuke Script 4 (nuke sub?)
------------------------------------------------------------------------------
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

local oldCIFEMPFluxWarhead04 = CIFEMPFluxWarhead04
CIFEMPFluxWarhead04 = Class(oldCIFEMPFluxWarhead04) { 

    -- Added RK's Explosions effects are below, change as necessary. Also added "Nuke intercepted" effect, table: FxOnKilled
	--FxImpactAirUnit = SDEffectTemplate.CybranNuke,
    --FxImpactLand = SDEffectTemplate.CybranNuke,
    --FxImpactNone = SDEffectTemplate.CybranNuke,
    --FxImpactProp = SDEffectTemplate.CybranNuke,
    --FxImpactShield = SDEffectTemplate.CybranNuke,
    --FxImpactWater = SDEffectTemplate.CybranNuke,
    --FxImpactUnderWater = SDEffectTemplate.CybranNuke,
    --FxImpactUnit = SDEffectTemplate.CybranNuke,
    --FxImpactProjectile = SDEffectTemplate.CybranNuke,
    --FxImpactProjectileUnderWater = SDEffectTemplate.CybranNuke,
    --FxOnKilled = SDEffectTemplate.CybranNukeKilled,
	-- Added RK's Explosions effects are above, change as necessary. Also added "Nuke intercepted" effect, table: FxOnKilled
}

TypeClass = CIFEMPFluxWarhead04