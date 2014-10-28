local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local SingleCompositeEmitterProjectile = DefaultProjectileFile.SingleCompositeEmitterProjectile
--The mod file
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

--Modify Cybran T2 Gunship rocket explosion to reduce lag and improve visuals
CIridiumRocketProjectile = Class(SingleCompositeEmitterProjectile) {
    FxTrails = {},
    PolyTrail = '/effects/emitters/cybran_iridium_missile_polytrail_01_emit.bp',    
    BeamName = '/effects/emitters/rocket_iridium_exhaust_beam_01_emit.bp',
    
    FxImpactUnit = SDEffectTemplate.T2RocketBotMissileHit,
    FxImpactProp = SDEffectTemplate.T2RocketBotMissileHit,
    FxImpactLand = SDEffectTemplate.T2RocketBotMissileHitGround,
    FxImpactUnderWater = {},
}