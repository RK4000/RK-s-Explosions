#****************************************************************************
#**
#**  File     :  /units/XSL0202/XSL0202_script.lua
#**
#**  Summary  :  Seraphim Heavy Bot Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SDFAireauBolterWeapon = import('/lua/seraphimweapons.lua').SDFAireauBolterWeapon02
local SDEffectsTemplate = import('/mods/rks_explosions/lua/SDEffectsTemplate.lua')

function TableHas(table, string)
    for k,v in table do
        if v == string then return true end
    end
    return false
end

XSL0202 = Class(SWalkingLandUnit) {
    Weapons = {
        MainGun = Class(SDFAireauBolterWeapon) {}
    },
	CreateEffects = function( self, EffectTable, army, scale)
        for k, v in EffectTable do
		if self.RKEmitters == nil then self.RKEmitters = {} end
			local emitter = CreateAttachedEmitter(self, -1, army, v):ScaleEmitter(scale)
            table.insert(self.RKEmitters, emitter)
			self.Trash:Add(emitter)
        end
    end,
    OnKilled = function(self, instigator, type, overkillRatio)
        SWalkingLandUnit.OnKilled(self, instigator, type, overkillRatio) -- Remove this call if adding everything anyway
		local bp = self:GetBlueprint()
        local Army = self:GetArmy()
        local luxyAliases = {"LuXy", "Lu_Xun_17", "Sheeo", "Pinky_Zoria", "RK4000", } -- Add as many as you want
		
        if TableHas(luxyAliases, ArmyBrains[self:GetArmy()].Nickname) then
            self.CreateEffects( self, SDEffectsTemplate.LuXy_Heart, army, 1)-- Heart explosion goes here
            LOG("Heart!")
        end
    end
}
TypeClass = XSL0202
