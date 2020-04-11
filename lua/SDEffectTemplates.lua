--#****************************************************************************
--#**
--#**  File     :  SDEffectTemplates
--#**  Author(s):  RK4000
--#**
--#**  Summary  :  Generic templates for commonly used effects for the explosions mod. (in other words, this is where the magic happens)
--#**
--#**  Copyright © 2014 RK Powered Games, Inc.  All rights reserved.
--#****************************************************************************
local ModPath = '/mods/rks_explosions/effects/emitters/'
local ModPathDmgFX = '/mods/rks_explosions/effects/emitters/dmgfx/'
local ModPathNomads = '/mods/rks_explosions/effects/emitters/nomads'

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



-- MAIN FACTIONAL DEATH FX 
-- LAND BOOMS 

-- T1 UEF Unit Boom
ExplosionTECH1UEF = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_random.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'SDantimatter_ring_01_emit.bp',
    ModPath .. 'SDantimatter_ring_02_emit.bp',
    ModPath .. 'small_UEF_test_fire.bp',
}

-- T2 UEF Unit Boom
ExplosionTECH2UEF = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_random.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    ModPath .. 'SDantimatter_ring_01_emit.bp',
    ModPath .. 'SDantimatter_ring_02_emit.bp',
    --ModPath .. 'UEF_Outward_Spark_Small.bp',
    ModPath .. 'small_UEF_test_fire.bp',
}

-- T3 UEF Unit Boom
ExplosionTECH3UEF = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smokeT3.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    ModPath .. 'SDantimatter_ring_03_Land.bp',
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'UEF_Outward_Spark.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}

-- T1 Cyb Unit Boom
ExplosionTECH1CYBRAN = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'CybT1_smoke.bp',
    ModPath .. 'CybT1_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}

-- T2 Cyb Unit Boom
ExplosionTECH2CYBRAN = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}

-- T3 Cyb Unit Boom
ExplosionTECH3CYBRAN = {
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
ExplosionTECH1AEON = {
    --ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2.bp',
}

-- T2 Aeon Unit Boom
ExplosionTECH2AEON = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT2_smoke.bp',
    --ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2.bp',
}

-- T3 Aeon Unit Boom
ExplosionTECH3AEON = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'dust_emit.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- T1 Sera Unit Boom
ExplosionTECH1SERAPHIM = {
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
ExplosionTECH2SERAPHIM = {
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
ExplosionTECH3SERAPHIM = {
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
AirExplosionTECH1UEF = {             
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    --ModPath .. 'SDantimatter_ring_01_air.bp',
}

-- T2 UEF Air Unit Boom
AirExplosionTECH2UEF = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit_air.bp', 
    ModPath .. 'SDantimatter_ring_03_Land.bp',
}

-- T3 UEF Air Unit Boom
AirExplosionTECH3UEF = {
    --ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit_air.bp', 
    ModPath .. 'SDantimatter_ring_01_air.bp',
    ModPath .. 'UEF_Outward_Spark_Air.bp', 
}

-- T1 Cyb Air Unit Boom
AirExplosionTECH1CYBRAN = {
    ModPath .. 'CybT1_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering_air.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}

-- T2 Cyb Air Unit Boom
AirExplosionTECH2CYBRAN = {
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering_air.bp',
    ModPath .. 'CybT3_chargelong.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_1.bp',
}

-- T3 Cyb Air Unit Boom
AirExplosionTECH3CYBRAN = {
    --ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargelong_air.bp',
    ModPath .. 'CybT3_chargering_air.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2_air.bp',
}

-- T1 Aeon Air Unit Boom
AirExplosionTECH1AEON = {
    --ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT2_smoke.bp',
    --ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2_Air.bp',
}

-- T2 Aeon Air Unit Boom
AirExplosionTECH2AEON = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT2_Air.bp',
}

-- T3 Aeon Air Unit Boom
AirExplosionTECH3AEON = {
    ModPath .. 'Aeon_Spark_air.bp',
    --ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    --ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3_Air.bp',
}

-- T1 Sera Air Unit Boom
AirExplosionTECH1SERAPHIM = {
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
AirExplosionTECH2SERAPHIM = {
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
AirExplosionTECH3SERAPHIM = {
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
BuildingExplosionTECH1UEF = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --ModPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}

-- T2 UEF Building Unit Boom
BuildingExplosionTECH2UEF = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --ModPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'SDantimatter_ring_03_Land.bp',
}

-- T3 UEF Building Unit Boom
BuildingExplosionTECH3UEF = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --ModPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'UEF_Outward_Spark_Building.bp',
    ModPath .. 'SDantimatter_ring_03_Land.bp',
    
}

-- T1 Cyb Building Unit Boom
BuildingExplosionTECH1CYBRAN = {
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- T2 Cyb Building Unit Boom
BuildingExplosionTECH2CYBRAN = {
    ModPath .. 'CybT2_smoke.bp',
    ModPath .. 'CybT2_charge.bp',
    ModPath .. 'CybT2_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- T3 Cyb Building Unit Boom
BuildingExplosionTECH3CYBRAN = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargelong.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- T1 Aeon Building Unit Boom
BuildingExplosionTECH1AEON = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT2_Air.bp',
}

-- T2 Aeon Building Unit Boom
BuildingExplosionTECH2AEON = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'AeonT2_smoke.bp',
    ModPath .. 'AeonT2_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT2_Air.bp',
}

-- T3 Aeon Building Unit Boom
BuildingExplosionTECH3AEON = {
    ModPath .. 'Aeon_Spark.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    --ModPath .. 'AuraWaveT3_Air.bp',
}

-- T1 Sera Building Unit Boom
BuildingExplosionTECH1SERAPHIM = {
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
BuildingExplosionTECH2SERAPHIM = {
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
BuildingExplosionTECH3SERAPHIM = {
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
FallDownTrailTECH1UEF = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

-- T2 UEF Plane Fall Down
FallDownTrailTECH2UEF = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

-- T3 UEF Plane Fall Down
FallDownTrailTECH3UEF = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

-- T1 Cybran Plane Fall Down
FallDownTrailTECH1CYBRAN = { 
    ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
    ModPath .. 'Cybran_Fall_Down_Smoke_T1.bp',
}

-- T2 Cybran Plane Fall Down
FallDownTrailTECH2CYBRAN = { 
    ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
    ModPath .. 'Cybran_Fall_Down_Smoke_T1.bp',
}

-- T3 Cybran Plane Fall Down
FallDownTrailTECH3CYBRAN = { 
    --ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
    ModPath .. 'Cybran_Fall_Down_Smoke_T3.bp',
}

-- T1 Aeon Plane Fall Down
FallDownTrailTECH1AEON = { 
    ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue_Dimmed.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T2 Aeon Plane Fall Down
FallDownTrailTECH2AEON = { 
    ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue_Dimmed.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T3 Aeon Plane Fall Down
FallDownTrailTECH3AEON = { 
    ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
    ModPath .. 'Aeon_Fall_Down_Green_Hue_Dimmed.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T1 Sera Plane Fall Down
FallDownTrailTECH1SERAPHIM = { 
    ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
    ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T2 Sera Plane Fall Down
FallDownTrailTECH2SERAPHIM = { 
    ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
    ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

-- T3 Sera Plane Fall Down
FallDownTrailTECH3SERAPHIM = { 
    ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
    ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
    ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}



-- FALLDOWN FX 
-- Ship Sub-Booms (Above water)

-- UEF T1 Ship Sub-Boom
ShipSubExplTECH1UEF = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}

-- UEF T2 Ship Sub-Boom
ShipSubExplTECH2UEF = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'SDantimatter_ring_03_Land.bp',
}

-- UEF T3 Ship Sub-Boom
ShipSubExplTECH3UEF = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp', 
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp', 
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'UEF_Outward_Spark_Building.bp', 
    ModPath .. 'SDantimatter_ring_03_Land.bp',
}

-- Cyb T1 Ship Sub-Boom
ShipSubExplTECH1CYBRAN = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'CybT3_chargelong.bp',
}

-- Cyb T2 Ship Sub-Boom
ShipSubExplTECH2CYBRAN = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'CybT3_chargelong.bp',
     ModPath .. 'Cyb_Flash_2.bp',
}

-- Cyb T3 Ship Sub-Boom
ShipSubExplTECH3CYBRAN = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'CybT3_chargelong.bp',
     ModPath .. 'Cyb_Flash_1.bp',
}

-- Aeon T1 Ship Sub-Boom
ShipSubExplTECH1AEON = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- Aeon T2 Ship Sub-Boom
ShipSubExplTECH2AEON = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- Aeon T3 Ship Sub-Boom
ShipSubExplTECH3AEON = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- Sera T1 Ship Sub-Boom
ShipSubExplTECH1SERAPHIM = {
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
ShipSubExplTECH2SERAPHIM = {
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
ShipSubExplTECH3SERAPHIM = {
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
ShipSubExplUnderwaterTECH1UEF = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}

-- UEF T2 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH2UEF = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}

-- UEF T3 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH3UEF = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}

-- Cyb T1 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH1CYBRAN = {
    ModPath .. 'CybT3_Underwater_charge.bp',
}

-- Cyb T2 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH2CYBRAN = {
    ModPath .. 'CybT3_Underwater_charge.bp',
}

-- Cyb T3 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH3CYBRAN = {
    ModPath .. 'CybT3_Underwater_charge.bp',
}

-- Aeon T1 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH1AEON = {
    ModPath .. 'AeonSubBoom_aura_underwater.bp',
}

-- Aeon T2 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH2AEON = {
    ModPath .. 'AeonSubBoom_aura_underwater.bp',
}

-- Aeon T3 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH3AEON = {
    ModPath .. 'AeonSubBoom_aura_underwater.bp',
}

-- Sera T1 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH1SERAPHIM = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
    ModPath .. 'Sera_T3_chargering_underwater.bp',
}

-- Sera T2 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH2SERAPHIM = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
    ModPath .. 'Sera_T3_chargering_underwater.bp',
}

-- Sera T3 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH3SERAPHIM = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
    ModPath .. 'Sera_T3_chargering_underwater.bp',
}



-- Ship Sub-Booms (Below Water) 
-- Sub Booms (surface)

-- UEF Sub Boom (Surface)
SubExplosionAboveWaterUEF = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp', 
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp', 
    ModPath .. 'small_UEF_test_fire_T3.bp', 
}

-- Cybran Sub Boom (Surface)
SubExplosionAboveWaterCYBRAN = {
    ModPath .. 'CybT3_smoke.bp',
    ModPath .. 'CybT3_charge.bp',
    ModPath .. 'CybT3_chargering.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'CybT3_chargelong.bp',
    ModPath .. 'Cyb_Flash_2.bp',
}

-- Aeon Sub Boom (Surface)
SubExplosionAboveWaterAEON = {
    ModPath .. 'Aeon_Spark_air.bp',
    ModPath .. 'AeonT3_smoke.bp',
    ModPath .. 'AeonT3_aura.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
    ModPath .. 'AuraWaveT3.bp',
}

-- Sera Sub Boom (Surface)
SubExplosionAboveWaterSERAPHIM = {
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
SubExplosionUnderWaterUEF = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Cybran Sub Boom (Underwater)
SubExplosionUnderWaterCYBRAN = {
    ModPath .. 'CybT3_Underwater_charge.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Aeon Sub Boom (Underwater)
SubExplosionUnderWaterAEON = {
    ModPath .. 'AeonT3_aura_underwater.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Sera Sub Boom (Underwater)
SubExplosionUnderWaterSERAPHIM = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
    ModPath .. 'Sera_T3_chargering_underwater.bp',
}



-- Sub Booms (Underwater)


-- EXP BOOMS (UEF)

ExplosionSmallSD = {
    ModPath .. 'dust_small_emit.bp',
    ModPath .. 'SDsmall_test_sonic.bp',
    ModPath .. 'SDsmall_test_fire.bp',
    ModPath .. 'SDsmall_test_random.bp',
    ModPath .. 'SDsmall_test_smoke.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Small.bp', 
}

ExplosionMediumSD = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'SDMedium_test_smoke.bp',
    ModPath .. 'SDMedium_test_fire.bp',
    ModPath .. 'SDMedium_test_random.bp',
    ModPath .. 'SDMedium_test_sonic.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Medium.bp', 
}

ExplosionLargeShortDurSmoke = {
    --ModPath .. 'Large_ShortDur_test_smoke.bp',
    ModPath .. 'residue_Very_Large_test_smoke.bp',
    ModPath .. 'SDLarge_test_fire.bp',
    ModPath .. 'SDLarge_test_random.bp',
    ModPath .. 'SDLarge_test_sonic.bp',
    ModPath .. 'UEF_Very_Large_test_sonic.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Big.bp', 
}
ExplosionVeryLarge = {
    ModPath .. 'residue_Very_Large_test_smoke.bp',
    ModPath .. 'SDVery_Large_test_smoke.bp',
    ModPath .. 'SDVery_Large_test_fire.bp',
    ModPath .. 'SDVery_Large_test_random.bp',
    ModPath .. 'SDVery_Large_test_sonic.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Big.bp', 
}
ExplosionVeryLargeShortDurSmoke = {
    ModPath .. 'residue_Very_Large_test_smoke.bp',
    ModPath .. 'Very_ShortDur_Large_test_smoke.bp',
    ModPath .. 'SDVery_Large_test_fire.bp',
    ModPath .. 'SDVery_Large_test_random.bp',
    ModPath .. 'SDVery_Large_test_sonic.bp',
    ModPath .. 'UEF_Outward_Spark_EXP_Big.bp', 
} 



-- EXP BOOMS (UEF)
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
    --ModPath .. 'Aeon_CZAR_Air_Rushing_In.bp', Causes lag. Don't know how to make a similar effect without FPS killing. Keeping this here to remind me to do so sometime.
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
    ModPath .. 'Splashy_Ripples_ring_01_emit.bp',
    ModPath .. 'Splashy_Plume_01_emit.bp',
    --ModPath .. 'SeraT2_electricity.bp',
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



------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------DMG FX IS BELOW
------------------------------------------------------------------------------------------------------------------ 


-- UEF Air DMG FX 


-- T1 UEF


-- T1 UEF Plane Light DMG
SmallAirUnitSmokeTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1AircraftLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 UEF Plane Med DMG
SmallAirUnitFireTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT1AircraftMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT1AircraftMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT1AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T1 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT1AircraftHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT1AircraftHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT1AircraftHeavyDmgSmokeTrailCarry.bp',
}


-- T2 UEF


-- T2 UEF Plane Light DMG
SmallAirUnitSmokeTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2AircraftLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 UEF Plane Med DMG
SmallAirUnitFireTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT2AircraftMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT2AircraftMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT2AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T2 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT2AircraftHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT2AircraftHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT2AircraftHeavyDmgSmokeTrailCarry.bp',
}


-- T3 UEF


-- T3 UEF Plane Light DMG
SmallAirUnitSmokeTECH3UEF = { 
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 UEF Plane Med DMG
SmallAirUnitFireTECH3UEF = { 
    ModPathDmgFX .. 'UEFT3AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT3AircraftMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT3AircraftMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT3AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T3 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH3UEF = { 
    ModPathDmgFX .. 'UEFT3AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT3AircraftHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT3AircraftHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT3AircraftHeavyDmgSmokeTrailCarry.bp',
}



-- UEF Air DMG FX  
-- Cybran Air DMG FX 


-- T1 Cybran


-- T1 Cybran Plane Light DMG
SmallAirUnitSmokeTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1AircraftLightDmgFire.bp',
}

-- T1 Cybran Plane Med DMG
SmallAirUnitFireTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT1AircraftMediumDmgSmokeTrail.bp',
}

-- T1 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT1AircraftHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT1AircraftHeavyDmgSmokeTrail.bp',
}


-- T2 Cybran


-- T2 Cybran Plane Light DMG
SmallAirUnitSmokeTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2AircraftLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'CybranT2AircraftLightDmgFire.bp',
}

-- T2 Cybran Plane Med DMG
SmallAirUnitFireTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT2AircraftMediumDmgSmokeTrail.bp',
}

-- T2 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT2AircraftHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT2AircraftHeavyDmgSmokeTrail.bp',
}


-- T3 Cybran


-- T3 Cybran Plane Light DMG
SmallAirUnitSmokeTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3AircraftLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'CybranT3AircraftLightDmgFire.bp',
}

-- T3 Cybran Plane Med DMG
SmallAirUnitFireTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT3AircraftMediumDmgSmokeTrail.bp',
}

-- T3 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT3AircraftHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT3AircraftHeavyDmgSmokeTrail.bp',
}



-- Cybran Air DMG FX  
-- Aeon Air DMG FX 


-- T1 Aeon


-- T1 Aeon Plane Light DMG
SmallAirUnitSmokeTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1AircraftLightDmgSmokeTrail.bp',
}

-- T1 Aeon Plane Med DMG
SmallAirUnitFireTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT1AircraftMediumDmgSmokeTrail.bp',
}

-- T1 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT1AircraftHeavyDmgSmokeTrail.bp',
}


-- T2 Aeon


-- T2 Aeon Plane Light DMG
SmallAirUnitSmokeTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2AircraftLightDmgSmokeTrail.bp',
}

-- T2 Aeon Plane Med DMG
SmallAirUnitFireTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT2AircraftMediumDmgSmokeTrail.bp',
}

-- T2 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT2AircraftHeavyDmgSmokeTrail.bp',
}


-- T3 Aeon


-- T3 Aeon Plane Light DMG
SmallAirUnitSmokeTECH3AEON = { 
    --ModPathDmgFX .. 'AeonT3AircraftLightDmgSmokeTrail.bp',
}

-- T3 Aeon Plane Med DMG
SmallAirUnitFireTECH3AEON = { 
    ModPathDmgFX .. 'AeonT3AircraftMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT3AircraftMediumDmgSmokeTrail.bp',
}

-- T3 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH3AEON = { 
    ModPathDmgFX .. 'AeonT3AircraftHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT3AircraftHeavyDmgSmokeTrail.bp',
}



-- Aeon Air DMG FX  
-- Sera Air DMG FX  


-- T1 Sera


-- T1 Sera Plane Light DMG
SmallAirUnitSmokeTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT1LightDmgSmokeTrail.bp',
}

-- T1 Sera Plane Med DMG
SmallAirUnitFireTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT1MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraAircraftT1MediumDmgSmokeTrail.bp',
}

-- T1 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT1HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraAircraftT1HeavyDmgSmokeTrail.bp',
}


-- T2 Sera


-- T2 Sera Plane Light DMG
SmallAirUnitSmokeTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT2LightDmgSmokeTrail.bp',
}

-- T2 Sera Plane Med DMG
SmallAirUnitFireTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT2MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraAircraftT2MediumDmgSmokeTrail.bp',
}

-- T2 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT2HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraAircraftT2HeavyDmgSmokeTrail.bp',
}


-- T3 Sera


-- T3 Sera Plane Light DMG
SmallAirUnitSmokeTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT3LightDmgSmokeTrail.bp',
}

-- T3 Sera Plane Med DMG
SmallAirUnitFireTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT3MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraAircraftT3MediumDmgSmokeTrail.bp',
}

-- T3 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraAircraftT3HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraAircraftT3HeavyDmgSmokeTrail.bp',
}



-- Sera Air DMG FX  
-- UEF Naval DMG FX  


-- T1 UEF


-- T1 UEF Ship Light DMG
LightNavalUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1ShipLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 UEF Ship Med DMG
MediumNavalUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT1ShipMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT1ShipMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT1ShipMediumDmgSmokeTrailCarry.bp',
}

-- T1 UEF Ship Hvy DMG
HeavyNavalUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT1ShipHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT1ShipHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT1ShipHeavyDmgSmokeTrailCarry.bp',
}


-- T2 UEF


-- T2 UEF Ship Light DMG
LightNavalUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2ShipLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 UEF Ship Med DMG
MediumNavalUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT2ShipMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT2ShipMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT2ShipMediumDmgSmokeTrailCarry.bp',
}

-- T2 UEF Ship Hvy DMG
HeavyNavalUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT2ShipHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT2ShipHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT2ShipHeavyDmgSmokeTrailCarry.bp',
}


-- T3 UEF


-- T3 UEF Ship Light DMG
LightNavalUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 UEF Ship Med DMG
MediumNavalUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'UEFT3ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT3ShipMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT3ShipMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT3ShipMediumDmgSmokeTrailCarry.bp',
}

-- T3 UEF Ship Hvy DMG
HeavyNavalUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'UEFT3ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT3ShipHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT3ShipHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT3ShipHeavyDmgSmokeTrailCarry.bp',
}



-- UEF Naval DMG FX  
-- Cybran Naval DMG FX 


-- T1 Cybran


-- T1 Cybran Ship Light DMG
LightNavalUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1ShipLightDmgFire.bp',
}

-- T1 Cybran Ship Med DMG
MediumNavalUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT1ShipMediumDmgSmokeTrail.bp',
}

-- T1 Cybran Ship Hvy DMG
HeavyNavalUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT1ShipHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT1ShipHeavyDmgSmokeTrail.bp',
}


-- T2 Cybran


-- T2 Cybran Ship Light DMG
LightNavalUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2ShipLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'CybranT2ShipLightDmgFire.bp',
}

-- T2 Cybran Ship Med DMG
MediumNavalUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT2ShipMediumDmgSmokeTrail.bp',
}

-- T2 Cybran Ship Hvy DMG
HeavyNavalUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT2ShipHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT2ShipHeavyDmgSmokeTrail.bp',
}


-- T3 Cybran


-- T3 Cybran Ship Light DMG
LightNavalUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3ShipLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'CybranT3ShipLightDmgFire.bp',
}

-- T3 Cybran Ship Med DMG
MediumNavalUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT3ShipMediumDmgSmokeTrail.bp',
}

-- T3 Cybran Ship Hvy DMG
HeavyNavalUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT3ShipHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT3ShipHeavyDmgSmokeTrail.bp',
}



-- Cybran Naval DMG FX  
-- Aeon Naval DMG FX 


-- T1 Aeon


-- T1 Aeon Ship Light DMG
LightNavalUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1ShipLightDmgSmokeTrail.bp',
}

-- T1 Aeon Ship Med DMG
MediumNavalUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT1ShipMediumDmgSmokeTrail.bp',
}

-- T1 Aeon Ship Hvy DMG
HeavyNavalUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT1ShipHeavyDmgSmokeTrail.bp',
}


-- T2 Aeon


-- T2 Aeon Ship Light DMG
LightNavalUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2ShipLightDmgSmokeTrail.bp',
}

-- T2 Aeon Ship Med DMG
MediumNavalUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT2ShipMediumDmgSmokeTrail.bp',
}

-- T2 Aeon Ship Hvy DMG
HeavyNavalUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT2ShipHeavyDmgSmokeTrail.bp',
}


-- T3 Aeon


-- T3 Aeon Ship Light DMG
LightNavalUnitDmgTECH3AEON = { 
    --ModPathDmgFX .. 'AeonT3ShipLightDmgSmokeTrail.bp',
}

-- T3 Aeon Ship Med DMG
MediumNavalUnitDmgTECH3AEON = { 
    ModPathDmgFX .. 'AeonT3ShipMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT3ShipMediumDmgSmokeTrail.bp',
}

-- T3 Aeon Ship Hvy DMG
HeavyNavalUnitDmgTECH3AEON = { 
    ModPathDmgFX .. 'AeonT3ShipHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT3ShipHeavyDmgSmokeTrail.bp',
}



-- Aeon Naval DMG FX  
-- Sera Naval DMG FX  


-- T1 Sera


-- T1 Sera Ship Light DMG
LightNavalUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT1LightDmgSmokeTrail.bp',
}

-- T1 Sera Ship Med DMG
MediumNavalUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT1MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraShipT1MediumDmgSmokeTrail.bp',
}

-- T1 Sera Ship Hvy DMG
HeavyNavalUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT1HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraShipT1HeavyDmgSmokeTrail.bp',
}


-- T2 Sera


-- T2 Sera Ship Light DMG
LightNavalUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT2LightDmgSmokeTrail.bp',
}

-- T2 Sera Ship Med DMG
MediumNavalUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT2MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraShipT2MediumDmgSmokeTrail.bp',
}

-- T2 Sera Ship Hvy DMG
HeavyNavalUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT2HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraShipT2HeavyDmgSmokeTrail.bp',
}


-- T3 Sera


-- T3 Sera Ship Light DMG
LightNavalUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT3LightDmgSmokeTrail.bp',
}

-- T3 Sera Ship Med DMG
MediumNavalUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT3MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraShipT3MediumDmgSmokeTrail.bp',
}

-- T3 Sera Ship Hvy DMG
HeavyNavalUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraShipT3HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraShipT3HeavyDmgSmokeTrail.bp',
}



-- Sera Naval DMG FX 
-- UEF Structure DMG FX  


-- T1 UEF


-- T1 UEF Structure Light DMG
LightStructureUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1StructureLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 UEF Structure Med DMG
MediumStructureUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT1StructureMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT1StructureMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT1StructureMediumDmgSmokeTrailCarry.bp',
}

-- T1 UEF Structure Hvy DMG
HeavyStructureUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT1StructureHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT1StructureHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT1StructureHeavyDmgSmokeTrailCarry.bp',
}


-- T2 UEF


-- T2 UEF Structure Light DMG
LightStructureUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2StructureLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 UEF Structure Med DMG
MediumStructureUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT2StructureMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT2StructureMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT2StructureMediumDmgSmokeTrailCarry.bp',
}

-- T2 UEF Structure Hvy DMG
HeavyStructureUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT2StructureHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT2StructureHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT2StructureHeavyDmgSmokeTrailCarry.bp',
}


-- T3 UEF


-- T3 UEF Structure Light DMG
LightStructureUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 UEF Structure Med DMG
MediumStructureUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'UEFT3StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT3StructureMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT3StructureMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT3StructureMediumDmgSmokeTrailCarry.bp',
}

-- T3 UEF Structure Hvy DMG
HeavyStructureUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'UEFT3StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT3StructureHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT3StructureHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT3StructureHeavyDmgSmokeTrailCarry.bp',
}



-- UEF Structure DMG FX  
-- Cybran Structure DMG FX 


-- T1 Cybran


-- T1 Cybran Structure Light DMG
LightStructureUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1StructureLightDmgFire.bp',
}

-- T1 Cybran Structure Med DMG
MediumStructureUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT1StructureMediumDmgSmokeTrail.bp',
}

-- T1 Cybran Structure Hvy DMG
HeavyStructureUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT1StructureHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT1StructureHeavyDmgSmokeTrail.bp',
}


-- T2 Cybran


-- T2 Cybran Structure Light DMG
LightStructureUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2StructureLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'CybranT2StructureLightDmgFire.bp',
}

-- T2 Cybran Structure Med DMG
MediumStructureUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT2StructureMediumDmgSmokeTrail.bp',
}

-- T2 Cybran Structure Hvy DMG
HeavyStructureUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT2StructureHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT2StructureHeavyDmgSmokeTrail.bp',
}


-- T3 Cybran


-- T3 Cybran Structure Light DMG
LightStructureUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3StructureLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'CybranT3StructureLightDmgFire.bp',
}

-- T3 Cybran Structure Med DMG
MediumStructureUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT3StructureMediumDmgSmokeTrail.bp',
}

-- T3 Cybran Structure Hvy DMG
HeavyStructureUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT3StructureHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT3StructureHeavyDmgSmokeTrail.bp',
}



-- Cybran Structure DMG FX  
-- Aeon Structure DMG FX 


-- T1 Aeon


-- T1 Aeon Structure Light DMG
LightStructureUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1StructureLightDmgSmokeTrail.bp',
}

-- T1 Aeon Structure Med DMG
MediumStructureUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT1StructureMediumDmgSmokeTrail.bp',
}

-- T1 Aeon Structure Hvy DMG
HeavyStructureUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT1StructureHeavyDmgSmokeTrail.bp',
}


-- T2 Aeon


-- T2 Aeon Structure Light DMG
LightStructureUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2StructureLightDmgSmokeTrail.bp',
}

-- T2 Aeon Structure Med DMG
MediumStructureUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT2StructureMediumDmgSmokeTrail.bp',
}

-- T2 Aeon Structure Hvy DMG
HeavyStructureUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT2StructureHeavyDmgSmokeTrail.bp',
}


-- T3 Aeon


-- T3 Aeon Structure Light DMG
LightStructureUnitDmgTECH3AEON = { 
    --ModPathDmgFX .. 'AeonT3StructureLightDmgSmokeTrail.bp',
}

-- T3 Aeon Structure Med DMG
MediumStructureUnitDmgTECH3AEON = { 
    ModPathDmgFX .. 'AeonT3StructureMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT3StructureMediumDmgSmokeTrail.bp',
}

-- T3 Aeon Structure Hvy DMG
HeavyStructureUnitDmgTECH3AEON = { 
    ModPathDmgFX .. 'AeonT3StructureHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT3StructureHeavyDmgSmokeTrail.bp',
}



-- Aeon Structure DMG FX  
-- Sera Structure DMG FX  


-- T1 Sera


-- T1 Sera Structure Light DMG
LightStructureUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT1LightDmgSmokeTrail.bp',
}

-- T1 Sera Structure Med DMG
MediumStructureUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT1MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraStructureT1MediumDmgSmokeTrail.bp',
}

-- T1 Sera Structure Hvy DMG
HeavyStructureUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT1HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraStructureT1HeavyDmgSmokeTrail.bp',
}


-- T2 Sera


-- T2 Sera Structure Light DMG
LightStructureUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT2LightDmgSmokeTrail.bp',
}

-- T2 Sera Structure Med DMG
MediumStructureUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT2MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraStructureT2MediumDmgSmokeTrail.bp',
}

-- T2 Sera Structure Hvy DMG
HeavyStructureUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT2HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraStructureT2HeavyDmgSmokeTrail.bp',
}


-- T3 Sera


-- T3 Sera Structure Light DMG
LightStructureUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT3LightDmgSmokeTrail.bp',
}

-- T3 Sera Structure Med DMG
MediumStructureUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT3MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraStructureT3MediumDmgSmokeTrail.bp',
}

-- T3 Sera Structure Hvy DMG
HeavyStructureUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraStructureT3HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraStructureT3HeavyDmgSmokeTrail.bp',
}



-- Sera Structure DMG FX  
-- UEF Land DMG FX  


-- T1 UEF


-- T1 UEF Land Light DMG
LightLandUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1LandLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 UEF Land Med DMG
MediumLandUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1LandMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT1LandMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT1LandMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT1LandMediumDmgSmokeTrailCarry.bp',
}

-- T1 UEF Land Hvy DMG
HeavyLandUnitDmgTECH1UEF = { 
    ModPathDmgFX .. 'UEFT1LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT1LandHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT1LandHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT1LandHeavyDmgSmokeTrailCarry.bp',
}


-- T2 UEF


-- T2 UEF Land Light DMG
LightLandUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2LandLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 UEF Land Med DMG
MediumLandUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2LandMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT2LandMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT2LandMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT2LandMediumDmgSmokeTrailCarry.bp',
}

-- T2 UEF Land Hvy DMG
HeavyLandUnitDmgTECH2UEF = { 
    ModPathDmgFX .. 'UEFT2LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT2LandHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT2LandHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT2LandHeavyDmgSmokeTrailCarry.bp',
}


-- T3 UEF


-- T3 UEF Land Light DMG
LightLandUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 UEF Land Med DMG
MediumLandUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'UEFT3LandMediumDmgFire.bp',
    ModPathDmgFX .. 'UEFT3LandMediumDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT3LandMediumDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT3LandMediumDmgSmokeTrailCarry.bp',
}

-- T3 UEF Land Hvy DMG
HeavyLandUnitDmgTECH3UEF = { 
    ModPathDmgFX .. 'UEFT3LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'UEFT3LandHeavyDmgHeatDistort.bp',
    ModPathDmgFX .. 'UEFT3LandHeavyDmgSmokeTrail.bp',
    ModPathDmgFX .. 'UEFT3LandHeavyDmgSmokeTrailCarry.bp',
}



-- UEF Land DMG FX  
-- Cybran Land DMG FX 


-- T1 Cybran


-- T1 Cybran Land Light DMG
LightLandUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1LandLightDmgFire.bp',
}

-- T1 Cybran Land Med DMG
MediumLandUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1LandMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT1LandMediumDmgSmokeTrail.bp',
}

-- T1 Cybran Land Hvy DMG
HeavyLandUnitDmgTECH1CYBRAN = { 
    ModPathDmgFX .. 'CybranT1LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT1LandHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT1LandHeavyDmgSmokeTrail.bp',
}


-- T2 Cybran


-- T2 Cybran Land Light DMG
LightLandUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2LandLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'CybranT2LandLightDmgFire.bp',
}

-- T2 Cybran Land Med DMG
MediumLandUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2LandMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT2LandMediumDmgSmokeTrail.bp',
}

-- T2 Cybran Land Hvy DMG
HeavyLandUnitDmgTECH2CYBRAN = { 
    ModPathDmgFX .. 'CybranT2LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT2LandHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT2LandHeavyDmgSmokeTrail.bp',
}


-- T3 Cybran


-- T3 Cybran Land Light DMG
LightLandUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3LandLightDmgSmokeTrail.bp',
    ModPathDmgFX .. 'CybranT3LandLightDmgFire.bp',
}

-- T3 Cybran Land Med DMG
MediumLandUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3LandMediumDmgFire.bp',
    ModPathDmgFX .. 'CybranT3LandMediumDmgSmokeTrail.bp',
}

-- T3 Cybran Land Hvy DMG
HeavyLandUnitDmgTECH3CYBRAN = { 
    ModPathDmgFX .. 'CybranT3LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'CybranT3LandHeavyDmgFire2.bp',
    ModPathDmgFX .. 'CybranT3LandHeavyDmgSmokeTrail.bp',
}



-- Cybran Land DMG FX  
-- Aeon Land DMG FX 


-- T1 Aeon


-- T1 Aeon Land Light DMG
LightLandUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1LandLightDmgSmokeTrail.bp',
}

-- T1 Aeon Land Med DMG
MediumLandUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1LandMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT1LandMediumDmgSmokeTrail.bp',
}

-- T1 Aeon Land Hvy DMG
HeavyLandUnitDmgTECH1AEON = { 
    ModPathDmgFX .. 'AeonT1LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT1LandHeavyDmgSmokeTrail.bp',
}


-- T2 Aeon


-- T2 Aeon Land Light DMG
LightLandUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2LandLightDmgSmokeTrail.bp',
}

-- T2 Aeon Land Med DMG
MediumLandUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2LandMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT2LandMediumDmgSmokeTrail.bp',
}

-- T2 Aeon Land Hvy DMG
HeavyLandUnitDmgTECH2AEON = { 
    ModPathDmgFX .. 'AeonT2LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT2LandHeavyDmgSmokeTrail.bp',
}


-- T3 Aeon


-- T3 Aeon Land Light DMG
LightLandUnitDmgTECH3AEON = { 
    --ModPathDmgFX .. 'AeonT3LandLightDmgSmokeTrail.bp',
}

-- T3 Aeon Land Med DMG
MediumLandUnitDmgTECH3AEON = { 
    ModPathDmgFX .. 'AeonT3LandMediumDmgFire.bp',
    ModPathDmgFX .. 'AeonT3LandMediumDmgSmokeTrail.bp',
}

-- T3 Aeon Land Hvy DMG
HeavyLandUnitDmgTECH3AEON = { 
    ModPathDmgFX .. 'AeonT3LandHeavyDmgFire.bp',
    ModPathDmgFX .. 'AeonT3LandHeavyDmgSmokeTrail.bp',
}



-- Aeon Land DMG FX  
-- Sera Land DMG FX  


-- T1 Sera


-- T1 Sera Land Light DMG
LightLandUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT1LightDmgSmokeTrail.bp',
}

-- T1 Sera Land Med DMG
MediumLandUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT1MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraLandT1MediumDmgSmokeTrail.bp',
}

-- T1 Sera Land Hvy DMG
HeavyLandUnitDmgTECH1SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT1HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraLandT1HeavyDmgSmokeTrail.bp',
}


-- T2 Sera


-- T2 Sera Land Light DMG
LightLandUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT2LightDmgSmokeTrail.bp',
}

-- T2 Sera Land Med DMG
MediumLandUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT2MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraLandT2MediumDmgSmokeTrail.bp',
}

-- T2 Sera Land Hvy DMG
HeavyLandUnitDmgTECH2SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT2HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraLandT2HeavyDmgSmokeTrail.bp',
}


-- T3 Sera


-- T3 Sera Land Light DMG
LightLandUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT3LightDmgSmokeTrail.bp',
}

-- T3 Sera Land Med DMG
MediumLandUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT3MediumDmgFire.bp',
    ModPathDmgFX .. 'SeraLandT3MediumDmgSmokeTrail.bp',
}

-- T3 Sera Land Hvy DMG
HeavyLandUnitDmgTECH3SERAPHIM = { 
    ModPathDmgFX .. 'SeraLandT3HeavyDmgFire.bp',
    ModPathDmgFX .. 'SeraLandT3HeavyDmgSmokeTrail.bp',
}



-- Sera Land DMG FX 



------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------NOMADS STUFF IS BELOW
------------------------------------------------------------------------------------------------------------------ 

 
-- LAND BOOMS 

-- T1 NOMADS Unit Boom
ExplosionTECH1NOMADS = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_random.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'SDantimatter_ring_01_emit.bp',
    ModPath .. 'SDantimatter_ring_02_emit.bp',
    ModPath .. 'small_UEF_test_fire.bp',
}

-- T2 NOMADS Unit Boom
ExplosionTECH2NOMADS = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_random.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    ModPath .. 'SDantimatter_ring_01_emit.bp',
    ModPath .. 'SDantimatter_ring_02_emit.bp',
    --ModPath .. 'UEF_Outward_Spark_Small.bp',
    ModPath .. 'small_UEF_test_fire.bp',
}

-- T3 NOMADS Unit Boom
ExplosionTECH3NOMADS = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'UEFMedium_test_smokeT3.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    ModPath .. 'SDantimatter_ring_03_Land.bp',
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'UEF_Outward_Spark.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}



-- LAND BOOMS 
-- AIR BOOMS 

-- T1 NOMADS Air Unit Boom
AirExplosionTECH1NOMADS = {             
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    --ModPath .. 'SDantimatter_ring_01_air.bp',
}

-- T2 NOMADS Air Unit Boom
AirExplosionTECH2NOMADS = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit_air.bp', 
    ModPath .. 'SDantimatter_ring_03_Land.bp',
}

-- T3 NOMADS Air Unit Boom
AirExplosionTECH3NOMADS = {
    --ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit_air.bp', 
    ModPath .. 'SDantimatter_ring_01_air.bp',
    ModPath .. 'UEF_Outward_Spark_Air.bp', 
}



-- AIR BOOMS
-- BUILDING BOOMS 

-- T1 NOMADS Building Unit Boom
BuildingExplosionTECH1NOMADS = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --ModPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}

-- T2 NOMADS Building Unit Boom
BuildingExplosionTECH2NOMADS = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --ModPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'SDantimatter_ring_03_Land.bp',
}

-- T3 NOMADS Building Unit Boom
BuildingExplosionTECH3NOMADS = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    --ModPath .. 'SDantimatter_ring_01_building.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'UEF_Outward_Spark_Building.bp',
    ModPath .. 'SDantimatter_ring_03_Land.bp',
    
}



-- BUILDING BOOMS
-- FALLDOWN FX

-- T1 NOMADS Plane Fall Down
FallDownTrailTECH1NOMADS = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

-- T2 NOMADS Plane Fall Down
FallDownTrailTECH2NOMADS = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

-- T3 NOMADS Plane Fall Down
FallDownTrailTECH3NOMADS = { 
    ModPath .. 'AircraftFallDownFireball.bp',
    ModPath .. 'AircraftFallDownSmokeTrail.bp',
}



-- FALLDOWN FX 
-- Ship Sub-Booms (Above water)

-- NOMADS T1 Ship Sub-Boom
ShipSubExplTECH1NOMADS = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
}

-- NOMADS T2 Ship Sub-Boom
ShipSubExplTECH2NOMADS = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp',
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp',
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'SDantimatter_ring_03_Land.bp',
}

-- NOMADS T3 Ship Sub-Boom
ShipSubExplTECH3NOMADS = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp', 
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp', 
    ModPath .. 'small_UEF_test_fire_T3.bp',
    ModPath .. 'UEF_Outward_Spark_Building.bp', 
    ModPath .. 'SDantimatter_ring_03_Land.bp',
}



-- Ship Sub-Booms (Above water) 
-- Ship Sub-Booms (Below water)

-- NOMADS T1 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH1NOMADS = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}

-- NOMADS T2 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH2NOMADS = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}

-- NOMADS T3 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH3NOMADS = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
}



-- Ship Sub-Booms (Below Water) 
-- Sub Booms (surface)

-- NOMADS Sub Boom (Surface)
SubExplosionAboveWaterNOMADS = {
    ModPath .. 'UEFMedium_test_smoke.bp',
    ModPath .. 'UEFSmallMedium_test_random.bp',
    ModPath .. 'UEFSmallMedium_test_sonic.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp', 
    ModPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp', 
    ModPath .. 'small_UEF_test_fire_T3.bp', 
}



-- Sub Booms (Surface)
-- Sub Booms (Underwater)

-- NOMADS Sub Boom (Underwater)
SubExplosionUnderWaterNOMADS = {
    ModPath .. 'UEF_Underwater_Fire_T1.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}



-- Sub Booms (Underwater)



-- DEBRIS

NOMADSFlamingDebrisLandImpact = {
    ModPath .. 'dust_emit.bp',            
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
    --ModPath .. 'UEFDebrisImpactResidueFire.bp', 
    --ModPath .. 'UEFDebrisImpactResidueSmoke.bp', 
}

NOMADSFlamingDebrisTrail = {
    ModPath .. 'UEFFlamingDebrisFire.bp',
    ModPath .. 'UEFFlamingDebrisSmoke.bp',
}



-- DAMAGE FX


-- NOMADS Air DMG FX 


-- T1 NOMADS


-- T1 NOMADS Plane Light DMG
SmallAirUnitSmokeTECH1NOMADS = { 
    ModPath .. 'UEFT1AircraftLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 NOMADS Plane Med DMG
SmallAirUnitFireTECH1NOMADS = { 
    ModPath .. 'UEFT1AircraftMediumDmgFire.bp',
    ModPath .. 'UEFT1AircraftMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT1AircraftMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT1AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T1 NOMADS Plane Hvy DMG
BigAirUnitFireSmokeTECH1NOMADS = { 
    ModPath .. 'UEFT1AircraftHeavyDmgFire.bp',
    ModPath .. 'UEFT1AircraftHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT1AircraftHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT1AircraftHeavyDmgSmokeTrailCarry.bp',
}


-- T2 NOMADS


-- T2 NOMADS Plane Light DMG
SmallAirUnitSmokeTECH2NOMADS = { 
    ModPath .. 'UEFT2AircraftLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 NOMADS Plane Med DMG
SmallAirUnitFireTECH2NOMADS = { 
    ModPath .. 'UEFT2AircraftMediumDmgFire.bp',
    ModPath .. 'UEFT2AircraftMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT2AircraftMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT2AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T2 NOMADS Plane Hvy DMG
BigAirUnitFireSmokeTECH2NOMADS = { 
    ModPath .. 'UEFT2AircraftHeavyDmgFire.bp',
    ModPath .. 'UEFT2AircraftHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT2AircraftHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT2AircraftHeavyDmgSmokeTrailCarry.bp',
}


-- T3 NOMADS


-- T3 NOMADS Plane Light DMG
SmallAirUnitSmokeTECH3NOMADS = { 
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 NOMADS Plane Med DMG
SmallAirUnitFireTECH3NOMADS = { 
    ModPath .. 'UEFT3AircraftMediumDmgFire.bp',
    ModPath .. 'UEFT3AircraftMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT3AircraftMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT3AircraftMediumDmgSmokeTrailCarry.bp',
}

-- T3 NOMADS Plane Hvy DMG
BigAirUnitFireSmokeTECH3NOMADS = { 
    ModPath .. 'UEFT3AircraftHeavyDmgFire.bp',
    ModPath .. 'UEFT3AircraftHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT3AircraftHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT3AircraftHeavyDmgSmokeTrailCarry.bp',
}



-- NOMADS Air DMG FX  
-- NOMADS Naval DMG FX  


-- T1 NOMADS


-- T1 NOMADS Ship Light DMG
LightNavalUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1ShipLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 NOMADS Ship Med DMG
MediumNavalUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1ShipMediumDmgFire.bp',
    ModPath .. 'UEFT1ShipMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT1ShipMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT1ShipMediumDmgSmokeTrailCarry.bp',
}

-- T1 NOMADS Ship Hvy DMG
HeavyNavalUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1ShipHeavyDmgFire.bp',
    ModPath .. 'UEFT1ShipHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT1ShipHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT1ShipHeavyDmgSmokeTrailCarry.bp',
}


-- T2 NOMADS


-- T2 NOMADS Ship Light DMG
LightNavalUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2ShipLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 NOMADS Ship Med DMG
MediumNavalUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2ShipMediumDmgFire.bp',
    ModPath .. 'UEFT2ShipMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT2ShipMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT2ShipMediumDmgSmokeTrailCarry.bp',
}

-- T2 NOMADS Ship Hvy DMG
HeavyNavalUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2ShipHeavyDmgFire.bp',
    ModPath .. 'UEFT2ShipHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT2ShipHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT2ShipHeavyDmgSmokeTrailCarry.bp',
}


-- T3 NOMADS


-- T3 NOMADS Ship Light DMG
LightNavalUnitDmgTECH3NOMADS = { 
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 NOMADS Ship Med DMG
MediumNavalUnitDmgTECH3NOMADS = { 
    ModPath .. 'UEFT3ShipMediumDmgFire.bp',
    ModPath .. 'UEFT3ShipMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT3ShipMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT3ShipMediumDmgSmokeTrailCarry.bp',
}

-- T3 NOMADS Ship Hvy DMG
HeavyNavalUnitDmgTECH3NOMADS = { 
    ModPath .. 'UEFT3ShipHeavyDmgFire.bp',
    ModPath .. 'UEFT3ShipHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT3ShipHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT3ShipHeavyDmgSmokeTrailCarry.bp',
}



-- NOMADS Naval DMG FX  
-- NOMADS Structure DMG FX  


-- T1 NOMADS


-- T1 NOMADS Structure Light DMG
LightStructureUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1StructureLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 NOMADS Structure Med DMG
MediumStructureUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1StructureMediumDmgFire.bp',
    ModPath .. 'UEFT1StructureMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT1StructureMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT1StructureMediumDmgSmokeTrailCarry.bp',
}

-- T1 NOMADS Structure Hvy DMG
HeavyStructureUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1StructureHeavyDmgFire.bp',
    ModPath .. 'UEFT1StructureHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT1StructureHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT1StructureHeavyDmgSmokeTrailCarry.bp',
}


-- T2 NOMADS


-- T2 NOMADS Structure Light DMG
LightStructureUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2StructureLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 NOMADS Structure Med DMG
MediumStructureUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2StructureMediumDmgFire.bp',
    ModPath .. 'UEFT2StructureMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT2StructureMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT2StructureMediumDmgSmokeTrailCarry.bp',
}

-- T2 NOMADS Structure Hvy DMG
HeavyStructureUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2StructureHeavyDmgFire.bp',
    ModPath .. 'UEFT2StructureHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT2StructureHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT2StructureHeavyDmgSmokeTrailCarry.bp',
}


-- T3 NOMADS


-- T3 NOMADS Structure Light DMG
LightStructureUnitDmgTECH3NOMADS = { 
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 NOMADS Structure Med DMG
MediumStructureUnitDmgTECH3NOMADS = { 
    ModPath .. 'UEFT3StructureMediumDmgFire.bp',
    ModPath .. 'UEFT3StructureMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT3StructureMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT3StructureMediumDmgSmokeTrailCarry.bp',
}

-- T3 NOMADS Structure Hvy DMG
HeavyStructureUnitDmgTECH3NOMADS = { 
    ModPath .. 'UEFT3StructureHeavyDmgFire.bp',
    ModPath .. 'UEFT3StructureHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT3StructureHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT3StructureHeavyDmgSmokeTrailCarry.bp',
}



-- NOMADS Structure DMG FX  
-- NOMADS Land DMG FX  


-- T1 NOMADS


-- T1 NOMADS Land Light DMG
LightLandUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1LandLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T1 NOMADS Land Med DMG
MediumLandUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1LandMediumDmgFire.bp',
    ModPath .. 'UEFT1LandMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT1LandMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT1LandMediumDmgSmokeTrailCarry.bp',
}

-- T1 NOMADS Land Hvy DMG
HeavyLandUnitDmgTECH1NOMADS = { 
    ModPath .. 'UEFT1LandHeavyDmgFire.bp',
    ModPath .. 'UEFT1LandHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT1LandHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT1LandHeavyDmgSmokeTrailCarry.bp',
}


-- T2 NOMADS


-- T2 NOMADS Land Light DMG
LightLandUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2LandLightDmgSmokeTrail.bp',
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T2 NOMADS Land Med DMG
MediumLandUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2LandMediumDmgFire.bp',
    ModPath .. 'UEFT2LandMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT2LandMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT2LandMediumDmgSmokeTrailCarry.bp',
}

-- T2 NOMADS Land Hvy DMG
HeavyLandUnitDmgTECH2NOMADS = { 
    ModPath .. 'UEFT2LandHeavyDmgFire.bp',
    ModPath .. 'UEFT2LandHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT2LandHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT2LandHeavyDmgSmokeTrailCarry.bp',
}


-- T3 NOMADS


-- T3 NOMADS Land Light DMG
LightLandUnitDmgTECH3NOMADS = { 
    ModPath .. 'destruction_damaged_sparks_rks.bp',
}

-- T3 NOMADS Land Med DMG
MediumLandUnitDmgTECH3NOMADS = { 
    ModPath .. 'UEFT3LandMediumDmgFire.bp',
    ModPath .. 'UEFT3LandMediumDmgHeatDistort.bp',
    ModPath .. 'UEFT3LandMediumDmgSmokeTrail.bp',
    ModPath .. 'UEFT3LandMediumDmgSmokeTrailCarry.bp',
}

-- T3 NOMADS Land Hvy DMG
HeavyLandUnitDmgTECH3NOMADS = { 
    ModPath .. 'UEFT3LandHeavyDmgFire.bp',
    ModPath .. 'UEFT3LandHeavyDmgHeatDistort.bp',
    ModPath .. 'UEFT3LandHeavyDmgSmokeTrail.bp',
    ModPath .. 'UEFT3LandHeavyDmgSmokeTrailCarry.bp',
}



-- Nomads Land DMG FX  



-- AddNothing Boom
AddNothing = {}



-- EASTER EGGS
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
