local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local SingleCompositeEmitterProjectile = DefaultProjectileFile.SingleCompositeEmitterProjectile
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

-- Cybran T2 Gunship weapon explosion
CIridiumRocketProjectile = Class(SingleCompositeEmitterProjectile) {
    FxTrails = {},
    PolyTrail = '/effects/emitters/cybran_iridium_missile_polytrail_01_emit.bp',    
    BeamName = '/effects/emitters/rocket_iridium_exhaust_beam_01_emit.bp',
    FxImpactUnit = SDEffectTemplate.T2RocketBotMissileHit,
    FxImpactProp = SDEffectTemplate.T2RocketBotMissileHit,
    FxImpactLand = SDEffectTemplate.T2RocketBotMissileHitGround,
    FxImpactUnderWater = {},
}