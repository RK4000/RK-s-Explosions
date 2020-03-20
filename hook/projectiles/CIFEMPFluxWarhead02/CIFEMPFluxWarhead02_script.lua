------------------------------------------------------------------------------
--Nuke Script 2
------------------------------------------------------------------------------
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

local oldCIFEMPFluxWarhead02 = CIFEMPFluxWarhead02
CIFEMPFluxWarhead02 = Class(oldCIFEMPFluxWarhead02) { 

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

TypeClass = CIFEMPFluxWarhead02