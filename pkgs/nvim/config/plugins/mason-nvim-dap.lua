-- ensure the java debug adapter is installed
require("mason-nvim-dap").setup({
    ensure_installed = { "java-debug-adapter", "java-test" }
})
