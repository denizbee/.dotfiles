return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                require("null-ls").builtins.formatting.prettierd,
            },
        })
    end
}
