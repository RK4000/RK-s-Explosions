#
# script for projectile BoneAttached
#
local EmitterProjectile = import('/lua/sim/defaultprojectiles.lua').EmitterProjectile
local SDEffectsTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

CZARCenterEffectDown = Class(EmitterProjectile) {
    FxTrails = SDEffectsTemplate.CZARCenterEffectDown,
}

TypeClass = CZARCenterEffectDown