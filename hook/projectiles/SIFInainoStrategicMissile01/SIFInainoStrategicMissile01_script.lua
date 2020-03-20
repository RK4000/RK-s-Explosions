------------------------------------------------------------------------------
--Nuke Script 1
------------------------------------------------------------------------------
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

local oldSIFInainoStrategicMissile01 = SIFInainoStrategicMissile01
SIFInainoStrategicMissile01 = Class(oldSIFInainoStrategicMissile01) { 
    FxOnKilled = SDEffectTemplate.SeraNukeKilled,
}

TypeClass = SIFInainoStrategicMissile01
