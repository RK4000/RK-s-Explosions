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
local ModPathDmgFX = '/mods/rks_explosions/effects/emitters/dmgfx/'
local ModPathNomads = '/mods/rks_explosions/effects/emitters/nomads'
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
-- FALLDOWN DEBRIS FX

-- T1 UEF Plane DEBRIS
PlaneDebrisTECH1UEF = { 
    
}

-- T2 UEF Plane DEBRIS
PlaneDebrisTECH2UEF = { 
    
}

-- T3 UEF Plane DEBRIS
PlaneDebrisTECH3UEF = { 
    
}

-- T1 CYBRAN Plane DEBRIS
PlaneDebrisTECH1CYBRAN = { 
    
}

-- T2 CYBRAN Plane DEBRIS
PlaneDebrisTECH2CYBRAN = { 
    
}

-- T3 CYBRAN Plane DEBRIS
PlaneDebrisTECH3CYBRAN = { 
    
}

-- T1 AEON Plane DEBRIS
PlaneDebrisTECH1AEON = { 
    
}

-- T2 AEON Plane DEBRIS
PlaneDebrisTECH2AEON = { 
    
}

-- T3 AEON Plane DEBRIS
PlaneDebrisTECH3AEON = { 
    
}

-- T1 SERAPHIM Plane DEBRIS
PlaneDebrisTECH1SERAPHIM = { 
    
}

-- T2 SERAPHIM Plane DEBRIS
PlaneDebrisTECH2SERAPHIM = { 
    
}

-- T3 SERAPHIM Plane DEBRIS
PlaneDebrisTECH3SERAPHIM = { 
    
}



-- FALLDOWN DEBRIS FX
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

--LightDebris

UEFFlamingLightDebrisLandImpact = {       
}

UEFFlamingLightDebrisTrail = {
}

CybranFlamingLightDebrisLandImpact = {
}

CybranFlamingLightDebrisTrail = {
}

AeonFlamingLightDebrisLandImpact = {
}

AeonFlamingLightDebrisTrail = {
}

SeraFlamingLightDebrisLandImpact = {
}

SeraFlamingLightDebrisTrail = {
}

--MediumDebris

UEFFlamingDebrisLandImpact = {       
}

UEFFlamingDebrisTrail = {
}

CybranFlamingDebrisLandImpact = {
}

CybranFlamingDebrisTrail = {
}

AeonFlamingDebrisLandImpact = {
}

AeonFlamingDebrisTrail = {
}

SeraFlamingDebrisLandImpact = {
}

SeraFlamingDebrisTrail = {
}

--HvyDebris

UEFFlamingHeavyDebrisLandImpact = {       
}

UEFFlamingHeavyDebrisTrail = {
}

CybranFlamingHeavyDebrisLandImpact = {
}

CybranFlamingHeavyDebrisTrail = {
}

AeonFlamingHeavyDebrisLandImpact = {
}

AeonFlamingHeavyDebrisTrail = {
}

SeraFlamingHeavyDebrisLandImpact = {
}

SeraFlamingHeavyDebrisTrail = {
}

--ExpDebris

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

-- Sera Land DMG FX 



------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------NOMADS STUFF IS BELOW
------------------------------------------------------------------------------------------------------------------

 
-- LAND BOOMS 

-- T1 NOMADS Unit Boom
ExplosionTECH1NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 NOMADS Unit Boom
ExplosionTECH2NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 NOMADS Unit Boom
ExplosionTECH3NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}



-- LAND BOOMS 
-- AIR BOOMS 

-- T1 NOMADS Air Unit Boom
AirExplosionTECH1NOMADS = {             
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 NOMADS Air Unit Boom
AirExplosionTECH2NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 NOMADS Air Unit Boom
AirExplosionTECH3NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}



-- AIR BOOMS
-- BUILDING BOOMS 

-- T1 NOMADS Building Unit Boom
BuildingExplosionTECH1NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T2 NOMADS Building Unit Boom
BuildingExplosionTECH2NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- T3 NOMADS Building Unit Boom
BuildingExplosionTECH3NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp', 
}



-- BUILDING BOOMS
-- FALLDOWN FX

-- T1 NOMADS Plane Fall Down
FallDownTrailTECH1NOMADS = { 
}

-- T2 NOMADS Plane Fall Down
FallDownTrailTECH2NOMADS = { 
}

-- T3 NOMADS Plane Fall Down
FallDownTrailTECH3NOMADS = { 
}



-- FALLDOWN FX 
-- FALLDOWN DEBRIS FX

-- T1 NOMADS Plane DEBRIS
PlaneDebrisTECH1NOMADS = { 
    
}

-- T2 NOMADS Plane DEBRIS
PlaneDebrisTECH2NOMADS = { 
    
}

-- T3 NOMADS Plane DEBRIS
PlaneDebrisTECH3NOMADS = { 
    
}



-- FALLDOWN DEBRIS FX
-- Ship Sub-Booms (Above water)

-- NOMADS T1 Ship Sub-Boom
ShipSubExplTECH1NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- NOMADS T2 Ship Sub-Boom
ShipSubExplTECH2NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- NOMADS T3 Ship Sub-Boom
ShipSubExplTECH3NOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}



-- Ship Sub-Booms (Above water) 
-- Ship Sub-Booms (Below water)

-- NOMADS T1 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH1NOMADS = {
}

-- NOMADS T2 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH2NOMADS = {
}

-- NOMADS T3 Ship Sub-Boom (Underwater)
ShipSubExplUnderwaterTECH3NOMADS = {
}



-- Ship Sub-Booms (Below Water) 
-- Sub Booms (surface)

-- NOMADS Sub Boom (Surface)
SubExplosionAboveWaterNOMADS = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_smoke.bp',
}



-- Sub Booms (Surface)
-- Sub Booms (Underwater)

-- NOMADS Sub Boom (Underwater)
SubExplosionUnderWaterNOMADS = {
}



-- Sub Booms (Underwater)



-- DEBRIS

NOMADSFlamingLightDebrisLandImpact = {
}

NOMADSFlamingLightDebrisTrail = {
}

NOMADSFlamingDebrisLandImpact = {
}

NOMADSFlamingDebrisTrail = {
}

NOMADSFlamingHeavyDebrisLandImpact = {
}

NOMADSFlamingHeavyDebrisTrail = {
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
