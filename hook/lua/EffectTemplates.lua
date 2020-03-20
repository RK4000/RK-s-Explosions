EmtBpPath = '/effects/emitters/'
ModPath = '/mods/rks_explosions/effects/Emitters/'
local toggle = import('/mods/rks_explosions/lua/Togglestuff.lua').toggle

function NukeShockwave(toggle)
    if toggle == 1 then
        return 'very_large_test_sonic_nuke.bp'
    else
        return 'nothing.bp'
    end
end

-- Fire Cloud Effects
FireCloudSml01 = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp',
}

FireCloudMed01 = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp',
}

-- Explosion Effects
Splashy = {
    ModPath .. 'Watersplash_s.bp',
    ModPath .. 'Water_pie_s.bp',
}

ExplosionSmallWater = {
    ModPath .. 'Watertower_s.bp',
    ModPath .. 'Water_pie_s.bp',
    ModPath .. 'Watersplash_s.bp',
}

ExplosionMediumWater = {
    ModPath .. 'Watertower_m.bp',
    ModPath .. 'Water_pie.bp',
    ModPath .. 'Watersplash_m.bp',
}

ExplosionSmallUnderWater = {
    ModPath .. 'Watertower_s.bp',
    ModPath .. 'Water_pie_s.bp',
    ModPath .. 'Watersplash_s.bp',
}

ExplosionMediumUnderWater = {
    ModPath .. 'Watertower_m.bp',
    ModPath .. 'Water_pie.bp',
    ModPath .. 'Watersplash_m.bp',
}

ExplosionLargeUnderWater = {
    ModPath .. 'Watertower_m.bp',
    ModPath .. 'Water_pie.bp',
    ModPath .. 'Watersplash_m.bp',
}

ExplosionLarge = {
    ModPath .. 'Large_test_smoke.bp',
    ModPath .. 'Large_test_fire.bp',
    ModPath .. 'Large_test_random.bp',
    ModPath .. 'Large_test_sonic.bp',
    ModPath .. 'residue_Very_Large_test_smoke.bp',
}

ExplosionSmallAir = {
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp',
}

ExplosionSmall = {
    ModPath .. 'dust_small_emit.bp',
    ModPath .. 'small_test_sonic.bp',
    ModPath .. 'small_test_fire.bp',
    ModPath .. 'small_test_random.bp',
    ModPath .. 'small_test_smoke.bp',
}

ExplosionMedium = {
    ModPath .. 'dust_emit.bp',
    ModPath .. 'Medium_test_smoke.bp',
    ModPath .. 'Medium_test_fire.bp',
    ModPath .. 'Medium_test_random.bp',
    ModPath .. 'Medium_test_sonic.bp',
}

TNukeRings01 = {
    EmtBpPath .. 'nuke_concussion_ring_01_emit.bp',
    EmtBpPath .. 'nuke_concussion_ring_02_emit.bp',
    EmtBpPath .. 'shockwave_01_emit.bp',
    EmtBpPath .. 'shockwave_smoke_01_emit.bp',
    ModPath .. NukeShockwave(toggle),
}

SIFInainoDetonate01 = {
    EmtBpPath .. 'seraphim_inaino_explode_01_emit.bp',        -- glow in air
    EmtBpPath .. 'seraphim_inaino_concussion_01_emit.bp',    -- ring
    EmtBpPath .. 'seraphim_inaino_concussion_02_emit.bp',    -- outward lines, faint add
    EmtBpPath .. 'seraphim_inaino_concussion_03_emit.bp',    -- ring slow
    EmtBpPath .. 'seraphim_inaino_explode_02_emit.bp',        -- faint plasma downward
    EmtBpPath .. 'seraphim_inaino_explode_03_emit.bp',        -- vertical plasma, ser7
    EmtBpPath .. 'seraphim_inaino_explode_04_emit.bp',        -- ring outward add oriented
    EmtBpPath .. 'seraphim_inaino_explode_05_emit.bp',        -- glow on ground, oriented
    EmtBpPath .. 'seraphim_inaino_explode_06_emit.bp',        -- fast flash in air
    EmtBpPath .. 'seraphim_inaino_explode_07_emit.bp',        -- long glow in air, oriented
    EmtBpPath .. 'seraphim_inaino_explode_08_emit.bp',        -- center plasma, ser7
    ModPath .. NukeShockwave(toggle),
}
-------------------------------------------------------------------------
--  TERRAN NUKE EMITTERS
-------------------------------------------------------------------------
TNukeRings01 = {
    EmtBpPath .. 'nuke_concussion_ring_01_emit.bp',
    EmtBpPath .. 'nuke_concussion_ring_02_emit.bp',
    EmtBpPath .. 'shockwave_01_emit.bp',
    EmtBpPath .. 'shockwave_smoke_01_emit.bp',
    ModPath .. NukeShockwave(toggle),
}

SIFExperimentalStrategicMissileDetonate01 = {
    EmtBpPath .. 'seraphim_expnuke_detonate_01_emit.bp',        -- upwards plasma darkening
    EmtBpPath .. 'seraphim_expnuke_detonate_02_emit.bp',        -- upwards plasma ser7
    EmtBpPath .. 'seraphim_expnuke_detonate_03_emit.bp',        -- non oriented glow
    EmtBpPath .. 'seraphim_expnuke_detonate_04_emit.bp',        -- oriented glow
    EmtBpPath .. 'seraphim_expnuke_concussion_01_emit.bp',        -- ring fast
    ModPath .. NukeShockwave(toggle),
}
