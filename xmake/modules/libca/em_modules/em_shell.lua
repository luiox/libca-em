-- em_shell module handler

local source_handler = import("libca.em_source_handler")

function get_handler()
    return source_handler.make({
        name = "em_shell",
        deps = {"em_base"},
        sources = {"shell.c"}
    })
end
