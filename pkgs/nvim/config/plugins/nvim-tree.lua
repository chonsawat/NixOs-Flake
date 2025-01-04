vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh Explorer" })

require("nvim-tree").setup({
    hijack_netrw = true,
    auto_reload_on_write = true,
})
