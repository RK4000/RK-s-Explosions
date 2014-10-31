local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local SinglePolyTrailProjectile = DefaultProjectileFile.SinglePolyTrailProjectile
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

-- Restorer AA Missile explosion
AZealot02AAMissileProjectile = Class(SinglePolyTrailProjectile) {
    PolyTrail = '/effects/emitters/aeon_missile_trail_03_emit.bp',

    FxImpactUnit = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactAirUnit = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactProp = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactNone = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactLand = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactUnderWater = {},
}