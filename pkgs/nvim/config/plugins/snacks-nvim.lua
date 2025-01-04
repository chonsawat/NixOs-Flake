local snacks = require("snacks")

if snacks. then
    
end

snacks.setup({
    opts = {
        dashboard = { enabled = true },
        bigfile = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
})

snacks.dashboard.open({})
