#****************************************************************************
#**
#**  File     :  SDEffectTemplates
#**  Author(s):  RK4000
#**
#**  Summary  :  Generic templates for commonly used effects for the explosions mod. (in other words, this is where the magic happens)
#**
#**  Copyright © 2014 RK Powered Games, Inc.  All rights reserved.
#****************************************************************************
TableCat = import('/lua/utilities.lua').TableCat
EmtBpPath = '/mods/rks_explosions/effects/emitters/'
EmtBpPathAlt = '/mods/rks_explosions/effects/emitters/'
EmitterTempEmtBpPath = '/mods/rks_explosions/effects/emitters/temp/'
ModPath = '/mods/rks_explosions/effects/emitters/'


#####################HUGE EXP. EXPLOSIONS####################################
ExplosionSmallSD = {
	##ModPath .. 'dust_small_emit.bp',
	ModPath .. 'small_test_sonic.bp',
	ModPath .. 'small_test_fire.bp',
	ModPath .. 'small_test_random.bp',
	ModPath .. 'small_test_smoke.bp',
}

ExplosionLargeShortDurSmoke = {
	ModPath .. 'Large_ShortDur_test_smoke.bp',
	ModPath .. 'Large_test_fire.bp',
	ModPath .. 'Large_test_random.bp',
	ModPath .. 'Large_test_sonic.bp',
}
ExplosionVeryLarge = {
        ModPath .. 'residue_Very_Large_test_smoke.bp',
	ModPath .. 'Very_Large_test_smoke.bp',
	ModPath .. 'Very_Large_test_fire.bp',
	ModPath .. 'Very_Large_test_random.bp',
	ModPath .. 'Very_Large_test_sonic.bp',
}
ExplosionVeryLargeShortDurSmoke = {
        ModPath .. 'residue_Very_Large_test_smoke.bp',
	ModPath .. 'Very_ShortDur_Large_test_smoke.bp',
	ModPath .. 'Very_Large_test_fire.bp',
	ModPath .. 'Very_Large_test_random.bp',
	ModPath .. 'Very_Large_test_sonic.bp',
} 

#####################AddNothing Boom###############################
AddNothing = {}
#########################################################################################################################
######################################################################################################### OTHER FX
######################################################################################################### 
######################################################################################################### LAND BOOMS 

#####################T1 UEF Unit Boom###############################
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

#####################T2 UEF Unit Boom###############################
ExplosionTECH2uef = {
	ModPath .. 'dust_emit.bp',              
	ModPath .. 'UEFMedium_test_smoke.bp',            
	ModPath .. 'UEFMedium_test_random.bp',     
	ModPath .. 'UEFMedium_test_sonic.bp',      
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit.bp',	
        ModPath .. 'small_UEF_test_fire.bp',
}

#####################T3 UEF Unit Boom###############################
ExplosionTECH3uef = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'UEFMedium_test_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

#####################T1 Cyb Unit Boom###############################
ExplosionTECH1cybran = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybT2_charge.bp',
        ModPath .. 'CybT2_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################T2 Cyb Unit Boom###############################
ExplosionTECH2cybran = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybT2_charge.bp',
        ModPath .. 'CybT2_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################T3 Cyb Unit Boom###############################
ExplosionTECH3cybran = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybT3_charge.bp',
        ModPath .. 'CybT3_chargelong.bp',
        ModPath .. 'CybT3_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################T1 Aeon Unit Boom###############################
ExplosionTECH1aeon = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'AeonT2_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT2.bp',
}

#####################T2 Aeon Unit Boom###############################
ExplosionTECH2aeon = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'AeonT2_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT2.bp',
}

#####################T3 Aeon Unit Boom###############################
ExplosionTECH3aeon = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT3.bp',
}

#####################T1 Sera Unit Boom###############################
ExplosionTECH1seraphim = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################T2 Sera Unit Boom###############################
ExplosionTECH2seraphim = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################T3 Sera Unit Boom###############################
ExplosionTECH3seraphim = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
	ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

######################################################################################################### LAND BOOMS
######################################################################################################### 
######################################################################################################### FALLDOWN FX

#####################T1 UEF Plane Fall Down###############################
TECH1uefFallDownTrail = { 
        ModPath .. 'AircraftFallDownFireball.bp',
        ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

#####################T2 UEF Plane Fall Down###############################
TECH2uefFallDownTrail = { 
        ModPath .. 'AircraftFallDownFireball.bp',
        ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

#####################T3 UEF Plane Fall Down###############################
TECH3uefFallDownTrail = { 
        ModPath .. 'AircraftFallDownFireball.bp',
        ModPath .. 'AircraftFallDownSmokeTrail.bp',
}

#####################T1 Cybran Plane Fall Down###############################
TECH1cybranFallDownTrail = { 
        ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
        ModPath .. 'Cybran_Fall_Down_Smoke_T1.bp',
}

#####################T2 Cybran Plane Fall Down###############################
TECH2cybranFallDownTrail = { 
        ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
        ModPath .. 'Cybran_Fall_Down_Smoke_T1.bp',
}

#####################T3 Cybran Plane Fall Down###############################
TECH3cybranFallDownTrail = { 
        ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
        ModPath .. 'Cybran_Fall_Down_Smoke_T1.bp',
}

#####################T1 Aeon Plane Fall Down###############################
TECH1aeonFallDownTrail = { 
        ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T2 Aeon Plane Fall Down###############################
TECH2aeonFallDownTrail = { 
        ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T3 Aeon Plane Fall Down###############################
TECH3aeonFallDownTrail = { 
        ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T1 Sera Plane Fall Down###############################
TECH1seraphimFallDownTrail = { 
        ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T2 Sera Plane Fall Down###############################
TECH2seraphimFallDownTrail = { 
        ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T3 Sera Plane Fall Down###############################
TECH3seraphimFallDownTrail = { 
        ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

######################################################################################################### FALLDOWN FX
######################################################################################################### 
######################################################################################################### LIGHT AIR DMG FX 

#####################T1 UEF Plane Light DMG###############################
SmallAirUnitSmokeTECH1uef = { 
        ModPath .. 'AircraftDamageSmoke01.bp',
}

#####################T2 UEF Plane Light DMG###############################
SmallAirUnitSmokeTECH2uef = { 
        ModPath .. 'AircraftDamageSmoke01.bp',
}

#####################T3 UEF Plane Light DMG###############################
SmallAirUnitSmokeTECH3uef = { 
        ModPath .. 'AircraftDamageSmoke01.bp',
}

#####################T1 Cybran Plane Light DMG###############################
SmallAirUnitSmokeTECH1cybran = { 
        ModPath .. 'CybranAircraftLightDmgSmokeTrail.bp',
        ModPath .. 'CybranAircraftLightDmgFire.bp',
}

#####################T2 Cybran Plane Light DMG###############################
SmallAirUnitSmokeTECH2cybran = { 
        ModPath .. 'CybranAircraftLightDmgSmokeTrail.bp',
        ModPath .. 'CybranAircraftLightDmgFire.bp',
}

#####################T3 Cybran Plane Light DMG###############################
SmallAirUnitSmokeTECH3cybran = { 
        ModPath .. 'CybranT3AircraftLightDmgSmokeTrail.bp',
        ModPath .. 'CybranAircraftLightDmgFire.bp',
}

#####################T1 Aeon Plane Light DMG###############################
SmallAirUnitSmokeTECH1aeon = { 
        ModPath .. 'AeonAircraftLightDmgSmokeTrail.bp',
}

#####################T2 Aeon Plane Light DMG###############################
SmallAirUnitSmokeTECH2aeon = { 
        ModPath .. 'AeonAircraftLightDmgSmokeTrail.bp',
}

#####################T3 Aeon Plane Light DMG###############################
SmallAirUnitSmokeTECH3aeon = { 
        ModPath .. 'AeonT3AircraftLightDmgSmokeTrail.bp',
}

#####################T1 Sera Plane Light DMG###############################
SmallAirUnitSmokeTECH1seraphim = { 
        ModPath .. 'AeonAircraftLightDmgSmokeTrail.bp',
}

#####################T2 Sera Plane Light DMG###############################
SmallAirUnitSmokeTECH2seraphim = { 
        ModPath .. 'AeonAircraftLightDmgSmokeTrail.bp',
}

#####################T3 Sera Plane Light DMG###############################
SmallAirUnitSmokeTECH3seraphim = { 
        ModPath .. 'AeonT3AircraftLightDmgSmokeTrail.bp',
}

######################################################################################################### LIGHT AIR DMG FX
######################################################################################################### 
######################################################################################################### MED AIR DMG FX 

#####################T1 UEF Plane Med DMG###############################
SmallAirUnitFireTECH1uef = { 
        ModPath .. 'AircraftDamageFireSmall01.bp',
        ModPath .. 'AircraftDamageSmoke01.bp',
}

#####################T2 UEF Plane Med DMG###############################
SmallAirUnitFireTECH2uef = { 
        ModPath .. 'AircraftDamageFireSmall01.bp',
        ModPath .. 'AircraftDamageSmoke01.bp',
}

#####################T3 UEF Plane Med DMG###############################
SmallAirUnitFireTECH3uef = { 
        ModPath .. 'AircraftDamageFireSmall01.bp',
        ModPath .. 'AircraftDamageSmoke01.bp',
}

#####################T1 Cybran Plane Med DMG###############################
SmallAirUnitFireTECH1cybran = { 
        ModPath .. 'CybranAircraftMediumDmgFire.bp',
        ModPath .. 'CybranAircraftMediumDmgSmokeTrail.bp',
}

#####################T2 Cybran Plane Med DMG###############################
SmallAirUnitFireTECH2cybran = { 
        ModPath .. 'CybranAircraftMediumDmgFire.bp',
        ModPath .. 'CybranAircraftMediumDmgSmokeTrail.bp',
}

#####################T3 Cybran Plane Med DMG###############################
SmallAirUnitFireTECH3cybran = { 
        ModPath .. 'CybranT3AircraftMediumDmgFire.bp',
        ModPath .. 'CybranT3AircraftMediumDmgSmokeTrail.bp',
}

#####################T1 Aeon Plane Med DMG###############################
SmallAirUnitFireTECH1aeon = { 
        ModPath .. 'AeonAircraftMediumDmgFire.bp',
        ModPath .. 'AeonAircraftMediumDmgSmokeTrail.bp',
}

#####################T2 Aeon Plane Med DMG###############################
SmallAirUnitFireTECH2aeon = { 
        ModPath .. 'AeonAircraftMediumDmgFire.bp',
        ModPath .. 'AeonAircraftMediumDmgSmokeTrail.bp',
}

#####################T3 Aeon Plane Med DMG###############################
SmallAirUnitFireTECH3aeon = { 
        ModPath .. 'AeonT3AircraftMediumDmgFire.bp',
        ModPath .. 'AeonT3AircraftMediumDmgSmokeTrail.bp',
}

#####################T1 Sera Plane Med DMG###############################
SmallAirUnitFireTECH1seraphim = { 
        ModPath .. 'SeraT3AircraftMediumDmgFire.bp',
        ModPath .. 'AeonAircraftMediumDmgSmokeTrail.bp',
}

#####################T2 Sera Plane Med DMG###############################
SmallAirUnitFireTECH2seraphim = { 
        ModPath .. 'SeraT3AircraftMediumDmgFire.bp',
        ModPath .. 'AeonAircraftMediumDmgSmokeTrail.bp',
}

#####################T3 Sera Plane Med DMG###############################
SmallAirUnitFireTECH3seraphim = { 
        ModPath .. 'SeraT3AircraftMediumDmgFire.bp',
        ModPath .. 'AeonT3AircraftMediumDmgSmokeTrail.bp',
}

######################################################################################################### MED AIR DMG FX
######################################################################################################### 
######################################################################################################### HVY AIR DMG FX 

#####################T1 UEF Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH1uef = { 
        ModPath .. 'AircraftDamageFireBig01.bp',
        ModPath .. 'AircraftDamageSmokeBig01.bp',
}

#####################T2 UEF Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH2uef = { 
        ModPath .. 'AircraftDamageFireBig01.bp',
        ModPath .. 'AircraftDamageSmokeBig01.bp',
}

#####################T3 UEF Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH3uef = { 
        ModPath .. 'AircraftDamageFireBig01.bp',
        ModPath .. 'AircraftDamageSmokeBig01.bp',
}

#####################T1 Cybran Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH1cybran = { 
        ModPath .. 'CybranAircraftHeavyDmgFire.bp',
        ModPath .. 'CybranAircraftHeavyDmgSmokeTrail.bp',
}

#####################T2 Cybran Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH2cybran = { 
        ModPath .. 'CybranAircraftHeavyDmgFire.bp',
        ModPath .. 'CybranAircraftHeavyDmgSmokeTrail.bp',
}

#####################T3 Cybran Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH3cybran = { 
        ModPath .. 'CybranT3AircraftHeavyDmgFire.bp',
        ModPath .. 'CybranT3AircraftHeavyDmgSmokeTrail.bp',
}

#####################T1 Aeon Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH1aeon = { 
        ModPath .. 'AeonAircraftHeavyDmgFire.bp',
        ModPath .. 'AeonAircraftHeavyDmgSmokeTrail.bp',
}

#####################T2 Aeon Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH2aeon = { 
        ModPath .. 'AeonAircraftHeavyDmgFire.bp',
        ModPath .. 'AeonAircraftHeavyDmgSmokeTrail.bp',
}

#####################T3 Aeon Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH3aeon = { 
        ModPath .. 'AeonT3AircraftHeavyDmgFire.bp',
        ##ModPath .. 'AeonT3AircraftHeavyDmgSmokeTrail.bp',
}

#####################T1 Sera Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH1seraphim = { 
        ModPath .. 'SeraT3AircraftHeavyDmgFire.bp',
        ModPath .. 'AeonAircraftHeavyDmgSmokeTrail.bp',
}

#####################T2 Sera Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH2seraphim = { 
        ModPath .. 'SeraT3AircraftHeavyDmgFire.bp',
        ModPath .. 'AeonAircraftHeavyDmgSmokeTrail.bp',
}

#####################T3 Sera Plane Hvy DMG###############################
BigAirUnitFireSmokeTECH3seraphim = { 
        ModPath .. 'SeraT3AircraftHeavyDmgFire.bp',
        ModPath .. 'AeonAircraftHeavyDmgSmokeTrail.bp',
}


######################################################################################################### HVY AIR DMG FX 
######################################################################################################### 
######################################################################################################### Ship Sub-Booms 

#####################UEF T1 Ship Sub-Boom###############################
uefShipSubExplTECH1 = {
	ModPath .. 'UEFMedium_test_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

#####################UEF T2 Ship Sub-Boom###############################
uefShipSubExplTECH2 = {
	ModPath .. 'UEFMedium_test_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

#####################UEF T3 Ship Sub-Boom###############################
uefShipSubExplTECH3 = {
	ModPath .. 'UEFMedium_test_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

#####################Cyb T1 Ship Sub-Boom###############################
cybranShipSubExplTECH1 = {
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybT3_charge.bp',
        ModPath .. 'CybT3_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
        ModPath .. 'CybT3_chargelong.bp',
}

#####################Cyb T2 Ship Sub-Boom###############################
cybranShipSubExplTECH2 = {
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybT3_charge.bp',
        ModPath .. 'CybT3_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
        ModPath .. 'CybT3_chargelong.bp',
}

#####################Cyb T3 Ship Sub-Boom###############################
cybranShipSubExplTECH3 = {
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybT3_charge.bp',
        ModPath .. 'CybT3_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
        ModPath .. 'CybT3_chargelong.bp',
}

#####################Aeon T1 Ship Sub-Boom###############################
aeonShipSubExplTECH1 = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT3.bp',
}

#####################Aeon T2 Ship Sub-Boom###############################
aeonShipSubExplTECH2 = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT3.bp',
}

#####################Aeon T3 Ship Sub-Boom###############################
aeonShipSubExplTECH3 = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT3.bp',
}

#####################Sera T1 Ship Sub-Boom###############################
seraphimShipSubExplTECH1 = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################Sera T2 Ship Sub-Boom###############################
seraphimShipSubExplTECH2 = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################Sera T3 Ship Sub-Boom###############################
seraphimShipSubExplTECH3 = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

######################################################################################################### Ship Sub-Booms
######################################################################################################### 
######################################################################################################### Sub Booms (surface)

#####################UEF Sub Boom (Surface)###############################
uefSubExplosionAboveWater = {
	ModPath .. 'UEFMedium_test_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

#####################Cybran Sub Boom (Surface)###############################
cybranSubExplosionAboveWater = {
	ModPath .. 'UEFMedium_test_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

#####################Aeon Sub Boom (Surface)###############################
aeonSubExplosionAboveWater = {
	ModPath .. 'UEFMedium_test_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

#####################Sera Sub Boom (Surface)###############################
seraphimSubExplosionAboveWater = {
	ModPath .. 'UEFMedium_test_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

######################################################################################################### Sub Booms (Surface)
######################################################################################################### 
######################################################################################################### Sub Booms (Underwater)

#####################UEF Sub Boom (Underwater)###############################
uefSubExplosionUnderWater = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################Cybran Sub Boom (Underwater)###############################
cybranSubExplosionUnderWater = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################Aeon Sub Boom (Underwater)###############################
aeonSubExplosionUnderWater = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################Sera Sub Boom (Underwater)###############################
seraSubExplosionUnderWater = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

######################################################################################################### Sub Booms (Underwater)
######################################################################################################### 
######################################################################################################### EXP BOOMS (Cyb)

#####################Cyb EXP Medium Boom###############################
ExplosionEXPMediumCybran = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybEXPMED_charge.bp',
        ModPath .. 'CybEXPMED_chargelong.bp',
        ModPath .. 'CybEXPMED_chargering.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################Cyb EXP Large Boom###############################
ExplosionEXPLargeCybran = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybEXPLRG_charge.bp',
        ModPath .. 'CybEXPLRG_chargelong.bp',
        ModPath .. 'CybEXPLRG_chargering.bp',
	ModPath .. 'Large_test_sonic.bp',
}

######################################################################################################### EXP BOOMS (Cyb)
######################################################################################################### 
######################################################################################################### EXP BOOMS (Aeon)

#####################Aeon EXP Medium Boom###############################
ExplosionEXPMediumAeon = {
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'AeonEXPMED_aura.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT4_Small.bp',
}

#####################Aeon EXP Large Boom###############################
ExplosionEXPLargeAeon = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonEXPLRG_aura.bp',
	ModPath .. 'AeonEXPLRG2D_aura.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Large_test_sonic.bp',
	ModPath .. 'AuraWaveT4_Med.bp',
}

#####################Aeon EXP Very Large Boom###############################
ExplosionEXPVeryLargeAeon = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonEXPVLRG_aura.bp',
	ModPath .. 'AeonEXPVLRG2D_aura.bp',
	ModPath .. 'Large_test_sonic.bp',
	ModPath .. 'Very_Large_test_sonic.bp',
	ModPath .. 'AuraWaveT4_Big.bp',
}

######################################################################################################### EXP BOOMS (Aeon)
######################################################################################################### 
######################################################################################################### EXP BOOMS (Seraphim)

#####################Sera EXP Medium Boom###############################
ExplosionEXPMediumSera  = {
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
	ModPath .. 'SeraT2_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################Sera EXP Large Boom###############################
ExplosionEXPLargeSera  = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
	ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Large_test_random.bp',
	ModPath .. 'Large_test_sonic.bp',
}

######################################################################################################### EXP BOOMS (Seraphim)
######################################################################################################### 
######################################################################################################### OTHER FX
#########################################################################################################################

OilSlick = {
       ModPath .. 'OilSlick.bp',
}

UEFFlamingDebrisLandImpact = {
       ModPath .. 'dust_emit.bp',            
       ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
       ModPath .. 'Debris_Small_test_fire.bp', 
       ModPath .. 'Debris_Small_test_smoke.bp', 
       ModPath .. 'Debris_Small_test_sonic.bp', 
       ##ModPath .. 'UEFDebrisImpactResidueFire.bp', 
       ##ModPath .. 'UEFDebrisImpactResidueSmoke.bp', 
}

UEFFlamingDebrisTrail = {
       ModPath .. 'UEFFlamingDebrisFire.bp',
       ModPath .. 'UEFFlamingDebrisSmoke.bp',
}

CybranFlamingDebrisLandImpact = {
       ##ModPath .. 'dust_emit.bp',
       ##ModPath .. 'CybT2_smoke.bp',
}

CybranFlamingDebrisTrail = {
       ModPath .. 'CybranFlamingDebrisFire.bp',
       ##ModPath .. 'CybranFlamingDebrisSmoke.bp',
}

AeonFlamingDebrisLandImpact = {
       ##ModPath .. 'dust_emit.bp',
       ##ModPath .. 'AeonT2_smoke.bp',
}

AeonFlamingDebrisTrail = {
       ModPath .. 'AeonFlamingDebrisFire.bp',
       ##ModPath .. 'AeonFlamingDebrisSmoke.bp',
}

SeraFlamingDebrisLandImpact = {
       ##ModPath .. 'dust_emit.bp',
       ##ModPath .. 'AeonT2_smoke.bp',
}

SeraFlamingDebrisTrail = {
       ModPath .. 'SeraFlamingDebrisFire.bp',
       ##ModPath .. 'AeonFlamingDebrisSmoke.bp',
}

