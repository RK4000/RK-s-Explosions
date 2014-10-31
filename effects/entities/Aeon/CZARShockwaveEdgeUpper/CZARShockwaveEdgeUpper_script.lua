#
# script for projectile BoneAttached
#
local EmitterProjectile = import('/lua/sim/defaultprojectiles.lua').EmitterProjectile
local SDEffectTemplate = import('/mods/rks_explosions/lua/SDEffectTemplates.lua')
local NEffectTemplate = import('/mods/rks_explosions/lua/NEffectTemplates.lua')

local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function GetEffectTemplateFile(toggle)
	if toggle == 1 then
		return SDEffectTemplate
	else 
		return NEffectTemplate
	end
end

CZARShockwaveEdgeUpper = Class(EmitterProjectile) {
    FxTrails = GetEffectTemplateFile(toggle).CZARShockwaveEdgeUpper,
	FxImpact = GetEffectTemplateFile(toggle).CZARShockwaveHit,
	FxImpactLand = GetEffectTemplateFile(toggle).CZARShockwaveHit,
	FxImpactProp = GetEffectTemplateFile(toggle).CZARShockwaveHit,
	FxImpactUnit = GetEffectTemplateFile(toggle).CZARShockwaveHit,
}

TypeClass = CZARShockwaveEdgeUpper