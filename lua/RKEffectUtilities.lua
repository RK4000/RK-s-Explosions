--RKS_EXPLOSIONS
function CreateBoneEffectsAttached( obj, bone, army, EffectTable )
    local emitters = {}
    for k, v in EffectTable do
        table.insert(emitters,CreateAttachedEmitter( obj, bone, army, v ))
    end
    return emitters
end

function CreateBoneEffectsAttachedWithBag( obj, bone, army, EffectTable, scale, BagName )
    local emitters = {}
    for k, v in EffectTable do
			if obj[BagName] == nil then 
				obj[BagName] = {} 
			end
        local BoneEmitters1 = CreateAttachedEmitter( obj, bone, army, v ):ScaleEmitter(scale)
		table.insert(obj[BagName], BoneEmitters1)
		obj.Trash:Add(BoneEmitters1)
    end
    return BagName
end

function CreateBoneEffectsScaled( obj, bone, army, EffectTable, scale )
    local emitters = {}
    for k, v in EffectTable do
        table.insert(emitters,CreateEmitterAtBone( obj, bone, army, v ):ScaleEmitter(scale))
    end
    return emitters
end

function CreateScaledBoneEffectsOffset( obj, bone, army, EffectTable, x, y, z, scale )
    local emitters = {}
    for k, v in EffectTable do
        table.insert(emitters,CreateEmitterAtBone( obj, bone, army, v ):OffsetEmitter(x, y, z):ScaleEmitter(scale))
    end
    return emitters
end

--RKS_EXPLOSIONS