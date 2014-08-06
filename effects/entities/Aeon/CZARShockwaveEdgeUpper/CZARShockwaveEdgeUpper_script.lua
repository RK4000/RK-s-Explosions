#
# script for projectile BoneAttached
#
local EmitterProjectile = import('/lua/sim/defaultprojectiles.lua').EmitterProjectile
local SDEffectsTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

CZARShockwaveEdgeUpper = Class(EmitterProjectile) {
    FxTrails = SDEffectsTemplate.CZARShockwaveEdgeUpper,
	FxImpact = SDEffectsTemplate.CZARShockwaveHit,
	FxImpactLand = SDEffectsTemplate.CZARShockwaveHit,
	FxImpactProp = SDEffectsTemplate.CZARShockwaveHit,
	FxImpactUnit = SDEffectsTemplate.CZARShockwaveHit,
}

TypeClass = CZARShockwaveEdgeUpper