-- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "jdtls" },
})
