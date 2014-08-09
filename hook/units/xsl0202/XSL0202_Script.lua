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
    OnKilled = function(self, instigator, type, overkillRatio)
        SWalkingLandUnit.OnKilled(self, instigator, type, overkillRatio) -- Remove this call if adding everything anyway

        local luxyAliases = {"LuXy", "lu_xun", "Sheeo"} -- Add as many as you want

        if TableHas(luxyAliases, ArmyBrains[self:GetArmy()].Nickname) then
            -- Heart explosion goes here
            LOG("Heart!")
        end
    end
}
TypeClass = XSL0202
