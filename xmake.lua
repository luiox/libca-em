set_project("libca-em")
set_version("0.0.1")
set_xmakever("2.8.3")

add_rules("mode.debug", "mode.release")

if is_plat("windows") then
    -- Xmake maps c99 to /TP for MSVC; C11 keeps these C99-compatible sources in C mode.
    set_languages("c11")
    add_cflags("/utf-8")
else
    set_languages("c99")
end

option("with_demo")
    set_default(false)
    set_showmenu("enable demo targets")
option_end()

add_includedirs("$(projectdir)/src", { public = true })

includes("src/em_base")
includes("src/em_bus")
includes("src/em_component")
includes("src/em_crypto")
includes("src/em_driver")
includes("src/em_dstream")
includes("src/em_eimui")
includes("src/em_format")
includes("src/em_log")
includes("src/em_motion")
includes("src/em_mpool")
includes("src/em_ota")
includes("src/em_platform")
includes("src/em_protocol")
includes("src/em_shell")
includes("src/em_test")
includes("src/em_util")

includes("unittests")

if has_config("with_demo") then
    includes("demo")
end
