------------------------------------------------------------------------------
--Nuke Script 1
------------------------------------------------------------------------------
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

local oldAIFQuantumWarhead01 = AIFQuantumWarhead01
AIFQuantumWarhead01 = Class(oldAIFQuantumWarhead01) { 

	-- Added RK's Explosions effects are below, change as necessary. Also added "Nuke intercepted" effect, table: FxOnKilled
	FxImpactAirUnit = SDEffectTemplate.AeonNuke,
    FxImpactLand = SDEffectTemplate.AeonNuke,
    FxImpactNone = SDEffectTemplate.AeonNuke,
    FxImpactProp = SDEffectTemplate.AeonNuke,
    FxImpactShield = SDEffectTemplate.AeonNuke,
    FxImpactWater = SDEffectTemplate.AeonNukeWater,
    FxImpactUnderWater = SDEffectTemplate.AeonNukeWater,
    FxImpactUnit = SDEffectTemplate.AeonNuke,
    FxImpactProjectile = SDEffectTemplate.AeonNuke,
    FxImpactProjectileUnderWater = SDEffectTemplate.AeonNuke,
    FxOnKilled = SDEffectTemplate.AeonNukeKilled,
	-- Added RK's Explosions effects are above, change as necessary. Also added "Nuke intercepted" effect, table: FxOnKilled
}

TypeClass = AIFQuantumWarhead01