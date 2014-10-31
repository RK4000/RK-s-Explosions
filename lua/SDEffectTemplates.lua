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

#####################WEAPON EXPLOSIONS####################################
T2RocketBotMissileHitGround = {
	##ModPath .. 'dust_emit.bp',
	ModPath .. 'Cyb_Rktbot_smoke.bp',
    ModPath .. 'Cyb_Rktbot_charge.bp',
	ModPath .. 'Cyb_Flash_Rktbot.bp',
	##ModPath .. 'Medium_test_sonic.bp',
}

T2RocketBotMissileHit = {
	##ModPath .. 'dust_emit.bp',
	ModPath .. 'Cyb_Rktbot_smoke_Unit.bp',
    ModPath .. 'Cyb_Rktbot_charge.bp',
	ModPath .. 'Cyb_Flash_Rktbot_Unit.bp',
	##ModPath .. 'Medium_test_sonic.bp',
}
AeonRestorerMissileHit01 = {
	ModPath .. 'Aeon_Restorer_Aura.bp',
	ModPath .. 'Aeon_Restorer_Aura2.bp',
	ModPath .. 'Aeon_Restorer_smoke.bp',
}

#####################HUGE EXP. EXPLOSIONS####################################
ExplosionSmallSD = {
	##ModPath .. 'dust_small_emit.bp',
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
	##ModPath .. 'Large_ShortDur_test_smoke.bp',
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
	##ModPath .. 'Fluffy_Heart_Smoke.bp',
}
Heart_Debris_Boom = {
	ModPath .. 'FluffyHeart_Small.bp',
}
Heart_Debris_Trail = {
	ModPath .. 'FluffyHeart_Trail.bp',
}

#####################AddNothing Boom###############################
AddNothing = {}
######################################################################################################################### MAIN FACTIONAL DEATH FX
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
		##ModPath .. 'UEF_Outward_Spark_Small.bp', 
        ModPath .. 'small_UEF_test_fire.bp',
}

#####################T3 UEF Unit Boom###############################
ExplosionTECH3uef = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'UEFMedium_test_smokeT3.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
		ModPath .. 'UEF_Outward_Spark.bp', 
        ModPath .. 'small_UEF_test_fire_T3.bp',	
}

#####################T1 Cyb Unit Boom###############################
ExplosionTECH1cybran = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybT1_charge.bp',
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
	ModPath .. 'Cyb_Flash_1.bp',
}

#####################T1 Aeon Unit Boom###############################
ExplosionTECH1aeon = {
    ##ModPath .. 'Aeon_Spark.bp',
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'AeonT2_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	##ModPath .. 'AuraWaveT2.bp',
}

#####################T2 Aeon Unit Boom###############################
ExplosionTECH2aeon = {
    ModPath .. 'Aeon_Spark.bp',
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT2_smoke.bp',
	##ModPath .. 'AeonT2_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	##ModPath .. 'AuraWaveT2.bp',
}

#####################T3 Aeon Unit Boom###############################
ExplosionTECH3aeon = {
    ModPath .. 'Aeon_Spark.bp',
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
	ModPath .. 'SeraT3_electricity3.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	##ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

#####################T2 Sera Unit Boom###############################
ExplosionTECH2seraphim = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'SeraT3_electricity3.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	##ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

#####################T3 Sera Unit Boom###############################
ExplosionTECH3seraphim = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
	ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'SeraT3_electricity3.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

######################################################################################################### LAND BOOMS
######################################################################################################### 
######################################################################################################### AIR BOOMS 

#####################T1 UEF Air Unit Boom###############################
AirExplosionTECH1uef = {             
	ModPath .. 'UEFMedium_test_smoke.bp',            
	ModPath .. 'UEFMedium_test_sonic.bp',      
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        ##EmtBpPath .. 'SDantimatter_ring_01_air.bp',		
}

#####################T2 UEF Air Unit Boom###############################
AirExplosionTECH2uef = {
	ModPath .. 'UEFMedium_test_smoke.bp',            
	ModPath .. 'UEFMedium_test_sonic.bp',      
        ModPath .. 'sdexplosion_fire_sparks_02_emit_air.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_air.bp',	
}

#####################T3 UEF Air Unit Boom###############################
AirExplosionTECH3uef = {
	##ModPath .. 'UEFMedium_test_smoke.bp',            
	ModPath .. 'UEFMedium_test_sonic.bp',      
        ModPath .. 'sdexplosion_fire_sparks_02_emit_air.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_air.bp',		
		ModPath .. 'UEF_Outward_Spark_Air.bp', 
}

#####################T1 Cyb Air Unit Boom###############################
AirExplosionTECH1cybran = {
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybT2_charge.bp',
        ModPath .. 'CybT2_chargering_air.bp',
	##ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################T2 Cyb Air Unit Boom###############################
AirExplosionTECH2cybran = {
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybT2_charge.bp',
        ModPath .. 'CybT2_chargering_air.bp',
		ModPath .. 'CybT3_chargelong.bp',
	##ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
		ModPath .. 'Cyb_Flash_1.bp',
}

#####################T3 Cyb Air Unit Boom###############################
AirExplosionTECH3cybran = {
	##ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybT3_charge.bp',
        ModPath .. 'CybT3_chargelong_air.bp',
        ModPath .. 'CybT3_chargering_air.bp',
	##ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
		ModPath .. 'Cyb_Flash_2_air.bp',
}

#####################T1 Aeon Air Unit Boom###############################
AirExplosionTECH1aeon = {
    ##ModPath .. 'Aeon_Spark_air.bp',
	ModPath .. 'AeonT2_smoke.bp',
	##ModPath .. 'AeonT2_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	##ModPath .. 'AuraWaveT2_Air.bp',
}

#####################T2 Aeon Air Unit Boom###############################
AirExplosionTECH2aeon = {
    ModPath .. 'Aeon_Spark_air.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'AeonT2_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	##ModPath .. 'AuraWaveT2_Air.bp',
}

#####################T3 Aeon Air Unit Boom###############################
AirExplosionTECH3aeon = {
    ModPath .. 'Aeon_Spark_air.bp',
	##ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	##ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT3_Air.bp',
}

#####################T1 Sera Air Unit Boom###############################
AirExplosionTECH1seraphim = {
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
	##ModPath .. 'SeraT3_electricity3.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	##ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	##ModPath .. 'Sera_Afterhue.bp',
}

#####################T2 Sera Air Unit Boom###############################
AirExplosionTECH2seraphim = {
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'SeraT3_electricity3.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	##ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

#####################T3 Sera Air Unit Boom###############################
AirExplosionTECH3seraphim = {
	##ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
	##ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'SeraT3_electricity3_T3Air.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2_T3air.bp',
	##ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

######################################################################################################### AIR BOOMS
######################################################################################################### 
######################################################################################################### BUILDING BOOMS 

#####################T1 UEF Building Unit Boom###############################
BuildingExplosionTECH1uef = {             
	ModPath .. 'UEFMedium_test_smoke.bp',            
	ModPath .. 'UEFMedium_test_sonic.bp',      
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        ##EmtBpPath .. 'SDantimatter_ring_01_building.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',		
}

#####################T2 UEF Building Unit Boom###############################
BuildingExplosionTECH2uef = {
	ModPath .. 'UEFMedium_test_smoke.bp',            
	ModPath .. 'UEFMedium_test_sonic.bp',      
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        ##EmtBpPath .. 'SDantimatter_ring_01_building.bp',
        ModPath .. 'small_UEF_test_fire_T3.bp',				
		ModPath .. 'UEF_Outward_Spark_Building.bp', 
}

#####################T3 UEF Building Unit Boom###############################
BuildingExplosionTECH3uef = {
	ModPath .. 'UEFMedium_test_smoke.bp',            
	ModPath .. 'UEFMedium_test_sonic.bp',      
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        ##EmtBpPath .. 'SDantimatter_ring_01_building.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',			
		ModPath .. 'UEF_Outward_Spark_Building.bp', 
	
}

#####################T1 Cyb Building Unit Boom###############################
BuildingExplosionTECH1cybran = {
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybT2_charge.bp',
        ModPath .. 'CybT2_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
		ModPath .. 'Cyb_Flash_2.bp',
}

#####################T2 Cyb Building Unit Boom###############################
BuildingExplosionTECH2cybran = {
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybT2_charge.bp',
        ModPath .. 'CybT2_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
		ModPath .. 'Cyb_Flash_2.bp',
}

#####################T3 Cyb Building Unit Boom###############################
BuildingExplosionTECH3cybran = {
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybT3_charge.bp',
        ModPath .. 'CybT3_chargelong.bp',
        ModPath .. 'CybT3_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
		ModPath .. 'Cyb_Flash_2.bp',
}

#####################T1 Aeon Building Unit Boom###############################
BuildingExplosionTECH1aeon = {
    ModPath .. 'Aeon_Spark.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'AeonT2_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT2_Air.bp',
}

#####################T2 Aeon Building Unit Boom###############################
BuildingExplosionTECH2aeon = {
    ModPath .. 'Aeon_Spark.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'AeonT2_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT2_Air.bp',
}

#####################T3 Aeon Building Unit Boom###############################
BuildingExplosionTECH3aeon = {
    ModPath .. 'Aeon_Spark.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	##ModPath .. 'AuraWaveT3_Air.bp',
}

#####################T1 Sera Building Unit Boom###############################
BuildingExplosionTECH1seraphim = {
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'SeraT3_electricity3_building.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

#####################T2 Sera Building Unit Boom###############################
BuildingExplosionTECH2seraphim = {
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'SeraT3_electricity3_building.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

#####################T3 Sera Building Unit Boom###############################
BuildingExplosionTECH3seraphim = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
	ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'SeraT3_electricity3_building.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}


######################################################################################################### BUILDING BOOMS
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
        ##ModPath .. 'Cybran_Fall_Down_Charge_T1.bp',
        ModPath .. 'Cybran_Fall_Down_Smoke_T3.bp',
}

#####################T1 Aeon Plane Fall Down###############################
TECH1aeonFallDownTrail = { 
        ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
		ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T2 Aeon Plane Fall Down###############################
TECH2aeonFallDownTrail = { 
        ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
		ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T3 Aeon Plane Fall Down###############################
TECH3aeonFallDownTrail = { 
        ModPath .. 'Aeon_Fall_Down_Aura_T1.bp',
		ModPath .. 'Aeon_Fall_Down_Green_Hue.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T1 Sera Plane Fall Down###############################
TECH1seraphimFallDownTrail = { 
        ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
		ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T2 Sera Plane Fall Down###############################
TECH2seraphimFallDownTrail = { 
        ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
		ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
        ModPath .. 'Aeon_Fall_Down_Smoke_T1.bp',
}

#####################T3 Sera Plane Fall Down###############################
TECH3seraphimFallDownTrail = { 
        ModPath .. 'Sera_Fall_Down_Electricity_T1.bp',
		ModPath .. 'Sera_Fall_Down_Electricity_T1_2.bp',
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
	ModPath .. 'UEFBig_Ship_smoke.bp',       
	ModPath .. 'UEFSmallMedium_test_random.bp',
	ModPath .. 'UEFSmallMedium_test_sonic.bp', 
        ModPath .. 'sdexplosion_fire_sparks_02_emit.bp', 
        EmtBpPath .. 'SDantimatter_ring_01_emit_UEF_T3.bp',	
        EmtBpPath .. 'SDantimatter_ring_02_emit_UEF_T3.bp',	
        ModPath .. 'small_UEF_test_fire_T3.bp',		
		ModPath .. 'UEF_Outward_Spark_Building.bp', 
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
			ModPath .. 'Cyb_Flash_2.bp',
}

#####################Cyb T3 Ship Sub-Boom###############################
cybranShipSubExplTECH3 = {
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybT3_charge.bp',
        ModPath .. 'CybT3_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
        ModPath .. 'CybT3_chargelong.bp',
			ModPath .. 'Cyb_Flash_1.bp',
}

#####################Aeon T1 Ship Sub-Boom###############################
aeonShipSubExplTECH1 = {
    ModPath .. 'Aeon_Spark_air.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT3.bp',
}

#####################Aeon T2 Ship Sub-Boom###############################
aeonShipSubExplTECH2 = {
    ModPath .. 'Aeon_Spark_air.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT3.bp',
}

#####################Aeon T3 Ship Sub-Boom###############################
aeonShipSubExplTECH3 = {
    ModPath .. 'Aeon_Spark_air.bp',
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
		ModPath .. 'SeraT3_electricity3_building.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

#####################Sera T2 Ship Sub-Boom###############################
seraphimShipSubExplTECH2 = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
		ModPath .. 'SeraT3_electricity3_building.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
}

#####################Sera T3 Ship Sub-Boom###############################
seraphimShipSubExplTECH3 = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
        ModPath .. 'SeraT3_electricity2.bp',
		ModPath .. 'SeraT3_electricity3_building.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Sera_Afterhue.bp',
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
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybT3_charge.bp',
        ModPath .. 'CybT3_chargering.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
        ModPath .. 'CybT3_chargelong.bp',
			ModPath .. 'Cyb_Flash_2.bp',
}

#####################Aeon Sub Boom (Surface)###############################
aeonSubExplosionAboveWater = {
    ModPath .. 'Aeon_Spark_air.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonT3_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT3.bp',
}

#####################Sera Sub Boom (Surface)###############################
seraphimSubExplosionAboveWater = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
	ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'SeraT3_electricity3_building.bp',
	##ModPath .. 'Sera_Flash_1.bp',
	ModPath .. 'Sera_Flash_2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',	
	ModPath .. 'Sera_Afterhue.bp',
}

######################################################################################################### Sub Booms (Surface)
######################################################################################################### 
######################################################################################################### Sub Booms (Underwater)

#####################UEF Sub Boom (Underwater)###############################
uefSubExplosionUnderWater = {
	ModPath .. 'UEF_Underwater_Fire_T1.bp',
	##ModPath .. 'Medium_test_sonic.bp',
}

#####################Cybran Sub Boom (Underwater)###############################
cybranSubExplosionUnderWater = {
	ModPath .. 'CybT3_Underwater_charge.bp',
	##ModPath .. 'Medium_test_sonic.bp',
}

#####################Aeon Sub Boom (Underwater)###############################
aeonSubExplosionUnderWater = {
	ModPath .. 'AeonT3_aura_underwater.bp',
	##ModPath .. 'Medium_test_sonic.bp',
}

#####################Sera Sub Boom (Underwater)###############################
seraphimSubExplosionUnderWater = {
    ModPath .. 'Seraphim_underwater_spark_T3.bp',
	ModPath .. 'Sera_T3_chargering_underwater.bp',
}

######################################################################################################### Sub Booms (Underwater)
######################################################################################################### 
######################################################################################################### EXP BOOMS (Cyb)

#####################Cyb Generic Experimental  Medium Boom###############################
ExplosionEXPMediumCybran = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT2_smoke.bp',
        ModPath .. 'CybEXPMED_charge.bp',
        ModPath .. 'CybEXPMED_chargelong.bp',
        ModPath .. 'CybEXPMED_chargering.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Cyb_Flash_3.bp',
}

#####################Cyb Generic Experimental Large Boom###############################
ExplosionEXPLargeCybran = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybEXPLRG_charge.bp',
        ModPath .. 'CybEXPLRG_chargelong.bp',
        ModPath .. 'CybEXPLRG_chargering.bp',
	ModPath .. 'Large_test_sonic.bp',
	ModPath .. 'Cyb_Flash_4.bp',
}
SoulRipper_Impact_Explosion = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT3_smoke.bp',
        ModPath .. 'CybEXPLRG_charge.bp',
        ModPath .. 'CybEXPLRG_chargelong.bp',
        ModPath .. 'CybEXPLRG_chargering.bp',
	ModPath .. 'Large_test_sonic.bp',
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
	ModPath .. 'Very_Large_test_sonic.bp',
}
SoulRipper_First_Series_Booms = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'CybT3_smoke.bp',
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
######################################################################################################### EXP BOOMS (Cyb)
######################################################################################################### 
######################################################################################################### EXP BOOMS (Aeon)

#####################Aeon GC Medium Boom###############################
ExplosionEXPMediumAeon = {
    ModPath .. 'Aeon_Spark_air.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'AeonEXPMED_aura.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'AuraWaveT4_Small.bp',
}

#####################Aeon GC Large Boom###############################
ExplosionEXPLargeAeon = {
    ModPath .. 'Aeon_Spark_air.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonEXPLRG_aura.bp',
	ModPath .. 'AeonEXPLRG2D_aura.bp',
	ModPath .. 'Medium_test_sonic.bp',
	ModPath .. 'Large_test_sonic.bp',
	ModPath .. 'AuraWaveT4_Med.bp',
}

#####################Aeon GC Very Large Boom###############################
ExplosionEXPVeryLargeAeon = {
    ModPath .. 'Aeon_Spark_BIG.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'AeonEXPVLRG_aura.bp',
	ModPath .. 'AeonEXPVLRG2D_aura.bp',
	ModPath .. 'Large_test_sonic.bp',
	ModPath .. 'Very_Large_test_sonic.bp',
	ModPath .. 'AuraWaveT4_Big.bp',
}

#####################Aeon CZAR Stuff###############################
CZAR_Initial_Center_Explosion = {
	##ModPath .. 'Very_Large_test_sonic.bp',
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

######################################################################################################### EXP BOOMS (Aeon)
######################################################################################################### 
######################################################################################################### EXP BOOMS (Seraphim)

#####################Sera Chicken Medium Boom###############################
ExplosionEXPMediumSera  = {
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
	ModPath .. 'SeraT2_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}

#####################Sera Chicken Large Boom###############################
ExplosionEXPLargeSera  = {
	ModPath .. 'dust_emit.bp',
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
	ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Large_test_random.bp',
	ModPath .. 'Large_test_sonic.bp',
}

#####################Sera Asswasher Stuff###############################
Ahwassa_Engine_PreFail_Electricity = {
	ModPath .. 'AeonT3_smoke.bp',
	ModPath .. 'SeraT3_electricity.bp',
	ModPath .. 'SeraT3_electricity3_T3Air.bp',
	ModPath .. 'Sera_Flash_2_T3air.bp',
	ModPath .. 'Medium_test_sonic.bp',
}
Ahwassa_Engine_PreFail_Smoke = {
    ModPath .. 'Ahwassa_PreFail_Smoke.bp',
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
######################################################################################################### EXP BOOMS (Seraphim)
######################################################################################################### 
######################################################################################################### OTHER FX
######################################################################################################################### MAIN FACTIONAL FX

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
       ##ModPath .. 'UEFDebrisImpactResidueFire.bp', 
       ##ModPath .. 'UEFDebrisImpactResidueSmoke.bp', 
}

UEFFlamingDebrisTrail = {
       ModPath .. 'UEFFlamingDebrisFire.bp',
       ModPath .. 'UEFFlamingDebrisSmoke.bp',
}

CybranFlamingDebrisLandImpact = {
       ##ModPath .. 'dust_emit.bp',
	   ModPath .. 'CybT1_charge.bp',
       ##ModPath .. 'CybT2_smoke.bp',
}

CybranFlamingDebrisTrail = {
       ModPath .. 'CybranFlamingDebrisFire.bp',
       ##ModPath .. 'CybranFlamingDebrisSmoke.bp',
}

AeonFlamingDebrisLandImpact = {
       ##ModPath .. 'dust_emit.bp',
	   	ModPath .. 'Debris_aura.bp',
       ##ModPath .. 'AeonT2_smoke.bp',
}

AeonFlamingDebrisTrail = {
       ModPath .. 'AeonFlamingDebrisFire.bp',
       ##ModPath .. 'AeonFlamingDebrisSmoke.bp',
}

SeraFlamingDebrisLandImpact = {
       ##ModPath .. 'dust_emit.bp',
	   ModPath .. 'SeraT2_electricity.bp',
       ##ModPath .. 'AeonT2_smoke.bp',
}

SeraFlamingDebrisTrail = {
       ModPath .. 'SeraFlamingDebrisFire.bp',
       ##ModPath .. 'AeonFlamingDebrisSmoke.bp',
}
AhwassaFlamingDebrisTrail  = {
       ModPath .. 'AhwassaFlamingDebrisFire.bp',
       ##ModPath .. 'AeonFlamingDebrisSmoke.bp',
}
DebrisSplashyWater = {
    ##EmtBpPath .. 'Splashy_Ripples_ring_01_emit.bp',
    ##EmtBpPath .. 'Splashy_Plume_01_emit.bp',
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
    ##ModPath .. 'Aeon_Spark_air.bp',
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'Debris_aura.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
	##ModPath .. 'AuraWaveT2_Air.bp',
}
AsswasherDebrisImpact = {
	ModPath .. 'AeonT2_smoke.bp',
	ModPath .. 'SeraT2_electricity.bp',
    ModPath .. 'SeraT3_electricity2.bp',
	ModPath .. 'Medium_test_random.bp',
	ModPath .. 'Medium_test_sonic.bp',
}