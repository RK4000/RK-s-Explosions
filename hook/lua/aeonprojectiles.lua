local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local SinglePolyTrailProjectile = DefaultProjectileFile.SinglePolyTrailProjectile
local MultiCompositeEmitterProjectile = DefaultProjectileFile.MultiCompositeEmitterProjectile

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

-- Nuke explosion
--AQuantumWarheadProjectile = Class(MultiCompositeEmitterProjectile) {
--
--    Beams = {'/effects/emitters/aeon_nuke_exhaust_beam_01_emit.bp',},
--    PolyTrails = {'/effects/emitters/aeon_nuke_trail_emit.bp',},
--
--    -- Added RK's Explosions effects are below, change as necessary. Also added "Nuke intercepted" effect, table: FxOnKilled
--    FxImpactAirUnit = SDEffectTemplate.AeonNukeBase,
--    FxImpactLand = SDEffectTemplate.AeonNukeBase,
--    FxImpactNone = SDEffectTemplate.AeonNukeBase,
--   FxImpactProp = SDEffectTemplate.AeonNukeBase,
--    FxImpactShield = SDEffectTemplate.AeonNukeBase,
--    FxImpactWater = SDEffectTemplate.AeonNukeBase,
--    FxImpactUnderWater = SDEffectTemplate.AeonNukeBase,
--    FxImpactUnit = SDEffectTemplate.AeonNukeBase,
--    FxImpactProjectile = SDEffectTemplate.AeonNukeBase,
--    FxImpactProjectileUnderWater = SDEffectTemplate.AeonNukeBase,
--    FxOnKilled = SDEffectTemplate.AeonNukeBase,
--}