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

-- Linux 交叉 sysroot 的 libm 未并入 libc，数学函数（tanf/sqrtf 等）需显式链接；
-- 新版 glibc 原生环境可过，但 aarch64 交叉链接会报 undefined reference to `tanf'。
-- 注意：根作用域 add_syslinks 的 {plat=...} 过滤不生效（会把 m.lib 泄漏给 MSVC），
-- 必须用 is_plat 条件。
if is_plat("linux") then
    add_syslinks("m")
end

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
