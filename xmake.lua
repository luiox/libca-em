set_project("libca")
set_version("0.0.1")
set_xmakever("2.8.3")

set_languages("c99")

add_rules("mode.debug", "mode.release")
add_rules("plugin.compile_commands.autoupdate", {outputdir = "."})

target("ringbuffer")
    set_kind("static")
    add_includedirs("include")
    add_files("src/ringbuffer.c")

target("ringbuffer-test")
    set_kind("binary")
    add_files("tests/test_ringbuffer.c")
    add_includedirs("include")
    add_deps("ringbuffer")
    add_links("ringbuffer")

target("doubly_linked_list")
    set_kind("static")
    add_includedirs("include")
    add_files("src/doubly_linked_list.c")

target("doubly_linked_list-test")
    set_kind("binary")
    add_files("tests/test_doubly_linked_list.c")
    add_includedirs("include")
    add_deps("doubly_linked_list")
    add_links("doubly_linked_list")

target("stack")
    set_kind("static")
    add_includedirs("include")
    add_files("src/stack.c")

target("stack-test")
    set_kind("binary")
    add_files("tests/test_stack.c")
    add_includedirs("include")
    add_deps("stack")
    add_links("stack")

target("queue")
    set_kind("static")
    add_includedirs("include")
    add_files("src/queue.c")
    add_deps("doubly_linked_list")
    add_links("doubly_linked_list")

target("queue-test")
    set_kind("binary")
    add_files("tests/test_queue.c")
    add_includedirs("include")
    add_deps("queue")
    add_links("queue")
    add_deps("doubly_linked_list")
    add_links("doubly_linked_list")

target("string")
    set_kind("static")
    add_includedirs("include")
    add_files("src/string.c")

target("string-test")
    set_kind("binary")
    add_files("tests/test_string.c")
    add_includedirs("include")
    add_deps("string")
    add_links("string")


--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro definition
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

