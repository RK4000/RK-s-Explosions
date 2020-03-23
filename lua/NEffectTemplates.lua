--#****************************************************************************
--#**
--#**  File     :  NEffectTemplates
--#**  Author(s):  RK4000
--#**
--#**  Summary  :  Generic templates for default looking effects when disabling the explosions mod.
--#**
--#**  Copyright © 2014 RK Powered Games, Inc.  All rights reserved.
--#****************************************************************************
local ModPath = '/mods/rks_explosions/effects/emitters/stock/'
local ModPathrk = '/mods/rks_explosions/effects/emitters/'

-- WEAPON EXPLOSIONS
T2RocketBotMissileHitGround = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp',
}

T2RocketBotMissileHit = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp',
}
AeonRestorerMissileHit01 = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- HUGE EXP. EXPLOSIONS
ExplosionSmallest = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp', 
}
ExplosionSmaller = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp', 
}
ExplosionSmall = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'Medium_test_smoke.bp',
    ModPath .. 'Medium_test_fire.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}
ExplosionSmallSD = {
    --ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    --ModPath .. 'small_test_smoke.bp',
}

ExplosionMediumSD = {
    --ModPath .. 'Medium_test_smoke.bp',
    ModPath .. 'small_test_fire.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

ExplosionLargeShortDurSmoke = {
    ModPath .. 'Medium_test_smoke.bp',
    ModPath .. 'small_test_fire.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}
ExplosionVeryLarge = {
    ModPath .. 'Medium_test_smoke.bp',
    ModPath .. 'Medium_test_fire.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}
ExplosionVeryLargeShortDurSmoke = {
    ModPath .. 'Medium_test_smoke.bp',
    ModPath .. 'Medium_test_fire.bp',
    --ModPath .. 'Medium_test_sonic.bp',
} 

LuXy_Heart = {
    ModPath .. 'FluffyHeart.bp',
    --ModPath .. 'Fluffy_Heart_Smoke.bp',
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
-- OTHER FX
-- LAND BOOMS 

-- T1 UEF Unit Boom
ExplosionTECH1UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',    
}

-- T2 UEF Unit Boom
ExplosionTECH2UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 UEF Unit Boom
ExplosionTECH3UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Cyb Unit Boom
ExplosionTECH1CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Cyb Unit Boom
ExplosionTECH2CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Cyb Unit Boom
ExplosionTECH3CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Aeon Unit Boom
ExplosionTECH1AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Aeon Unit Boom
ExplosionTECH2AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Aeon Unit Boom
ExplosionTECH3AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Sera Unit Boom
ExplosionTECH1SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Sera Unit Boom
ExplosionTECH2SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Sera Unit Boom
ExplosionTECH3SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}



-- LAND BOOMS
-- AIR BOOMS 

-- T1 UEF Air Unit Boom
AirExplosionTECH1UEF = {         
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 UEF Air Unit Boom
AirExplosionTECH2UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 UEF Air Unit Boom
AirExplosionTECH3UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Cyb Air Unit Boom
AirExplosionTECH1CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Cyb Air Unit Boom
AirExplosionTECH2CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Cyb Air Unit Boom
AirExplosionTECH3CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Aeon Air Unit Boom
AirExplosionTECH1AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Aeon Air Unit Boom
AirExplosionTECH2AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Aeon Air Unit Boom
AirExplosionTECH3AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Sera Air Unit Boom
AirExplosionTECH1SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Sera Air Unit Boom
AirExplosionTECH2SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Sera Air Unit Boom
AirExplosionTECH3SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}



-- AIR BOOMS
-- BUILDING BOOMS 

-- T1 UEF Building Unit Boom
BuildingExplosionTECH1UEF = {         
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',   
}

-- T2 UEF Building Unit Boom
BuildingExplosionTECH2UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 UEF Building Unit Boom
BuildingExplosionTECH3UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Cyb Building Unit Boom
BuildingExplosionTECH1CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Cyb Building Unit Boom
BuildingExplosionTECH2CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Cyb Building Unit Boom
BuildingExplosionTECH3CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Aeon Building Unit Boom
BuildingExplosionTECH1AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Aeon Building Unit Boom
BuildingExplosionTECH2AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Aeon Building Unit Boom
BuildingExplosionTECH3AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T1 Sera Building Unit Boom
BuildingExplosionTECH1SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 Sera Building Unit Boom
BuildingExplosionTECH2SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 Sera Building Unit Boom
BuildingExplosionTECH3SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}



-- BUILDING BOOMS
-- FALLDOWN FX

-- T1 UEF Plane Fall Down
FallDownTrailTECH1UEF = {}

-- T2 UEF Plane Fall Down
FallDownTrailTECH2UEF = {}

-- T3 UEF Plane Fall Down
FallDownTrailTECH3UEF = {}

-- T1 Cybran Plane Fall Down
FallDownTrailTECH1CYBRAN = {}

-- T2 Cybran Plane Fall Down
FallDownTrailTECH2CYBRAN = {}

-- T3 Cybran Plane Fall Down
FallDownTrailTECH3CYBRAN = {}

-- T1 Aeon Plane Fall Down
FallDownTrailTECH1AEON = {}

-- T2 Aeon Plane Fall Down
FallDownTrailTECH2AEON = {}

-- T3 Aeon Plane Fall Down
FallDownTrailTECH3AEON = {}

-- T1 Sera Plane Fall Down
FallDownTrailTECH1SERAPHIM = {}

-- T2 Sera Plane Fall Down
FallDownTrailTECH2SERAPHIM = {}

-- T3 Sera Plane Fall Down
FallDownTrailTECH3SERAPHIM = {}



-- FALLDOWN FX
-- LIGHT AIR DMG FX 

-- T1 UEF Plane Light DMG
SmallAirUnitSmokeTECH1UEF = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T2 UEF Plane Light DMG
SmallAirUnitSmokeTECH2UEF = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T3 UEF Plane Light DMG
SmallAirUnitSmokeTECH3UEF = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T1 Cybran Plane Light DMG
SmallAirUnitSmokeTECH1CYBRAN = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T2 Cybran Plane Light DMG
SmallAirUnitSmokeTECH2CYBRAN = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T3 Cybran Plane Light DMG
SmallAirUnitSmokeTECH3CYBRAN = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T1 Aeon Plane Light DMG
SmallAirUnitSmokeTECH1AEON = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T2 Aeon Plane Light DMG
SmallAirUnitSmokeTECH2AEON = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T3 Aeon Plane Light DMG
SmallAirUnitSmokeTECH3AEON = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T1 Sera Plane Light DMG
SmallAirUnitSmokeTECH1SERAPHIM = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T2 Sera Plane Light DMG
SmallAirUnitSmokeTECH2SERAPHIM = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T3 Sera Plane Light DMG
SmallAirUnitSmokeTECH3SERAPHIM = { 
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}



-- LIGHT AIR DMG FX
-- MED AIR DMG FX 

-- T1 UEF Plane Med DMG
SmallAirUnitFireTECH1UEF = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T2 UEF Plane Med DMG
SmallAirUnitFireTECH2UEF = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T3 UEF Plane Med DMG
SmallAirUnitFireTECH3UEF = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T1 Cybran Plane Med DMG
SmallAirUnitFireTECH1CYBRAN = { 
    ModPath .. 'AircraftDamageFireSmall01.bp',
    ModPath .. 'AircraftDamageSmoke01.bp',
}

-- T2 Cybran Plane Med DMG
SmallAirUnitFireTECH2CYBRAN = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T3 Cybran Plane Med DMG
SmallAirUnitFireTECH3CYBRAN = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T1 Aeon Plane Med DMG
SmallAirUnitFireTECH1AEON = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T2 Aeon Plane Med DMG
SmallAirUnitFireTECH2AEON = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T3 Aeon Plane Med DMG
SmallAirUnitFireTECH3AEON = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T1 Sera Plane Med DMG
SmallAirUnitFireTECH1SERAPHIM = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T2 Sera Plane Med DMG
SmallAirUnitFireTECH2SERAPHIM = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}

-- T3 Sera Plane Med DMG
SmallAirUnitFireTECH3SERAPHIM = { 
    ModPathrk .. 'AircraftDamageFireSmall01.bp',
    ModPathrk .. 'AircraftDamageSmoke01.bp',
}



-- MED AIR DMG FX
-- HVY AIR DMG FX 

-- T1 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH1UEF = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T2 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH2UEF = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T3 UEF Plane Hvy DMG
BigAirUnitFireSmokeTECH3UEF = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T1 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH1CYBRAN = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T2 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH2CYBRAN = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T3 Cybran Plane Hvy DMG
BigAirUnitFireSmokeTECH3CYBRAN = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T1 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH1AEON = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T2 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH2AEON = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T3 Aeon Plane Hvy DMG
BigAirUnitFireSmokeTECH3AEON = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T1 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH1SERAPHIM = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T2 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH2SERAPHIM = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}

-- T3 Sera Plane Hvy DMG
BigAirUnitFireSmokeTECH3SERAPHIM = { 
    ModPathrk .. 'AircraftDamageFireBig01.bp',
    ModPathrk .. 'AircraftDamageSmokeBig01.bp',
}



-- HVY AIR DMG FX 
-- Ship Sub-Booms 

-- UEF T1 Ship Sub-Boom
ShipSubExplTECH1UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',   
}

-- UEF T2 Ship Sub-Boom
ShipSubExplTECH2UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- UEF T3 Ship Sub-Boom
ShipSubExplTECH3UEF = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Cyb T1 Ship Sub-Boom
ShipSubExplTECH1CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Cyb T2 Ship Sub-Boom
ShipSubExplTECH2CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Cyb T3 Ship Sub-Boom
ShipSubExplTECH3CYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Aeon T1 Ship Sub-Boom
ShipSubExplTECH1AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Aeon T2 Ship Sub-Boom
ShipSubExplTECH2AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Aeon T3 Ship Sub-Boom
ShipSubExplTECH3AEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Sera T1 Ship Sub-Boom
ShipSubExplTECH1SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Sera T2 Ship Sub-Boom
ShipSubExplTECH2SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Sera T3 Ship Sub-Boom
ShipSubExplTECH3SERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
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
    ModPath .. 'AeonT3_aura_underwater.bp',
}

-- Aeon T2 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH2AEON = {
    ModPath .. 'AeonT3_aura_underwater.bp',
}

-- Aeon T3 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH3AEON = {
    ModPath .. 'AeonT3_aura_underwater.bp',
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
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Cybran Sub Boom (Surface)
SubExplosionAboveWaterCYBRAN = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Aeon Sub Boom (Surface)
SubExplosionAboveWaterAEON = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Sera Sub Boom (Surface)
SubExplosionAboveWaterSERAPHIM = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}



-- Sub Booms (Surface)
-- Sub Booms (Underwater)

-- UEF Sub Boom (Underwater)
SubExplosionUnderWaterUEF = {
    ModPathrk .. 'UEF_Underwater_Fire_T1.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Cybran Sub Boom (Underwater)
SubExplosionUnderWaterCYBRAN = {
    ModPathrk  .. 'CybT3_Underwater_charge.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Aeon Sub Boom (Underwater)
SubExplosionUnderWaterAEON = {
    ModPathrk  .. 'AeonT3_aura_underwater.bp',
    --ModPath .. 'Medium_test_sonic.bp',
}

-- Sera Sub Boom (Underwater)
SubExplosionUnderWaterSERAPHIM = {
    ModPathrk  .. 'Seraphim_underwater_spark_T3.bp',
    ModPathrk  .. 'Sera_T3_chargering_underwater.bp',
}



-- Sub Booms (Underwater)
-- EXP BOOMS (Cyb)

-- Cyb Generic Experimental Small Boom
ExplosionEXPSmallCybran = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Cyb Generic Experimental Medium Boom
ExplosionEXPMediumCybran = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Cyb Generic Experimental Large Boom
ExplosionEXPLargeCybran = {
    ModPath .. 'medium_test_sonic.bp',
    ModPath .. 'medium_test_fire.bp',
    ModPath .. 'medium_test_smoke.bp',
}

-- Cyb Generic Experimental FinalLarge Boom
ExplosionEXPFinalLargeCybran = {
    ModPath .. 'medium_test_sonic.bp',
    ModPath .. 'medium_test_fire.bp',
    ModPath .. 'medium_test_smoke.bp',
}

-- Cyb SR Explosion Stuff
SoulRipper_Impact_Explosion = {
    ModPath .. 'medium_test_sonic.bp',
    ModPath .. 'medium_test_fire.bp',
    ModPath .. 'medium_test_smoke.bp',
}
SoulRipper_Final_Boom = {
    ModPath .. 'medium_test_sonic.bp',
    ModPath .. 'medium_test_fire.bp',
    ModPath .. 'medium_test_smoke.bp',
}
SoulRipper_First_Series_Booms = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}
SoulRipper_Second_Series_Booms = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}
SoulRipper_Third_Series_Booms = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}
SoulRipper_Fall_Down_Smoke = {
    ModPath .. 'small_test_smoke.bp',
}
SoulRipper_Ambient_Electricity = {
    ModPath .. 'small_test_smoke.bp',
}
SoulRipper_Ambient_Electricity_Upper = {
    ModPath .. 'small_test_smoke.bp',
}


-- EXP BOOMS (Cyb)
-- EXP BOOMS (Aeon)

-- Aeon GC Small Boom
ExplosionEXPSmallAeon = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}
-- Aeon GC Medium Boom
ExplosionEXPMediumAeon = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Aeon GC Large Boom
ExplosionEXPLargeAeon = {
    ModPath .. 'medium_test_sonic.bp',
    ModPath .. 'medium_test_fire.bp',
    ModPath .. 'medium_test_smoke.bp',
}
-- Aeon GC Large Boom
ExplosionEXPLargeInitialAeon = {
    ModPath .. 'medium_test_sonic.bp',
    ModPath .. 'medium_test_fire.bp',
    ModPath .. 'medium_test_smoke.bp',
}
-- Aeon GC Very Large Boom
ExplosionEXPVeryLargeAeon = {
    ModPath .. 'medium_test_smoke.bp',
    ModPath .. 'medium_test_fire.bp',
    ModPath .. 'medium_test_random.bp',
    ModPath .. 'medium_test_sonic.bp',
}
-- Aeon GC Core Breach
GC_Core_Breach02 = {
    ModPath .. 'small_test_smoke.bp',
}
-- Aeon GC Smoking Limbs
GC_Body_Part_Damage = {
    ModPath .. 'small_test_smoke.bp',
}
-- Aeon CZAR Stuff
CZAR_Initial_Center_Explosion = {}

CZARShockwaveEdge = {}

CZARShockwaveEdgeUpper = {}

CZARShockwaveHit = {}

CZARCenterEffectUp= {}

CZARCenterEffectDown= {}

CZAR_Center_FallDown_Aura = {
    ModPath .. 'nothing.bp',
}

CZARCenterImpactExplosion = {   
    ModPath .. 'large_test_sonic.bp',
    ModPath .. 'large_test_fire.bp',
    ModPath .. 'large_test_smoke.bp',
}

CZAR_Center_FallDown_Smoke = {  ModPath .. 'small_test_smoke.bp',}

CZAR_Center_Charge = {  ModPath .. 'small_test_smoke.bp',}

CZAR_Center_Core_Breach01 = {   ModPath .. 'small_test_smoke.bp',}

CZAR_Center_Core_Breach02 = {   ModPath .. 'small_test_smoke.bp',}

CZAR_Air_Rushing_In = {}

CZAR_Core_Rupture = {   ModPath .. 'small_test_smoke.bp',}



-- EXP BOOMS (Aeon)
-- EXP BOOMS (Seraphim)

-- Sera Chicken Medium Boom
ExplosionEXPMediumSera  = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Sera Chicken Large Boom
ExplosionEXPLargeSera  = {
    ModPath .. 'medium_test_sonic.bp',
    ModPath .. 'medium_test_fire.bp',
    ModPath .. 'medium_test_smoke.bp',
}

-- Sera Asswasher Stuff
Ahwassa_Engine_PreFail_Electricity = {  ModPath .. 'small_test_smoke.bp',}

Ahwassa_Engine_PreFail_Smoke = {    ModPath .. 'small_test_smoke.bp',}

Ahwassa_Engine_Critical_Explosion_Flashes = {   ModPath .. 'small_test_smoke.bp',}

Ahwassa_Engine_Critical_Explosion_Sparks = {    ModPath .. 'small_test_smoke.bp',}

Ahwassa_Engine_Critical_Smoke = {   ModPath .. 'small_test_smoke.bp',}

Ahwassa_Engine_Critical_Breach = {  ModPath .. 'small_test_smoke.bp',}

Ahwassa_Engine_Critical_Breach_Electricity = {  ModPath .. 'small_test_smoke.bp',}

Ahwassa_Impact_Explosion = {
    ModPath .. 'Large_test_smoke.bp',
    ModPath .. 'Large_test_fire.bp',
    ModPath .. 'Large_test_random.bp',
    ModPath .. 'Large_test_sonic.bp',
}


-- EXP BOOMS (Seraphim)
-- OTHER FX
-- MAIN FACTIONAL FX

OilSlick = {}

UEFFlamingDebrisLandImpact = {
    --ModPath .. 'dust_emit.bp',        
}

UEFFlamingDebrisTrail = {}

CybranFlamingDebrisLandImpact = {
    --ModPath .. 'dust_emit.bp',
    --ModPath .. 'CybT2_smoke.bp',
}

CybranFlamingDebrisTrail = {
    --ModPath .. 'CybranFlamingDebrisSmoke.bp',
}

AeonFlamingDebrisLandImpact = {
    --ModPath .. 'dust_emit.bp',
    --ModPath .. 'AeonT2_smoke.bp',
}

AeonFlamingDebrisTrail = {
    --ModPath .. 'AeonFlamingDebrisSmoke.bp',
}

SeraFlamingDebrisLandImpact = {
    --ModPath .. 'dust_emit.bp',
    --ModPath .. 'AeonT2_smoke.bp',
}

SeraFlamingDebrisTrail = {
    --ModPath .. 'AeonFlamingDebrisSmoke.bp',
}
AhwassaFlamingDebrisTrail  = {
    --ModPath .. 'AeonFlamingDebrisSmoke.bp',
}
DebrisSplashyWater = {
    --ModPath .. 'Splashy_Ripples_ring_01_emit.bp',
    --ModPath .. 'Splashy_Plume_01_emit.bp',
}
SRDebrisImpact = {}
CZARDebrisImpact = {}
AsswasherDebrisImpact = {}