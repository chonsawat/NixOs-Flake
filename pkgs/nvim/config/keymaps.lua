-- Main Keymap
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- On Blur Terminal and clear seacrh hightlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "Remove search highlights" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "Exit terminal mode"})

-- Paste without clear lastest copied
Map({"n", 'v', "i"}, "<leader>p", "\"_dP", {desc = "Paste without clear (lastest copied)"})

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {desc = "Move foucus to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {desc = "Move foucus to the right window"})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {desc = "Move foucus to the lower window"})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {desc = "Move foucus to the upper window"})

-- Resize window
Map("n", "<C-Up>", ":resize -2<CR>")
Map("n", "<C-Down>", ":resize +2<CR>")
Map("n", "<C-Left>", ":vertical resize -2<CR>")
Map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Resize terminal
Map("t", "<C-Up>", "<cmd>resize -2<CR>")
Map("t", "<C-Down>", "<cmd>resize +2<CR>")
Map("t", "<C-Left>", "<cmd>vertical resize -2<CR>")
Map("t", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Split
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", {desc = "[W]indow Split [V]ertical"})
vim.keymap.set("n", "<leader>wh", ":split<cr>", {desc = "[W]indow Split [H]orizontal"})

-- Indent
vim.keymap.set("v", "<", "<gv", {desc = "Indent left in visual mode"})
vim.keymap.set("v", ">", ">gv", {desc = "Indent right in visual mode"})

-- Quick List
vim.keymap.set({"v", "n"}, "<c-.>", ":cnext<cr>", {desc = "Quick list [N]ext"})
vim.keymap.set({"v", "n"}, "<C-,>", ":cprevious<cr>", {desc = "Quick list [P]revious"})

-- Reload nvim config
vim.keymap.set({"n"}, "<leader>sv", ":source $MYVIMRC<CR>", {desc = "Reload config nvim"})

-- Save file (force)
vim.keymap.set({"n", "v", "i"}, "<C-s>", "<cmd>w!<CR>", {desc = "Save file (force)"})

-- Move group of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Buffer
vim.keymap.set({"n"}, "th", "<cmd>bprev<enter>", {noremap = false})
vim.keymap.set({"n"}, "tl", "<cmd>bnext<enter>", {noremap = false})
vim.keymap.set({"n"}, "tk", "<cmd>bw!<enter>", {noremap = false})

-- Required Noice and Telescope
vim.keymap.set({"n"}, "<leader>st", function()
    require('telescope').extensions.notify.notify()
end, {desc = "Reload config nvim"})

-- Java call via maven
-- ~/.config/nvim/lua/plugins/floaterm.lua
