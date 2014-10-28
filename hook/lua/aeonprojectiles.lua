local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local SinglePolyTrailProjectile = DefaultProjectileFile.SinglePolyTrailProjectile
-- The mod file
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

-- Modify the explosion for the Restorer's AA missiles
AZealot02AAMissileProjectile = Class(SinglePolyTrailProjectile) {
    PolyTrail = '/effects/emitters/aeon_missile_trail_03_emit.bp',

    FxImpactUnit = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactAirUnit = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactProp = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactNone = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactLand = SDEffectTemplate.AeonRestorerMissileHit01,
    FxImpactUnderWater = {},
}