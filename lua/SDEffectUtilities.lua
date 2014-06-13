#****************************************************************************
#**
#**  File     :  /lua/EffectUtilities.lua
#**  Author(s):  Gordon Duclos
#**
#**  Summary  :  Effect Utility functions for scripts.
#**
#**  Copyright © 2006 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local util = import('utilities.lua')
local Entity = import('/lua/sim/Entity.lua').Entity
local EffectTemplate = import('/lua/EffectTemplates.lua')
local RandomFloat = import('/lua/utilities.lua').GetRandomFloat


##function CreateBoneEffectsOffsetRK( obj, bone, army, EffectTable, x, y, z )
##    local emitters = {}
##    for k, v in EffectTable do
##        table.insert(emitters,CreateEmitterAtBone( obj, bone, army, v ):OffsetEmitter(x/10, y/10, z/10))
##    end
##    return emitters
##end














































