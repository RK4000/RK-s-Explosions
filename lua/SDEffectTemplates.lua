--#****************************************************************************
--#**
--#**  File     :  SDEffectTemplates
--#**  Author(s):  RK4000
--#**
--#**  Summary  :  Generic templates for commonly used effects for the explosions mod. (in other words, this is where the magic happens)
--#**
--#**  Copyright © 2014 RK Powered Games, Inc.  All rights reserved.
--#****************************************************************************
TableCat = import('/lua/utilities.lua').TableCat
EmtBpPath = '/mods/rks_explosions/effects/emitters/'
EmtBpPathAlt = '/mods/rks_explosions/effects/emitters/'
EmitterTempEmtBpPath = '/mods/rks_explosions/effects/emitters/temp/'
ModPath = '/mods/rks_explosions/effects/emitters/'

-- WEAPON EXPLOSIONS
T2RocketBotMissileHitGround = {
    --ModPath .. 'dust_emit.bp',
    ModPath .. 'Cyb_Rktbot_smoke.bp',
    ModPath .. 'Cyb_Rktbot_charge.bp',
    ModPath .. 'Cyb_Flash_Rktbot.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

T2RocketBotMissileHit = {
    --ModPath .. 'dust_emit.bp',
    ModPath .. 'Cyb_Rktbot_smoke_Unit.bp',
    ModPath .. 'Cyb_Rktbot_charge.bp',
    ModPath .. 'Cyb_Flash_Rktbot_Unit.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}
AeonRestorerMissileHit01 = {
    ModPath .. 'Aeon_Restorer_Aura.bp',
    ModPath .. 'Aeon_Restorer_Aura2.bp',
    ModPath .. 'Aeon_Restorer_smoke.bp',
}

-- HUGE EXP. EXPLOSIONS
ExplosionSmallSD = {
    ModPath .. 'dust_small_emit.bp',
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Small.bp', 
}

ExplosionMediumSD = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'Medium_test_smoke.bp',
    ModPath .. 'Medium_test_fire.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Medium.bp', 
}

ExplosionLargeShortDurSmoke = {
    --ModPath .. 'Large_ShortDur_test_smoke.bp',
    ModPath .. 'residue_Very_Large_test_smoke.bp',
    ModPath .. 'Large_test_fire.bp',
    ModPath .. 'Large_test_random.bp',
    ModPath .. 'Large_test_sonic.bp',
    ModPath .. 'UEF_Very_Large_test_sonic.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Big.bp', 
}
ExplosionVeryLarge = {
    ModPath .. 'residue_Very_Large_test_smoke.bp',
    ModPath .. 'Very_Large_test_smoke.bp',
    ModPath .. 'Very_Large_test_fire.bp',
    ModPath .. 'Very_Large_test_random.bp',
    ModPath .. 'Very_Large_test_sonic.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Big.bp', 
}
ExplosionVeryLargeShortDurSmoke = {
    ModPath .. 'residue_Very_Large_test_smoke.bp',
    ModPath .. 'Very_ShortDur_Large_test_smoke.bp',
    ModPath .. 'Very_Large_test_fire.bp',
    ModPath .. 'Very_Large_test_random.bp',
    ModPath .. 'Very_Large_test_sonic.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Big.bp', 
} 

LuXy_Heart = {
    ModPath .. 'FluffyHeart.bp',
    ModPath .. 'Fluffy_Heart_Smoke.bp',
}
Heart_Debris_Boom = {
    ModPath .. 'FluffyHeart_Small.bp',
}
Heart_Debris_Trail = {
    ModPath .. 'FluffyHeart_Trail.bp',
}

-- AddNothing Boom
AddNothing = {}



-- MAIN FACTIONAL DEATH FX 
-- LAND BOOMS 

-- T1 UEF Unit Boom
ExplosionTECH1uef = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_random.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    EmtBpPath .. 'SDantimatter_ring_01_emit.bp',
    EmtBpPath .. 'SDantimatter_ring_02_emit.bp',
    ModPath .. 'small_UEF_test_fire.bp',
}

-- T2 UEF Unit Boom
ExplosionTECH2uef = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_random.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    EmtBpPath .. 'SDantimatter_ring_01_emit.bp',
    EmtBpPath .. 'SDantimatter_ring_02_emit.bp',
    --ModPath .. 'UEF_Outward_Spark_Small.bp',
    ModPath .. 'small_UEF_test_fire.bp',
}

-- T3 UEF Unit Boom
ExplosionTECH3uef = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smokeT3.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    EmtBpPath .. 'SDantimatter_ring_03_Land.bp',
    EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'UEF_Outward_Spark.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}

-- T1 Cyb Unit Boom
ExplosionTECH1cybran = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'CybT1_smoke.bp',
    ModPath .. 'CybT1_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}

-- T2 Cyb Unit Boom
ExplosionTECH2cybran = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}

-- T3 Cyb Unit Boom
ExplosionTECH3cybran = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargelong.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_1.bp',
}

-- T1 Aeon Unit Boom
ExplosionTECH1aeon = {
    --ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2.bp',
}

-- T2 Aeon Unit Boom
ExplosionTECH2aeon = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT2_smoke.bp',
    --ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2.bp',
}

-- T3 Aeon Unit Boom
ExplosionTECH3aeon = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- T1 Sera Unit Boom
ExplosionTECH1seraphim = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    --ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}

-- T2 Sera Unit Boom
ExplosionTECH2seraphim = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    --ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}

-- T3 Sera Unit Boom
ExplosionTECH3seraphim = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}



-- LAND BOOMS 
-- AIR BOOMS 

-- T1 UEF Air Unit Boom
AirExplosionTECH1uef = {             
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    --EmtBpPath .. 'SDantimatter_ring_01_air.bp',
}

-- T2 UEF Air Unit Boom
AirExplosionTECH2uef = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit_air.bp', 
    EmtBpPath .. 'SDantimatter_ring_03_Land.bp',
}

-- T3 UEF Air Unit Boom
AirExplosionTECH3uef = {
    --ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit_air.bp', 
    EmtBpPath .. 'SDantimatter_ring_01_air.bp',
    ModPath .. 'UEF_Outward_Spark_Air.bp', 
}

-- T1 Cyb Air Unit Boom
AirExplosionTECH1cybran = {
    ModPath .. 'CybT1_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering_air.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}

-- T2 Cyb Air Unit Boom
AirExplosionTECH2cybran = {
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering_air.bp',
    ModPath .. 'CybT3_chargelong.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_1.bp',
}

-- T3 Cyb Air Unit Boom
AirExplosionTECH3cybran = {
    --ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargelong_air.bp',
    ModPath .. 'CybT3_chargering_air.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2_air.bp',
}

-- T1 Aeon Air Unit Boom
AirExplosionTECH1aeon = {
    --ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT2_smoke.bp',
    --ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2_Air.bp',
}

-- T2 Aeon Air Unit Boom
AirExplosionTECH2aeon = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2_Air.bp',
}

-- T3 Aeon Air Unit Boom
AirExplosionTECH3aeon = {
    ModPath .. 'Aeon_Spark_air.bp',
    --ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3_Air.bp',
}

-- T1 Sera Air Unit Boom
AirExplosionTECH1seraphim = {
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    --ModPath .. 'SeraT3_electricity3.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    --ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'Sera_Afterhue.bp',
}

-- T2 Sera Air Unit Boom
AirExplosionTECH2seraphim = {
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    --ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'Sera_Afterhue.bp',
}

-- T3 Sera Air Unit Boom
AirExplosionTECH3seraphim = {
    --ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    --ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3_T3Air.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2_T3air.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'Sera_Afterhue.bp',
}



-- AIR BOOMS
-- BUILDING BOOMS 

-- T1 UEF Building Unit Boom
BuildingExplosionTECH1uef = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --EmtBpPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}

-- T2 UEF Building Unit Boom
BuildingExplosionTECH2uef = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --EmtBpPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    EmtBpPath .. 'SDantimatter_ring_03_Land.bp',
}

-- T3 UEF Building Unit Boom
BuildingExplosionTECH3uef = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --EmtBpPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'UEF_Outward_Spark_Building.bp',
    EmtBpPath .. 'SDantimatter_ring_03_Land.bp',
    
}

-- T1 Cyb Building Unit Boom
BuildingExplosionTECH1cybran = {
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- T2 Cyb Building Unit Boom
BuildingExplosionTECH2cybran = {
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- T3 Cyb Building Unit Boom
BuildingExplosionTECH3cybran = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargelong.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- T1 Aeon Building Unit Boom
BuildingExplosionTECH1aeon = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT2_Air.bp',
}

-- T2 Aeon Building Unit Boom
BuildingExplosionTECH2aeon = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT2_Air.bp',
}

-- T3 Aeon Building Unit Boom
BuildingExplosionTECH3aeon = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT3_Air.bp',
}

-- T1 Sera Building Unit Boom
BuildingExplosionTECH1seraphim = {
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3_building.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}

-- T2 Sera Building Unit Boom
BuildingExplosionTECH2seraphim = {
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3_building.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}

-- T3 Sera Building Unit Boom
BuildingExplosionTECH3seraphim = {
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3_building.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}



-- BUILDING BOOMS
-- FALLDOWN FX

-- T1 UEF Plane Fall Down
TECH1uefFallDownTrail = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

-- T2 UEF Plane Fall Down
TECH2uefFallDownTrail = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

-- T3 UEF Plane Fall Down
TECH3uefFallDownTrail = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

-- T1 Cybran Plane Fall Down
TECH1cybranFallDownTrail = { 
    ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
    ModPath .. 'Cybran_Fall_Down_Smoke_T1.bp',
}

-- T2 Cybran Plane Fall Down
TECH2cybranFallDownTrail = { 
    ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
    ModPath .. 'Cybran_Fall_Down_Smoke_T1.bp',
}

-- T3 Cybran Plane Fall Down
TECH3cybranFallDownTrail = { 
    --ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
    ModPath .. 'Cybran_Fall_Down_Smoke_T3.bp',
}

-- T1 Aeon Plane Fall Down
TECH1aeonFallDownTrail = { 
    ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue_Dimmed.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T2 Aeon Plane Fall Down
TECH2aeonFallDownTrail = { 
    ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue_Dimmed.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T3 Aeon Plane Fall Down
TECH3aeonFallDownTrail = { 
    ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue_Dimmed.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T1 Sera Plane Fall Down
TECH1seraphimFallDownTrail = { 
    ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
    ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T2 Sera Plane Fall Down
TECH2seraphimFallDownTrail = { 
    ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
    ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T3 Sera Plane Fall Down
TECH3seraphimFallDownTrail = { 
    ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
    ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}



-- FALLDOWN FX 
-- Ship Sub-Booms (Above water)

-- UEF T1 Ship Sub-Boom
uefShipSubExplTECH1 = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}

-- UEF T2 Ship Sub-Boom
uefShipSubExplTECH2 = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    EmtBpPath .. 'SDantimatter_ring_03_Land.bp',
}

-- UEF T3 Ship Sub-Boom
uefShipSubExplTECH3 = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp', 
    EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp', 
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'UEF_Outward_Spark_Building.bp', 
    EmtBpPath .. 'SDantimatter_ring_03_Land.bp',
}

-- Cyb T1 Ship Sub-Boom
cybranShipSubExplTECH1 = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'CybT3_chargelong.bp',
}

-- Cyb T2 Ship Sub-Boom
cybranShipSubExplTECH2 = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'CybT3_chargelong.bp',
     ModPath .. 'Cyb_Flash_2.bp',
}

-- Cyb T3 Ship Sub-Boom
cybranShipSubExplTECH3 = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'CybT3_chargelong.bp',
     ModPath .. 'Cyb_Flash_1.bp',
}

-- Aeon T1 Ship Sub-Boom
aeonShipSubExplTECH1 = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- Aeon T2 Ship Sub-Boom
aeonShipSubExplTECH2 = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- Aeon T3 Ship Sub-Boom
aeonShipSubExplTECH3 = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- Sera T1 Ship Sub-Boom
seraphimShipSubExplTECH1 = {
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3_building.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}

-- Sera T2 Ship Sub-Boom
seraphimShipSubExplTECH2 = {
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3_building.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}

-- Sera T3 Ship Sub-Boom
seraphimShipSubExplTECH3 = {
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3_building.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}



-- Ship Sub-Booms (Above water) 
-- Ship Sub-Booms (Below water)

-- UEF T1 Ship Sub-Boom (Underwater)
uefShipSubExplTECH1Underwater = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}

-- UEF T2 Ship Sub-Boom (Underwater)
uefShipSubExplTECH2Underwater = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}

-- UEF T3 Ship Sub-Boom (Underwater)
uefShipSubExplTECH3Underwater = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}

-- Cyb T1 Ship Sub-Boom (Underwater)
cybranShipSubExplTECH1Underwater = {
    ModPath .. 'CybT3_Underwater_charge.bp',
}

-- Cyb T2 Ship Sub-Boom (Underwater)
cybranShipSubExplTECH2Underwater = {
    ModPath .. 'CybT3_Underwater_charge.bp',
}

-- Cyb T3 Ship Sub-Boom (Underwater)
cybranShipSubExplTECH3Underwater = {
    ModPath .. 'CybT3_Underwater_charge.bp',
}

-- Aeon T1 Ship Sub-Boom (Underwater)
aeonShipSubExplTECH1Underwater = {
    ModPath .. 'AeonSubBoom_aura_underwater.bp',
}

-- Aeon T2 Ship Sub-Boom (Underwater)
aeonShipSubExplTECH2Underwater = {
    ModPath .. 'AeonSubBoom_aura_underwater.bp',
}

-- Aeon T3 Ship Sub-Boom (Underwater)
aeonShipSubExplTECH3Underwater = {
    ModPath .. 'AeonSubBoom_aura_underwater.bp',
}

-- Sera T1 Ship Sub-Boom (Underwater)
seraphimShipSubExplTECH1Underwater = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
    ModPath .. 'Sera_T3_chargering_underwater.bp',
}

-- Sera T2 Ship Sub-Boom (Underwater)
seraphimShipSubExplTECH2Underwater = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
    ModPath .. 'Sera_T3_chargering_underwater.bp',
}

-- Sera T3 Ship Sub-Boom (Underwater)
seraphimShipSubExplTECH3Underwater = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
    ModPath .. 'Sera_T3_chargering_underwater.bp',
}



-- Ship Sub-Booms (Below Water) 
-- Sub Booms (surface)

-- UEF Sub Boom (Surface)
uefSubExplosionAboveWater = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp', 
    EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp', 
    ModPath .. 'small_UEF_test_fire_T3.bp', 
}

-- Cybran Sub Boom (Surface)
cybranSubExplosionAboveWater = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'CybT3_chargelong.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- Aeon Sub Boom (Surface)
aeonSubExplosionAboveWater = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- Sera Sub Boom (Surface)
seraphimSubExplosionAboveWater = {
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'SeraT3_electricity3_building.bp',
    --ModPath .. 'Sera_Flash_1.bp',
    ModPath .. 'Sera_Flash_2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Sera_Afterhue.bp',
}



-- Sub Booms (Surface)
-- Sub Booms (Underwater)

-- UEF Sub Boom (Underwater)
uefSubExplosionUnderWater = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Cybran Sub Boom (Underwater)
cybranSubExplosionUnderWater = {
    ModPath .. 'CybT3_Underwater_charge.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Aeon Sub Boom (Underwater)
aeonSubExplosionUnderWater = {
    ModPath .. 'AeonT3_aura_underwater.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Sera Sub Boom (Underwater)
seraphimSubExplosionUnderWater = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
    ModPath .. 'Sera_T3_chargering_underwater.bp',
}



-- Sub Booms (Underwater)
-- EXP BOOMS (Cyb)

-- Cyb Generic Experimental Small Boom
ExplosionEXPSmallCybran = {
    ModPath .. 'CybT4_long_thin_smoke.bp',
    ModPath .. 'CybEXPSMALL_charge.bp',
    ModPath .. 'CybEXPSMALL_chargelong.bp',
    ModPath .. 'CybEXPSMALL_chargering.bp',
    ModPath .. 'Small_test_sonic.bp',
    ModPath .. 'Cyb_Flash_1.bp',
}

-- Cyb Generic Experimental Medium Boom
ExplosionEXPMediumCybran = {
    ModPath .. 'CybT4_long_thin_smoke.bp',
    ModPath .. 'CybEXPMED_charge.bp',
    ModPath .. 'CybEXPMED_chargelong.bp',
    ModPath .. 'CybEXPMED_chargering.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- Cyb Generic Experimental Large Boom
ExplosionEXPLargeCybran = {
    ModPath .. 'CybT4_long_thin_smoke.bp',
    ModPath .. 'CybEXPLRG_charge.bp',
    ModPath .. 'CybEXPLRG_chargelong.bp',
    ModPath .. 'CybEXPLRG_chargering.bp',
    ModPath .. 'Large_test_sonic.bp',
    ModPath .. 'Cyb_Flash_4.bp',
}

-- Cyb Generic Experimental FinalLarge Boom
ExplosionEXPFinalLargeCybran = {
    ModPath .. 'CybT4_long_thin_smoke.bp',
    ModPath .. 'CybEXPLRG_charge.bp',
    ModPath .. 'CybEXPLRG_chargelong.bp',
    ModPath .. 'CybEXPLRG_chargering.bp',
    ModPath .. 'Cyb_Flash_4.bp',
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT4_long_smoke.bp',
    ModPath .. 'SoulRipper_smoke.bp',
    ModPath .. 'Very_Large_test_sonic.bp',
}
-- Cyb SR Explosion Stuff
SoulRipper_Impact_Explosion = {
    ModPath .. 'CybEXPLRG_charge.bp',
    ModPath .. 'CybEXPLRG_chargelong.bp',
    ModPath .. 'CybEXPLRG_chargering.bp',
    ModPath .. 'Cyb_Flash_4.bp',
    ModPath .. 'SoulRipper_smoke.bp',
    ModPath .. 'Large_test_sonic.bp',
}
SoulRipper_Final_Boom = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybEXPLRG_charge.bp',
    ModPath .. 'CybEXPLRG_chargelong.bp',
    ModPath .. 'CybEXPLRG_chargering.bp',
    ModPath .. 'Cyb_Flash_4_EXP.bp',
    ModPath .. 'SoulRipper_smoke.bp',
    --ModPath .. 'Very_Large_test_sonic.bp',
}
SoulRipper_First_Series_Booms = {
    --ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybEXPMED_charge.bp',
    ModPath .. 'CybEXPMED_chargelong.bp',
    ModPath .. 'CybEXPMED_chargering.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_3.bp',
}
SoulRipper_Second_Series_Booms = {
    --ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}
SoulRipper_Third_Series_Booms = {
    --ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargelong.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_4_EXP.bp',
}
SoulRipper_Fall_Down_Smoke = {
    ModPath .. 'SoulRipper_Fall_Down_Smoke.bp',
}
SoulRipper_Ambient_Electricity = {
    ModPath .. 'SoulRipper_Ambient_Electricity.bp',
}
SoulRipper_Ambient_Electricity_Upper = {
    ModPath .. 'SoulRipper_Ambient_Electricity_Upper.bp',
}



-- EXP BOOMS (Cyb)
-- EXP BOOMS (Aeon)
-- Aeon GC Small Boom
ExplosionEXPSmallAeon = {
    --ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonEXPSML_aura.bp',
    ModPath .. 'Medium_test_sonic.bp',
}
-- Aeon GC Medium Boom
ExplosionEXPMediumAeon = {
    --ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonEXPMED_aura.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT4_Small.bp',
}

-- Aeon GC Large Boom
ExplosionEXPLargeAeon = {
    --ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonEXPLRG_aura_long.bp',
    ModPath .. 'AeonEXPLRG2D_aura_long.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Large_test_sonic.bp',
    ModPath .. 'AuraWaveT4_Med.bp',
}
-- Aeon GC Large Initial Boom
ExplosionEXPLargeInitialAeon = {
    --ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonEXPLRG_aura.bp',
    ModPath .. 'AeonEXPLRG2D_aura.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Large_test_sonic.bp',
    ModPath .. 'AuraWaveT4_Med.bp',
}
-- Aeon Exp Very Large Boom
ExplosionEXPVeryLargeAeon = {
    ModPath .. 'Aeon_Spark_BIG.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonEXPVLRG_aura.bp',
    ModPath .. 'AeonEXPVLRG2D_aura.bp',
    ModPath .. 'Large_test_sonic.bp',
    ModPath .. 'Very_Large_test_sonic.bp',
    ModPath .. 'AuraWaveT4_Big.bp',
    ModPath .. 'Aeon_GC_Death_smoke.bp',
}
-- Aeon GC Final Boom
ExplosionEXPGCFinalAeon = {
    ModPath .. 'Aeon_Spark_BIG_GC.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonEXPVLRG_aura.bp',
    ModPath .. 'AeonEXPVLRG2D_aura.bp',
    ModPath .. 'Large_test_sonic.bp',
    ModPath .. 'Very_Large_test_sonic.bp',
    ModPath .. 'AuraWaveT4_Big.bp',
    ModPath .. 'Aeon_GC_Death_smoke.bp',
}
-- Aeon GC Core Breach
GC_Core_Breach02 = {
    --ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_01.bp',
    --ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_02.bp',
    --ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_03.bp',
    --ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_04.bp',
    ModPath .. 'Aeon_GC_Reactor_Breach_Critical_AuraGlow.bp',
}
-- Aeon GC Smoking Limbs
GC_Body_Part_Damage = {
    ModPath .. 'GC_Fall_Aura_T1.bp',
    ModPath .. 'GC_Fall_Green_Hue.bp',
    ModPath .. 'GC_Fall_Smoke_T1.bp',
}
-- Aeon CZAR Stuff
CZAR_Initial_Center_Explosion = {
    --ModPath .. 'Very_Large_test_sonic.bp',
    ModPath .. 'AuraWaveT4_Big_CZAR.bp',
}
CZARShockwaveEdge = {
    ModPath .. 'Aeon_GlowingShockwaveEdge.bp',
}
CZARShockwaveEdgeUpper = {
    ModPath .. 'Aeon_GlowingShockwaveEdgeUpper.bp',
}
CZARShockwaveHit = {
    ModPath .. 'Aeon_GlowingShockwaveEdgeHit.bp',  
}
CZARCenterEffectUp= {
    ModPath .. 'Aeon_CZARCenterEffectUp.bp', 
}
CZARCenterEffectDown= {
    ModPath .. 'Aeon_CZARCenterEffectDown.bp',
}
CZARCenterImpactExplosion = {
    ModPath .. 'Aeon_Spark_BIG.bp',
    ModPath .. 'Aeon_CZAR_smoke.bp',
    ModPath .. 'Very_Large_test_sonic.bp',
    ModPath .. 'AuraWaveT4_Big_CZAR_Impact.bp',
}
CZAR_Center_FallDown_Smoke = {
    ModPath .. 'Aeon_CZAR_Center_FallDown_Smoke.bp',
}
CZAR_Center_FallDown_Aura = {
    ModPath .. 'Aeon_CZAR_Center_FallDown_Aura.bp',
}
CZAR_Center_Charge = {
    ModPath .. 'Aeon_CZAR_Center_Charge.bp',
}
CZAR_Center_Core_Breach01 = {
    ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_01.bp',
    ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_AuraGlow.bp',
}
CZAR_Center_Core_Breach02 = {
    ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_02.bp',
    ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_03.bp',
    ModPath .. 'Aeon_CZAR_Reactor_Breach_Critical_04.bp',
}
CZAR_Air_Rushing_In = {
    ModPath .. 'Aeon_CZAR_Air_Rushing_In.bp',
}
CZAR_Core_Rupture = {
    ModPath .. 'Aeon_CZAR_Core_Rupture_Aura.bp',
    ModPath .. 'Aeon_CZAR_Core_Rupture_Smoke.bp',
}



-- EXP BOOMS (Aeon)
-- EXP BOOMS (Seraphim)

-- Sera Chicken Medium Boom
ExplosionEXPMediumSera  = {
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT2_electricity2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}

-- Sera Chicken Large Boom
ExplosionEXPLargeSera  = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'Large_test_random.bp',
    ModPath .. 'Large_test_sonic.bp',
}

-- Sera Asswasher Stuff
Ahwassa_Engine_PreFail_Electricity = {
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'SeraT3_electricity.bp',
    ModPath .. 'SeraT3_electricity3_T3Air.bp',
    ModPath .. 'Sera_Flash_2_T3air.bp',
    ModPath .. 'Medium_test_sonic.bp',
}
Ahwassa_Engine_PreFail_Smoke = {
    ModPath .. 'Ahwassa_PreFail_Smoke.bp',
    ModPath .. 'Ahwassa_PreFail_Smoke_Electrified.bp',
}
Ahwassa_Engine_Critical_Explosion_Flashes = {
    ModPath .. 'Ahwassa_Critical_Damage_Explosion_Electricity.bp',
    ModPath .. 'Ahwassa_Critical_Damage_Explosion_Flashes.bp',
}
Ahwassa_Engine_Critical_Explosion_Sparks = {
    ModPath .. 'Ahwassa_Critical_Damage_Explosion_Sparks.bp',
}
Ahwassa_Engine_Critical_Smoke = {
    ModPath .. 'Ahwassa_Critical_Damage_Smoke_Electrified.bp',
    ModPath .. 'Ahwassa_Critical_Damage_Smoke_Electrified_2.bp',
    ModPath .. 'Ahwassa_Fall_Down_Electricity.bp',
    ModPath .. 'Ahwassa_Critical_Damage_Smoke.bp',
}
Ahwassa_Engine_Critical_Breach = {
    ModPath .. 'Ahwassa_Critical_Damage_Breach_01.bp',
    ModPath .. 'Ahwassa_Critical_Damage_Breach_02.bp',
    ModPath .. 'Ahwassa_Critical_Damage_Breach_03.bp',
}
Ahwassa_Engine_Critical_Breach_Electricity = {
    ModPath .. 'Ahwassa_Critical_Damage_Breach_Electricity.bp',
}
Ahwassa_Impact_Explosion = {
    ModPath .. 'Aeon_CZAR_smoke.bp',
    ModPath .. 'Very_Large_test_sonic.bp',
    ModPath .. 'Ahwassa_Crash_Flash1.bp',
    ModPath .. 'Ahwassa_Crash_Flash2.bp',
    ModPath .. 'Ahwassa_Impact_Glow01.bp',
    ModPath .. 'Ahwassa_Impact_Glow02.bp',
    ModPath .. 'Ahwassa_Impact_Electricity.bp',
    ModPath .. 'Ahwassa_Impact_Shockwave.bp',
}



-- EXP BOOMS (Seraphim)
-- NUKE EFFECTS (UEF) --UEF do not need anything extra with their nuke for now, just death effects.

UEFNukeKilled = {        
    ModPath .. 'residue_Very_Large_test_smoke.bp',
    ModPath .. 'Very_Large_test_smoke.bp',
    ModPath .. 'Very_Large_test_fire.bp',
    ModPath .. 'Very_Large_test_random.bp',
    ModPath .. 'Very_Large_test_sonic_nukeDeath.bp',
}



-- NUKE EFFECTS (UEF) --UEF do not need anything extra with their nuke for now, just death effects.
-- NUKE EFFECTS (CYBRAN)

-- Basic Nuke Boom (Land, Unit, Shield...)
CybranNuke = {
    ModPath .. 'CybranNuke_Flash.bp', --2D Lense flare big -> small
    ModPath .. 'CybranNuke_Flash_2.bp', --2D Lense flare small -> big
    ModPath .. 'CybranNuke_3DFlash.bp', --3D Lense flare big -> small
    ModPath .. 'CybranNuke_3DFlash_2.bp', --DD Lense flare small -> big
    ModPath .. 'CybranNuke_Impact_Electricity.bp', --Small amount of electricity rushing from initial boom
    ModPath .. 'CybranNuke_Electrified_Storm.bp', --Initial electrical storm, biggest size and intensity, lasts the least time 
    ModPath .. 'CybranNuke_Electrified_Residue.bp', --Electrical storm residue, medium size and intensity, lasts somewhat longer
    ModPath .. 'CybranNuke_Electrified_Residue_Long.bp', --Electrical storm low-charged particles, smallest size and intensity, lasts a while, slowly rises with smoke
    ModPath .. 'CybranNuke_Electrified_Residue_Long_Ground.bp', --Electrical storm low-charged particles that stick to ground nevel
    ModPath .. 'CybranNuke_Ground_Smoke.bp', --Ground smoke
    ModPath .. 'CybranNuke_NonElectrified_Smoke.bp', --Rising smoke, non electrified
    ModPath .. 'Very_Large_test_sonic_Cnuke.bp', --Sonic pulse
}

-- Water Nuke Boom -- No rising smoke over water
CybranNukeWater = { 
    ModPath .. 'CybranNuke_Flash.bp', 
    ModPath .. 'CybranNuke_Flash_2.bp',
    ModPath .. 'CybranNuke_3DFlash.bp',
    ModPath .. 'CybranNuke_3DFlash_2.bp',
    ModPath .. 'CybranNuke_Impact_Electricity.bp',
    ModPath .. 'CybranNuke_Electrified_Storm.bp',
    ModPath .. 'CybranNuke_Electrified_Residue.bp',
    ModPath .. 'CybranNuke_Electrified_Residue_Long.bp',
    ModPath .. 'CybranNuke_Electrified_Residue_Long_Ground.bp',
    ModPath .. 'CybranNuke_Ground_Smoke.bp',
    ModPath .. 'Very_Large_test_sonic_Cnuke.bp',
}

--Nuke Intercepted (By SMD)
CybranNukeKilled = {
    ModPath .. 'Cyb_Flash_4.bp',
    ModPath .. 'CybranNukeKilled_Electrified_Residue_Small.bp',
    ModPath .. 'CybranNukeKilled_Smoke.bp',
    ModPath .. 'Very_Large_test_sonic_nukeDeath.bp',
}



-- NUKE EFFECTS (CYBRAN)
-- NUKE EFFECTS (AEON)

-- Basic Nuke Boom (Land, Unit, Shield...)
AeonNuke = {
    ModPath .. 'AeonNuke_longsmoke_ground.bp', -- lingering smoke, at ground level
    ModPath .. 'AeonNuke_longsmoke_upwards.bp', -- lingering smoke, rising
    ModPath .. 'AeonNuke_Fast_Initial_Aura.bp', -- initial flash of quantum aura
    ModPath .. 'AeonNuke_Blinking_Aura.bp', -- spreading, blinking quantum aura
    ModPath .. 'AeonNuke_Blinking_Aura_Residue.bp', -- cover a smooth transition from spreading, blinking quantum aura
    ModPath .. 'AeonNuke_Fast_Sparks.bp', -- initial explosion sparks
    ModPath .. 'Very_Large_test_sonic_nuke.bp', -- sonic pulse
    ModPath .. 'AeonNuke_Air_Quantum_Pull.bp', -- air ring pulled inwards
}

-- Water Nuke Boom --No rising smoke effect on water, should maybe add some water wake effect... Maybe for V11 :D
AeonNukeWater = { 
    ModPath .. 'AeonNuke_longsmoke_ground.bp', 
    ModPath .. 'AeonNuke_Fast_Initial_Aura.bp', 
    ModPath .. 'AeonNuke_Blinking_Aura.bp', 
    ModPath .. 'AeonNuke_Blinking_Aura_Residue.bp', 
    ModPath .. 'AeonNuke_Fast_Sparks.bp', 
    ModPath .. 'Very_Large_test_sonic_nuke.bp', 
    ModPath .. 'AeonNuke_Air_Quantum_Pull.bp', 
}

-- Nuke Intercepted (By SMD)
AeonNukeKilled = {
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'Very_Large_test_sonic_nukeDeath.bp',
    ModPath .. 'AeonNukeDeath_Sparks.bp',
    ModPath .. 'AeonNukeDeath_Residue.bp',
}



-- NUKE EFFECTS (AEON)
-- NUKE EFFECTS (SERAPHIM) --Seraphim do not need anything extra with their nuke for now, just death effects.

SeraNukeKilled = {
    ModPath .. 'Ahwassa_Crash_Flash1.bp',
    ModPath .. 'Ahwassa_Crash_Flash2.bp',
    ModPath .. 'Ahwassa_Impact_Glow01.bp',
    ModPath .. 'Ahwassa_Impact_Glow02.bp',
    ModPath .. 'Ahwassa_Impact_Electricity.bp',
}



-- NUKE EFFECTS (SERAPHIM) --Seraphim do not need anything extra with their nuke for now, just death effects.
-- MAIN FACTIONAL FX



-- MISC. FX 
-- DEBRIS, OIL SLICKS...

OilSlick = {
    ModPath .. 'OilSlick.bp',
}

UEFFlamingDebrisLandImpact = {
    ModPath .. 'dust_emit.bp',            
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    --ModPath .. 'UEFDebrisImpactResidueFire.bp', 
    --ModPath .. 'UEFDebrisImpactResidueSmoke.bp', 
}

UEFFlamingDebrisTrail = {
    ModPath .. 'UEFFlamingDebrisFire.bp',
    ModPath .. 'UEFFlamingDebrisSmoke.bp',
}

CybranFlamingDebrisLandImpact = {
    --ModPath .. 'dust_emit.bp',
    ModPath .. 'CybT1_charge.bp',
    --ModPath .. 'CybT2_smoke.bp',
}

CybranFlamingDebrisTrail = {
    ModPath .. 'CybranFlamingDebrisFire.bp',
    --ModPath .. 'CybranFlamingDebrisSmoke.bp',
}

AeonFlamingDebrisLandImpact = {
    --ModPath .. 'dust_emit.bp',
    ModPath .. 'Debris_aura.bp',
    --ModPath .. 'AeonT2_smoke.bp',
}

AeonFlamingDebrisTrail = {
    ModPath .. 'AeonFlamingDebrisFire.bp',
    --ModPath .. 'AeonFlamingDebrisSmoke.bp',
}

SeraFlamingDebrisLandImpact = {
    --ModPath .. 'dust_emit.bp',
    ModPath .. 'SeraT2_electricity.bp',
    --ModPath .. 'AeonT2_smoke.bp',
}

SeraFlamingDebrisTrail = {
    ModPath .. 'SeraFlamingDebrisFire.bp',
    --ModPath .. 'AeonFlamingDebrisSmoke.bp',
}
AhwassaFlamingDebrisTrail  = {
    ModPath .. 'AhwassaFlamingDebrisFire.bp',
    --ModPath .. 'AeonFlamingDebrisSmoke.bp',
}
DebrisSplashyWater = {
    --EmtBpPath .. 'Splashy_Ripples_ring_01_emit.bp',
    --EmtBpPath .. 'Splashy_Plume_01_emit.bp',
}
SRDebrisImpact = {
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering_air.bp',
    ModPath .. 'CybT3_chargelong.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_1.bp',
}
CZARDebrisImpact = {
    --ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'Debris_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2_Air.bp',
}
AsswasherDebrisImpact = {
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}



-- DAMAGE FX


-- UEF Air DMG FX 


-- T1 UEF


-- T1 UEF Plane Light DMG
SmallAirUnitSmokeTECH1uef = { 
    ModPath .. 'UEFT1AircraftLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 UEF Plane Med DMG
SmallAirUnitFireTECH1uef = { 
    ModPath .. 'UEFT1AircraftMediumDmgFire.bp',
    ModPath .. 'UEFT1AircraftMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT1AircraftMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT1AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T1 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH1uef = { 
    ModPath .. 'UEFT1AircraftHeavyDmgFire.bp',
    ModPath .. 'UEFT1AircraftHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT1AircraftHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT1AircraftHeavyDmgSmokeTrailCarry.bp',
}


-- T2 UEF


-- T2 UEF Plane Light DMG
SmallAirUnitSmokeTECH2uef = { 
    ModPath .. 'UEFT2AircraftLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 UEF Plane Med DMG
SmallAirUnitFireTECH2uef = { 
    ModPath .. 'UEFT2AircraftMediumDmgFire.bp',
    ModPath .. 'UEFT2AircraftMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT2AircraftMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT2AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T2 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH2uef = { 
    ModPath .. 'UEFT2AircraftHeavyDmgFire.bp',
    ModPath .. 'UEFT2AircraftHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT2AircraftHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT2AircraftHeavyDmgSmokeTrailCarry.bp',
}


-- T3 UEF


-- T3 UEF Plane Light DMG
SmallAirUnitSmokeTECH3uef = { 
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 UEF Plane Med DMG
SmallAirUnitFireTECH3uef = { 
    ModPath .. 'UEFT3AircraftMediumDmgFire.bp',
    ModPath .. 'UEFT3AircraftMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT3AircraftMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT3AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T3 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH3uef = { 
    ModPath .. 'UEFT3AircraftHeavyDmgFire.bp',
    ModPath .. 'UEFT3AircraftHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT3AircraftHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT3AircraftHeavyDmgSmokeTrailCarry.bp',
}



-- UEF Air DMG FX  
-- Cybran Air DMG FX 


-- T1 Cybran


-- T1 Cybran Plane Light DMG
SmallAirUnitSmokeTECH1cybran = { 
    ModPath .. 'CybranT1AircraftLightDmgFire.bp',
}

-- T1 Cybran Plane Med DMG
SmallAirUnitFireTECH1cybran = { 
    ModPath .. 'CybranT1AircraftMediumDmgFire.bp',
    ModPath .. 'CybranT1AircraftMediumDmgSmokeTrail.bp',
}

-- T1 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH1cybran = { 
    ModPath .. 'CybranT1AircraftHeavyDmgFire.bp',
    ModPath .. 'CybranT1AircraftHeavyDmgFire2.bp',
    ModPath .. 'CybranT1AircraftHeavyDmgSmokeTrail.bp',
}


-- T2 Cybran


-- T2 Cybran Plane Light DMG
SmallAirUnitSmokeTECH2cybran = { 
    ModPath .. 'CybranT2AircraftLightDmgSmokeTrail.bp',
    ModPath .. 'CybranT2AircraftLightDmgFire.bp',
}

-- T2 Cybran Plane Med DMG
SmallAirUnitFireTECH2cybran = { 
    ModPath .. 'CybranT2AircraftMediumDmgFire.bp',
    ModPath .. 'CybranT2AircraftMediumDmgSmokeTrail.bp',
}

-- T2 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH2cybran = { 
    ModPath .. 'CybranT2AircraftHeavyDmgFire.bp',
    ModPath .. 'CybranT2AircraftHeavyDmgFire2.bp',
    ModPath .. 'CybranT2AircraftHeavyDmgSmokeTrail.bp',
}


-- T3 Cybran


-- T3 Cybran Plane Light DMG
SmallAirUnitSmokeTECH3cybran = { 
    ModPath .. 'CybranT3AircraftLightDmgSmokeTrail.bp',
    ModPath .. 'CybranT3AircraftLightDmgFire.bp',
}

-- T3 Cybran Plane Med DMG
SmallAirUnitFireTECH3cybran = { 
    ModPath .. 'CybranT3AircraftMediumDmgFire.bp',
    ModPath .. 'CybranT3AircraftMediumDmgSmokeTrail.bp',
}

-- T3 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH3cybran = { 
    ModPath .. 'CybranT3AircraftHeavyDmgFire.bp',
    ModPath .. 'CybranT3AircraftHeavyDmgFire2.bp',
    ModPath .. 'CybranT3AircraftHeavyDmgSmokeTrail.bp',
}



-- Cybran Air DMG FX  
-- Aeon Air DMG FX 


-- T1 Aeon


-- T1 Aeon Plane Light DMG
SmallAirUnitSmokeTECH1aeon = { 
    ModPath .. 'AeonT1AircraftLightDmgSmokeTrail.bp',
}

-- T1 Aeon Plane Med DMG
SmallAirUnitFireTECH1aeon = { 
    ModPath .. 'AeonT1AircraftMediumDmgFire.bp',
    ModPath .. 'AeonT1AircraftMediumDmgSmokeTrail.bp',
}

-- T1 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH1aeon = { 
    ModPath .. 'AeonT1AircraftHeavyDmgFire.bp',
    ModPath .. 'AeonT1AircraftHeavyDmgSmokeTrail.bp',
}


-- T2 Aeon


-- T2 Aeon Plane Light DMG
SmallAirUnitSmokeTECH2aeon = { 
    ModPath .. 'AeonT2AircraftLightDmgSmokeTrail.bp',
}

-- T2 Aeon Plane Med DMG
SmallAirUnitFireTECH2aeon = { 
    ModPath .. 'AeonT2AircraftMediumDmgFire.bp',
    ModPath .. 'AeonT2AircraftMediumDmgSmokeTrail.bp',
}

-- T2 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH2aeon = { 
    ModPath .. 'AeonT2AircraftHeavyDmgFire.bp',
    ModPath .. 'AeonT2AircraftHeavyDmgSmokeTrail.bp',
}


-- T3 Aeon


-- T3 Aeon Plane Light DMG
SmallAirUnitSmokeTECH3aeon = { 
    --ModPath .. 'AeonT3AircraftLightDmgSmokeTrail.bp',
}

-- T3 Aeon Plane Med DMG
SmallAirUnitFireTECH3aeon = { 
    ModPath .. 'AeonT3AircraftMediumDmgFire.bp',
    ModPath .. 'AeonT3AircraftMediumDmgSmokeTrail.bp',
}

-- T3 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH3aeon = { 
    ModPath .. 'AeonT3AircraftHeavyDmgFire.bp',
    ModPath .. 'AeonT3AircraftHeavyDmgSmokeTrail.bp',
}



-- Aeon Air DMG FX  
-- Sera Air DMG FX  


-- T1 Sera


-- T1 Sera Plane Light DMG
SmallAirUnitSmokeTECH1seraphim = { 
    ModPath .. 'SeraAircraftT1LightDmgSmokeTrail.bp',
}

-- T1 Sera Plane Med DMG
SmallAirUnitFireTECH1seraphim = { 
    ModPath .. 'SeraAircraftT1MediumDmgFire.bp',
    ModPath .. 'SeraAircraftT1MediumDmgSmokeTrail.bp',
}

-- T1 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH1seraphim = { 
    ModPath .. 'SeraAircraftT1HeavyDmgFire.bp',
    ModPath .. 'SeraAircraftT1HeavyDmgSmokeTrail.bp',
}


-- T2 Sera


-- T2 Sera Plane Light DMG
SmallAirUnitSmokeTECH2seraphim = { 
    ModPath .. 'SeraAircraftT2LightDmgSmokeTrail.bp',
}

-- T2 Sera Plane Med DMG
SmallAirUnitFireTECH2seraphim = { 
    ModPath .. 'SeraAircraftT2MediumDmgFire.bp',
    ModPath .. 'SeraAircraftT2MediumDmgSmokeTrail.bp',
}

-- T2 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH2seraphim = { 
    ModPath .. 'SeraAircraftT2HeavyDmgFire.bp',
    ModPath .. 'SeraAircraftT2HeavyDmgSmokeTrail.bp',
}


-- T3 Sera


-- T3 Sera Plane Light DMG
SmallAirUnitSmokeTECH3seraphim = { 
    ModPath .. 'SeraAircraftT3LightDmgSmokeTrail.bp',
}

-- T3 Sera Plane Med DMG
SmallAirUnitFireTECH3seraphim = { 
    ModPath .. 'SeraAircraftT3MediumDmgFire.bp',
    ModPath .. 'SeraAircraftT3MediumDmgSmokeTrail.bp',
}

-- T3 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH3seraphim = { 
    ModPath .. 'SeraAircraftT3HeavyDmgFire.bp',
    ModPath .. 'SeraAircraftT3HeavyDmgSmokeTrail.bp',
}



-- Sera Air DMG FX  
-- UEF Naval DMG FX  


-- T1 UEF


-- T1 UEF Ship Light DMG
LightNavalUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1ShipLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 UEF Ship Med DMG
MediumNavalUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1ShipMediumDmgFire.bp',
    ModPath .. 'UEFT1ShipMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT1ShipMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT1ShipMediumDmgSmokeTrailCarry.bp',
}

-- T1 UEF Ship Hvy DMG
HeavyNavalUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1ShipHeavyDmgFire.bp',
    ModPath .. 'UEFT1ShipHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT1ShipHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT1ShipHeavyDmgSmokeTrailCarry.bp',
}


-- T2 UEF


-- T2 UEF Ship Light DMG
LightNavalUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2ShipLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 UEF Ship Med DMG
MediumNavalUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2ShipMediumDmgFire.bp',
    ModPath .. 'UEFT2ShipMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT2ShipMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT2ShipMediumDmgSmokeTrailCarry.bp',
}

-- T2 UEF Ship Hvy DMG
HeavyNavalUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2ShipHeavyDmgFire.bp',
    ModPath .. 'UEFT2ShipHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT2ShipHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT2ShipHeavyDmgSmokeTrailCarry.bp',
}


-- T3 UEF


-- T3 UEF Ship Light DMG
LightNavalUnitDmgTECH3uef = { 
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 UEF Ship Med DMG
MediumNavalUnitDmgTECH3uef = { 
    ModPath .. 'UEFT3ShipMediumDmgFire.bp',
    ModPath .. 'UEFT3ShipMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT3ShipMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT3ShipMediumDmgSmokeTrailCarry.bp',
}

-- T3 UEF Ship Hvy DMG
HeavyNavalUnitDmgTECH3uef = { 
    ModPath .. 'UEFT3ShipHeavyDmgFire.bp',
    ModPath .. 'UEFT3ShipHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT3ShipHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT3ShipHeavyDmgSmokeTrailCarry.bp',
}



-- UEF Naval DMG FX  
-- Cybran Naval DMG FX 


-- T1 Cybran


-- T1 Cybran Ship Light DMG
LightNavalUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1ShipLightDmgFire.bp',
}

-- T1 Cybran Ship Med DMG
MediumNavalUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1ShipMediumDmgFire.bp',
    ModPath .. 'CybranT1ShipMediumDmgSmokeTrail.bp',
}

-- T1 Cybran Ship Hvy DMG
HeavyNavalUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1ShipHeavyDmgFire.bp',
    ModPath .. 'CybranT1ShipHeavyDmgFire2.bp',
    ModPath .. 'CybranT1ShipHeavyDmgSmokeTrail.bp',
}


-- T2 Cybran


-- T2 Cybran Ship Light DMG
LightNavalUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2ShipLightDmgSmokeTrail.bp',
    ModPath .. 'CybranT2ShipLightDmgFire.bp',
}

-- T2 Cybran Ship Med DMG
MediumNavalUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2ShipMediumDmgFire.bp',
    ModPath .. 'CybranT2ShipMediumDmgSmokeTrail.bp',
}

-- T2 Cybran Ship Hvy DMG
HeavyNavalUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2ShipHeavyDmgFire.bp',
    ModPath .. 'CybranT2ShipHeavyDmgFire2.bp',
    ModPath .. 'CybranT2ShipHeavyDmgSmokeTrail.bp',
}


-- T3 Cybran


-- T3 Cybran Ship Light DMG
LightNavalUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3ShipLightDmgSmokeTrail.bp',
    ModPath .. 'CybranT3ShipLightDmgFire.bp',
}

-- T3 Cybran Ship Med DMG
MediumNavalUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3ShipMediumDmgFire.bp',
    ModPath .. 'CybranT3ShipMediumDmgSmokeTrail.bp',
}

-- T3 Cybran Ship Hvy DMG
HeavyNavalUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3ShipHeavyDmgFire.bp',
    ModPath .. 'CybranT3ShipHeavyDmgFire2.bp',
    ModPath .. 'CybranT3ShipHeavyDmgSmokeTrail.bp',
}



-- Cybran Naval DMG FX  
-- Aeon Naval DMG FX 


-- T1 Aeon


-- T1 Aeon Ship Light DMG
LightNavalUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1ShipLightDmgSmokeTrail.bp',
}

-- T1 Aeon Ship Med DMG
MediumNavalUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1ShipMediumDmgFire.bp',
    ModPath .. 'AeonT1ShipMediumDmgSmokeTrail.bp',
}

-- T1 Aeon Ship Hvy DMG
HeavyNavalUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1ShipHeavyDmgFire.bp',
    ModPath .. 'AeonT1ShipHeavyDmgSmokeTrail.bp',
}


-- T2 Aeon


-- T2 Aeon Ship Light DMG
LightNavalUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2ShipLightDmgSmokeTrail.bp',
}

-- T2 Aeon Ship Med DMG
MediumNavalUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2ShipMediumDmgFire.bp',
    ModPath .. 'AeonT2ShipMediumDmgSmokeTrail.bp',
}

-- T2 Aeon Ship Hvy DMG
HeavyNavalUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2ShipHeavyDmgFire.bp',
    ModPath .. 'AeonT2ShipHeavyDmgSmokeTrail.bp',
}


-- T3 Aeon


-- T3 Aeon Ship Light DMG
LightNavalUnitDmgTECH3aeon = { 
    --ModPath .. 'AeonT3ShipLightDmgSmokeTrail.bp',
}

-- T3 Aeon Ship Med DMG
MediumNavalUnitDmgTECH3aeon = { 
    ModPath .. 'AeonT3ShipMediumDmgFire.bp',
    ModPath .. 'AeonT3ShipMediumDmgSmokeTrail.bp',
}

-- T3 Aeon Ship Hvy DMG
HeavyNavalUnitDmgTECH3aeon = { 
    ModPath .. 'AeonT3ShipHeavyDmgFire.bp',
    ModPath .. 'AeonT3ShipHeavyDmgSmokeTrail.bp',
}



-- Aeon Naval DMG FX  
-- Sera Naval DMG FX  


-- T1 Sera


-- T1 Sera Ship Light DMG
LightNavalUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraShipT1LightDmgSmokeTrail.bp',
}

-- T1 Sera Ship Med DMG
MediumNavalUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraShipT1MediumDmgFire.bp',
    ModPath .. 'SeraShipT1MediumDmgSmokeTrail.bp',
}

-- T1 Sera Ship Hvy DMG
HeavyNavalUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraShipT1HeavyDmgFire.bp',
    ModPath .. 'SeraShipT1HeavyDmgSmokeTrail.bp',
}


-- T2 Sera


-- T2 Sera Ship Light DMG
LightNavalUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraShipT2LightDmgSmokeTrail.bp',
}

-- T2 Sera Ship Med DMG
MediumNavalUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraShipT2MediumDmgFire.bp',
    ModPath .. 'SeraShipT2MediumDmgSmokeTrail.bp',
}

-- T2 Sera Ship Hvy DMG
HeavyNavalUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraShipT2HeavyDmgFire.bp',
    ModPath .. 'SeraShipT2HeavyDmgSmokeTrail.bp',
}


-- T3 Sera


-- T3 Sera Ship Light DMG
LightNavalUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraShipT3LightDmgSmokeTrail.bp',
}

-- T3 Sera Ship Med DMG
MediumNavalUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraShipT3MediumDmgFire.bp',
    ModPath .. 'SeraShipT3MediumDmgSmokeTrail.bp',
}

-- T3 Sera Ship Hvy DMG
HeavyNavalUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraShipT3HeavyDmgFire.bp',
    ModPath .. 'SeraShipT3HeavyDmgSmokeTrail.bp',
}



-- Sera Naval DMG FX 
-- UEF Structure DMG FX  


-- T1 UEF


-- T1 UEF Structure Light DMG
LightStructureUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1StructureLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 UEF Structure Med DMG
MediumStructureUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1StructureMediumDmgFire.bp',
    ModPath .. 'UEFT1StructureMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT1StructureMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT1StructureMediumDmgSmokeTrailCarry.bp',
}

-- T1 UEF Structure Hvy DMG
HeavyStructureUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1StructureHeavyDmgFire.bp',
    ModPath .. 'UEFT1StructureHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT1StructureHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT1StructureHeavyDmgSmokeTrailCarry.bp',
}


-- T2 UEF


-- T2 UEF Structure Light DMG
LightStructureUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2StructureLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 UEF Structure Med DMG
MediumStructureUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2StructureMediumDmgFire.bp',
    ModPath .. 'UEFT2StructureMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT2StructureMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT2StructureMediumDmgSmokeTrailCarry.bp',
}

-- T2 UEF Structure Hvy DMG
HeavyStructureUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2StructureHeavyDmgFire.bp',
    ModPath .. 'UEFT2StructureHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT2StructureHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT2StructureHeavyDmgSmokeTrailCarry.bp',
}


-- T3 UEF


-- T3 UEF Structure Light DMG
LightStructureUnitDmgTECH3uef = { 
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 UEF Structure Med DMG
MediumStructureUnitDmgTECH3uef = { 
    ModPath .. 'UEFT3StructureMediumDmgFire.bp',
    ModPath .. 'UEFT3StructureMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT3StructureMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT3StructureMediumDmgSmokeTrailCarry.bp',
}

-- T3 UEF Structure Hvy DMG
HeavyStructureUnitDmgTECH3uef = { 
    ModPath .. 'UEFT3StructureHeavyDmgFire.bp',
    ModPath .. 'UEFT3StructureHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT3StructureHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT3StructureHeavyDmgSmokeTrailCarry.bp',
}



-- UEF Structure DMG FX  
-- Cybran Structure DMG FX 


-- T1 Cybran


-- T1 Cybran Structure Light DMG
LightStructureUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1StructureLightDmgFire.bp',
}

-- T1 Cybran Structure Med DMG
MediumStructureUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1StructureMediumDmgFire.bp',
    ModPath .. 'CybranT1StructureMediumDmgSmokeTrail.bp',
}

-- T1 Cybran Structure Hvy DMG
HeavyStructureUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1StructureHeavyDmgFire.bp',
    ModPath .. 'CybranT1StructureHeavyDmgFire2.bp',
    ModPath .. 'CybranT1StructureHeavyDmgSmokeTrail.bp',
}


-- T2 Cybran


-- T2 Cybran Structure Light DMG
LightStructureUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2StructureLightDmgSmokeTrail.bp',
    ModPath .. 'CybranT2StructureLightDmgFire.bp',
}

-- T2 Cybran Structure Med DMG
MediumStructureUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2StructureMediumDmgFire.bp',
    ModPath .. 'CybranT2StructureMediumDmgSmokeTrail.bp',
}

-- T2 Cybran Structure Hvy DMG
HeavyStructureUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2StructureHeavyDmgFire.bp',
    ModPath .. 'CybranT2StructureHeavyDmgFire2.bp',
    ModPath .. 'CybranT2StructureHeavyDmgSmokeTrail.bp',
}


-- T3 Cybran


-- T3 Cybran Structure Light DMG
LightStructureUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3StructureLightDmgSmokeTrail.bp',
    ModPath .. 'CybranT3StructureLightDmgFire.bp',
}

-- T3 Cybran Structure Med DMG
MediumStructureUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3StructureMediumDmgFire.bp',
    ModPath .. 'CybranT3StructureMediumDmgSmokeTrail.bp',
}

-- T3 Cybran Structure Hvy DMG
HeavyStructureUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3StructureHeavyDmgFire.bp',
    ModPath .. 'CybranT3StructureHeavyDmgFire2.bp',
    ModPath .. 'CybranT3StructureHeavyDmgSmokeTrail.bp',
}



-- Cybran Structure DMG FX  
-- Aeon Structure DMG FX 


-- T1 Aeon


-- T1 Aeon Structure Light DMG
LightStructureUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1StructureLightDmgSmokeTrail.bp',
}

-- T1 Aeon Structure Med DMG
MediumStructureUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1StructureMediumDmgFire.bp',
    ModPath .. 'AeonT1StructureMediumDmgSmokeTrail.bp',
}

-- T1 Aeon Structure Hvy DMG
HeavyStructureUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1StructureHeavyDmgFire.bp',
    ModPath .. 'AeonT1StructureHeavyDmgSmokeTrail.bp',
}


-- T2 Aeon


-- T2 Aeon Structure Light DMG
LightStructureUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2StructureLightDmgSmokeTrail.bp',
}

-- T2 Aeon Structure Med DMG
MediumStructureUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2StructureMediumDmgFire.bp',
    ModPath .. 'AeonT2StructureMediumDmgSmokeTrail.bp',
}

-- T2 Aeon Structure Hvy DMG
HeavyStructureUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2StructureHeavyDmgFire.bp',
    ModPath .. 'AeonT2StructureHeavyDmgSmokeTrail.bp',
}


-- T3 Aeon


-- T3 Aeon Structure Light DMG
LightStructureUnitDmgTECH3aeon = { 
    --ModPath .. 'AeonT3StructureLightDmgSmokeTrail.bp',
}

-- T3 Aeon Structure Med DMG
MediumStructureUnitDmgTECH3aeon = { 
    ModPath .. 'AeonT3StructureMediumDmgFire.bp',
    ModPath .. 'AeonT3StructureMediumDmgSmokeTrail.bp',
}

-- T3 Aeon Structure Hvy DMG
HeavyStructureUnitDmgTECH3aeon = { 
    ModPath .. 'AeonT3StructureHeavyDmgFire.bp',
    ModPath .. 'AeonT3StructureHeavyDmgSmokeTrail.bp',
}



-- Aeon Structure DMG FX  
-- Sera Structure DMG FX  


-- T1 Sera


-- T1 Sera Structure Light DMG
LightStructureUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraStructureT1LightDmgSmokeTrail.bp',
}

-- T1 Sera Structure Med DMG
MediumStructureUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraStructureT1MediumDmgFire.bp',
    ModPath .. 'SeraStructureT1MediumDmgSmokeTrail.bp',
}

-- T1 Sera Structure Hvy DMG
HeavyStructureUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraStructureT1HeavyDmgFire.bp',
    ModPath .. 'SeraStructureT1HeavyDmgSmokeTrail.bp',
}


-- T2 Sera


-- T2 Sera Structure Light DMG
LightStructureUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraStructureT2LightDmgSmokeTrail.bp',
}

-- T2 Sera Structure Med DMG
MediumStructureUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraStructureT2MediumDmgFire.bp',
    ModPath .. 'SeraStructureT2MediumDmgSmokeTrail.bp',
}

-- T2 Sera Structure Hvy DMG
HeavyStructureUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraStructureT2HeavyDmgFire.bp',
    ModPath .. 'SeraStructureT2HeavyDmgSmokeTrail.bp',
}


-- T3 Sera


-- T3 Sera Structure Light DMG
LightStructureUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraStructureT3LightDmgSmokeTrail.bp',
}

-- T3 Sera Structure Med DMG
MediumStructureUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraStructureT3MediumDmgFire.bp',
    ModPath .. 'SeraStructureT3MediumDmgSmokeTrail.bp',
}

-- T3 Sera Structure Hvy DMG
HeavyStructureUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraStructureT3HeavyDmgFire.bp',
    ModPath .. 'SeraStructureT3HeavyDmgSmokeTrail.bp',
}



-- Sera Structure DMG FX  
-- UEF Land DMG FX  


-- T1 UEF


-- T1 UEF Land Light DMG
LightLandUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1LandLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 UEF Land Med DMG
MediumLandUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1LandMediumDmgFire.bp',
    ModPath .. 'UEFT1LandMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT1LandMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT1LandMediumDmgSmokeTrailCarry.bp',
}

-- T1 UEF Land Hvy DMG
HeavyLandUnitDmgTECH1uef = { 
    ModPath .. 'UEFT1LandHeavyDmgFire.bp',
    ModPath .. 'UEFT1LandHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT1LandHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT1LandHeavyDmgSmokeTrailCarry.bp',
}


-- T2 UEF


-- T2 UEF Land Light DMG
LightLandUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2LandLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 UEF Land Med DMG
MediumLandUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2LandMediumDmgFire.bp',
    ModPath .. 'UEFT2LandMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT2LandMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT2LandMediumDmgSmokeTrailCarry.bp',
}

-- T2 UEF Land Hvy DMG
HeavyLandUnitDmgTECH2uef = { 
    ModPath .. 'UEFT2LandHeavyDmgFire.bp',
    ModPath .. 'UEFT2LandHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT2LandHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT2LandHeavyDmgSmokeTrailCarry.bp',
}


-- T3 UEF


-- T3 UEF Land Light DMG
LightLandUnitDmgTECH3uef = { 
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 UEF Land Med DMG
MediumLandUnitDmgTECH3uef = { 
    ModPath .. 'UEFT3LandMediumDmgFire.bp',
    ModPath .. 'UEFT3LandMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT3LandMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT3LandMediumDmgSmokeTrailCarry.bp',
}

-- T3 UEF Land Hvy DMG
HeavyLandUnitDmgTECH3uef = { 
    ModPath .. 'UEFT3LandHeavyDmgFire.bp',
    ModPath .. 'UEFT3LandHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT3LandHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT3LandHeavyDmgSmokeTrailCarry.bp',
}



-- UEF Land DMG FX  
-- Cybran Land DMG FX 


-- T1 Cybran


-- T1 Cybran Land Light DMG
LightLandUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1LandLightDmgFire.bp',
}

-- T1 Cybran Land Med DMG
MediumLandUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1LandMediumDmgFire.bp',
    ModPath .. 'CybranT1LandMediumDmgSmokeTrail.bp',
}

-- T1 Cybran Land Hvy DMG
HeavyLandUnitDmgTECH1cybran = { 
    ModPath .. 'CybranT1LandHeavyDmgFire.bp',
    ModPath .. 'CybranT1LandHeavyDmgFire2.bp',
    ModPath .. 'CybranT1LandHeavyDmgSmokeTrail.bp',
}


-- T2 Cybran


-- T2 Cybran Land Light DMG
LightLandUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2LandLightDmgSmokeTrail.bp',
    ModPath .. 'CybranT2LandLightDmgFire.bp',
}

-- T2 Cybran Land Med DMG
MediumLandUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2LandMediumDmgFire.bp',
    ModPath .. 'CybranT2LandMediumDmgSmokeTrail.bp',
}

-- T2 Cybran Land Hvy DMG
HeavyLandUnitDmgTECH2cybran = { 
    ModPath .. 'CybranT2LandHeavyDmgFire.bp',
    ModPath .. 'CybranT2LandHeavyDmgFire2.bp',
    ModPath .. 'CybranT2LandHeavyDmgSmokeTrail.bp',
}


-- T3 Cybran


-- T3 Cybran Land Light DMG
LightLandUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3LandLightDmgSmokeTrail.bp',
    ModPath .. 'CybranT3LandLightDmgFire.bp',
}

-- T3 Cybran Land Med DMG
MediumLandUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3LandMediumDmgFire.bp',
    ModPath .. 'CybranT3LandMediumDmgSmokeTrail.bp',
}

-- T3 Cybran Land Hvy DMG
HeavyLandUnitDmgTECH3cybran = { 
    ModPath .. 'CybranT3LandHeavyDmgFire.bp',
    ModPath .. 'CybranT3LandHeavyDmgFire2.bp',
    ModPath .. 'CybranT3LandHeavyDmgSmokeTrail.bp',
}



-- Cybran Land DMG FX  
-- Aeon Land DMG FX 


-- T1 Aeon


-- T1 Aeon Land Light DMG
LightLandUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1LandLightDmgSmokeTrail.bp',
}

-- T1 Aeon Land Med DMG
MediumLandUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1LandMediumDmgFire.bp',
    ModPath .. 'AeonT1LandMediumDmgSmokeTrail.bp',
}

-- T1 Aeon Land Hvy DMG
HeavyLandUnitDmgTECH1aeon = { 
    ModPath .. 'AeonT1LandHeavyDmgFire.bp',
    ModPath .. 'AeonT1LandHeavyDmgSmokeTrail.bp',
}


-- T2 Aeon


-- T2 Aeon Land Light DMG
LightLandUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2LandLightDmgSmokeTrail.bp',
}

-- T2 Aeon Land Med DMG
MediumLandUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2LandMediumDmgFire.bp',
    ModPath .. 'AeonT2LandMediumDmgSmokeTrail.bp',
}

-- T2 Aeon Land Hvy DMG
HeavyLandUnitDmgTECH2aeon = { 
    ModPath .. 'AeonT2LandHeavyDmgFire.bp',
    ModPath .. 'AeonT2LandHeavyDmgSmokeTrail.bp',
}


-- T3 Aeon


-- T3 Aeon Land Light DMG
LightLandUnitDmgTECH3aeon = { 
    --ModPath .. 'AeonT3LandLightDmgSmokeTrail.bp',
}

-- T3 Aeon Land Med DMG
MediumLandUnitDmgTECH3aeon = { 
    ModPath .. 'AeonT3LandMediumDmgFire.bp',
    ModPath .. 'AeonT3LandMediumDmgSmokeTrail.bp',
}

-- T3 Aeon Land Hvy DMG
HeavyLandUnitDmgTECH3aeon = { 
    ModPath .. 'AeonT3LandHeavyDmgFire.bp',
    ModPath .. 'AeonT3LandHeavyDmgSmokeTrail.bp',
}



-- Aeon Land DMG FX  
-- Sera Land DMG FX  


-- T1 Sera


-- T1 Sera Land Light DMG
LightLandUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraLandT1LightDmgSmokeTrail.bp',
}

-- T1 Sera Land Med DMG
MediumLandUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraLandT1MediumDmgFire.bp',
    ModPath .. 'SeraLandT1MediumDmgSmokeTrail.bp',
}

-- T1 Sera Land Hvy DMG
HeavyLandUnitDmgTECH1seraphim = { 
    ModPath .. 'SeraLandT1HeavyDmgFire.bp',
    ModPath .. 'SeraLandT1HeavyDmgSmokeTrail.bp',
}


-- T2 Sera


-- T2 Sera Land Light DMG
LightLandUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraLandT2LightDmgSmokeTrail.bp',
}

-- T2 Sera Land Med DMG
MediumLandUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraLandT2MediumDmgFire.bp',
    ModPath .. 'SeraLandT2MediumDmgSmokeTrail.bp',
}

-- T2 Sera Land Hvy DMG
HeavyLandUnitDmgTECH2seraphim = { 
    ModPath .. 'SeraLandT2HeavyDmgFire.bp',
    ModPath .. 'SeraLandT2HeavyDmgSmokeTrail.bp',
}


-- T3 Sera


-- T3 Sera Land Light DMG
LightLandUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraLandT3LightDmgSmokeTrail.bp',
}

-- T3 Sera Land Med DMG
MediumLandUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraLandT3MediumDmgFire.bp',
    ModPath .. 'SeraLandT3MediumDmgSmokeTrail.bp',
}

-- T3 Sera Land Hvy DMG
HeavyLandUnitDmgTECH3seraphim = { 
    ModPath .. 'SeraLandT3HeavyDmgFire.bp',
    ModPath .. 'SeraLandT3HeavyDmgSmokeTrail.bp',
}



-- Sera Land DMG FX 
