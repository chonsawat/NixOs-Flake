require("cyberdream").setup({
    transparent = true,
    italic_comments = false,
    borderless_telescope = false,
    cache = true,
    extensions = {
        telescope = true,
        notify = true,
        mini = true,
    },
    options = {
        colorscheme = "cyberdream"
    }
})

vim.cmd.colorscheme "cyberdream"
