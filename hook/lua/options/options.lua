local newVideoSettings = {
    {
        title = "<LOC OPTIONS_001>Fidelity Presets",
        key = 'fidelity_presets',
        type = 'toggle',
        default = 4,
        update = function(control,value)
            logic = import('/lua/options/optionsLogic.lua')
            
            aaoptions = GetAntiAliasingOptions()

            aamax = 0
            aamed = 0
            if 0 < table.getn(aaoptions) then
                aahigh = aaoptions[table.getn(aaoptions)]
                aamed = aaoptions[math.ceil(table.getn(aaoptions)/2)]
            end
            
            if 0 == value then
                logic.SetValue('fidelity',0,true)
                logic.SetValue('shadow_quality',0,true)
                logic.SetValue('texture_level',2,true)
                logic.SetValue('antialiasing',0,true)
                logic.SetValue('level_of_detail',0,true)
                logic.SetValue('bloom_render',0,true)
                logic.SetValue('render_skydome',0,true)
            elseif 1 == value then
                logic.SetValue('fidelity',1,true)
                logic.SetValue('shadow_quality',1,true)
                logic.SetValue('texture_level',1,true)
                logic.SetValue('antialiasing',0,true)
                logic.SetValue('level_of_detail',1,true)
                logic.SetValue('bloom_render',0,true)
                logic.SetValue('render_skydome',1,true)
            elseif 2 == value then
                logic.SetValue('fidelity',2,true)
                logic.SetValue('shadow_quality',2,true)
                logic.SetValue('texture_level',0,true)
                logic.SetValue('antialiasing',aamed,true)
                logic.SetValue('level_of_detail',2,true)
                logic.SetValue('bloom_render',1,true)
                logic.SetValue('render_skydome',1,true)
            elseif 3 == value then
                logic.SetValue('fidelity',2,true)
                logic.SetValue('shadow_quality',3,true)
                logic.SetValue('texture_level',0,true)
                logic.SetValue('antialiasing',aahigh,true)
                logic.SetValue('level_of_detail',2,true)
                logic.SetValue('bloom_render',1,true)
                logic.SetValue('render_skydome',1,true)
            else
            end
        end,
        set = function(key,value,startup)
        end,
        custom = {
            states = {
                { text = "<LOC _Low>", key = 0 },
                { text = "<LOC _Medium>", key = 1 },
                { text = "<LOC _High>", key = 2 },
                { text = "<LOC _Ultra>", key = 3 },
                { text = "<LOC _Custom>", key = 4 },
            },
        },
    },
    {
        title = "<LOC OPTIONS_0169>Bloom Render",
        key = 'bloom_render',
        type = 'toggle',
        default = 0,
        update = function(control,value)
            import('/lua/options/optionsLogic.lua').SetValue('fidelity_presets',4,true)
        end,
        set = function(key,value,startup)
            if 0 == value then
                ConExecute("ren_Bloom false")
                ConExecute("ren_BloomGlowCopyScale 7.0000")
                ConExecute("ren_BloomBlurCount 1")
                ConExecute("ren_BloomBlurKernelScale 1.5000")
            elseif 1 == value then
                ConExecute("ren_bloom true")
                ConExecute("ren_BloomGlowCopyScale 2.0000")
                ConExecute("ren_BloomBlurCount 2")
                ConExecute("ren_BloomBlurKernelScale 1.5000")
            end
        end,
        custom = {
            states = {
                {text = "<LOC _Off>", key = 0 },
                {text = "<LOC _On>", key = 1 },
            },
        },
    },
}

for _, newItem in newVideoSettings do
    for k, item in options.video.items do
        if item.key == newItem.key then
            k = newItem
            break
        end
    end
end

