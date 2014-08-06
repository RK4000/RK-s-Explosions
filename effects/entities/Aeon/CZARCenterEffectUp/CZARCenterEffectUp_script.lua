#
# script for projectile BoneAttached
#
local EmitterProjectile = import('/lua/sim/defaultprojectiles.lua').EmitterProjectile
local SDEffectsTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

CZARCenterEffectUp = Class(EmitterProjectile) {
    FxTrails = SDEffectsTemplate.CZARCenterEffectUp,
}

TypeClass = CZARCenterEffectUp