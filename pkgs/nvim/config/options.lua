
-- General
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line number
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 8

-- Tab spacing
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Behaviors
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus" -- enable clipboard access
vim.opt.conceallevel = 0 -- show concealedd characters
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a" -- enable mouse support
vim.opt.showmode = false -- hide mode display
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000 -- 1 sec waiting mapped
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- completion faster
vim.opt.writebackup = false
vim.opt.cursorline = true -- highlight current line

-- Searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Vim.API
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

