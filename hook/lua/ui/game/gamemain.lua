do
    local mgfx_CreateUI = CreateUI
    local Prefs = import('/lua/user/prefs.lua')
    local curOptions = Prefs.GetFromCurrentProfile('options')

    function CreateUI(isReplay)
        local bloomvalue = Prefs.GetOption("bloom_render")
        if 0 == bloomvalue then
            ConExecute("ren_Bloom false")
            ConExecute("ren_BloomGlowCopyScale 7.0000")
            ConExecute("ren_BloomBlurCount 1")
            ConExecute("ren_BloomBlurKernelScale 1.5000")
            ConExecute("ren_shadowcoeff 2.65")
            ConExecute("ren_shadowsize 768")
        elseif 1 == bloomvalue then
            ConExecute("ren_bloom true")
            ConExecute("ren_BloomGlowCopyScale 2.0000")
            ConExecute("ren_BloomBlurCount 2")
            ConExecute("ren_BloomBlurKernelScale 1.5000")
            ConExecute("ren_shadowcoeff 2.65")
            ConExecute("ren_shadowsize 768")
        end
        LOG('*RKs bloomvalue: ', repr(bloomvalue))

        mgfx_CreateUI(isReplay)
    end
end