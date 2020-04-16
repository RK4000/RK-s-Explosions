--#****************************************************************************
--#**
--#**  File     :  /rks_explosions/lua/SDUtilities
--#**  Author(s):  RK4000
--#**
--#**  Summary  :  Utility functions for scripts
--#**
--#**  Copyright © 2020 RK Powered Games, Inc.  All rights reserved.
--#****************************************************************************

local Util = import('/lua/utilities.lua')
local GetRandomFloat = Util.GetRandomFloat
local GetRandomInt = Util.GetRandomInt
local GetRandomOffset = Util.GetRandomOffset

function GetRandomFloatWithAvoidMiddleFactor( nMin, nMax, avoidMiddlePcnt )

    local avoidMiddleFactor = avoidMiddlePcnt / 100
    
    local nMinLow = nMin * avoidMiddleFactor
    local nMinHigh = nMin
    
    local nMaxLow = nMax * avoidMiddleFactor
    local nMaxHigh = nMax
  
    local randomPosNeg = GetRandomInt(0, 1)
    
    --LOG('avoidMiddleFactor:', avoidMiddleFactor)
    --LOG('nMinLow:', nMinLow)
    --LOG('nMinHigh:', nMinHigh)
    --LOG('nMaxLow:', nMaxLow)
    --LOG('nMaxHigh:', nMaxHigh)
    --LOG('Pos/Neg 0/1:', randomPosNeg)
    --LOG('BREAK')
    
    if randomPosNeg == 1 then
        return (GetRandomFloat(nMinLow, nMinHigh))
    else
        return (GetRandomFloat(nMaxLow, nMaxHigh))
    end
    
end