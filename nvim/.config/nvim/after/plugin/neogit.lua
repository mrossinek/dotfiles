local neogit = require("neogit")
require'diffview'.setup{}

neogit.setup({
    integrations = {
        diffview = true,
    },
})
