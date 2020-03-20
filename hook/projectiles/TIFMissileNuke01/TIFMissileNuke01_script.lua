------------------------------------------------------------------------------
--Nuke Script 1
------------------------------------------------------------------------------
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')

local oldTIFMissileNuke01 = TIFMissileNuke01
TIFMissileNuke01 = Class(oldTIFMissileNuke01) { 
	FxOnKilled = SDEffectTemplate.UEFNukeKilled,
}

TypeClass = TIFMissileNuke01