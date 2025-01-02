require('maven').setup({
    executable = "mvn",
    cwd = vim.fnd.getcwd(),
    conmands = {
        { cmd = { "clean", "compile" }, desc = "clean then compile" }
    }
})
