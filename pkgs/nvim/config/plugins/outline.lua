-- Example mapping to toggle outline
vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
    { desc = "Toggle Outline" })

require("outline").setup {
    -- Your setup opts here (leave empty to use defaults)
    priority = { 'lsp', 'coc', 'markdown', 'norg', 'ctags' },
    -- ctags provider options
    ctags = {
        program = 'ctags',
        filetypes = {
            ['c++'] = {
            },
        },
    },
    event = "VeryLazy",
    dependencies = {
        'epheien/outline-ctags-provider.nvim'
    }
}
