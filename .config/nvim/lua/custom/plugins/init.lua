return {
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettierd,
                },
            })
            require("mason-null-ls").setup({
                ensure_installed = {
                    "prettierd",
                }
            })
        end,
    },
    {
        'phaazon/hop.nvim',
        lazy = false,
        branch = 'v2',
        config = function()
            require("hop").setup()
            -- normal mode (easymotion-like)
            vim.api.nvim_set_keymap("n", "b", "<cmd>HopWordCurrentLineBC<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "w", "<cmd>HopWordCurrentLineAC<CR>", { noremap = true })

            -- visual mode (easymotion-like)
            vim.api.nvim_set_keymap("v", "w", "<cmd>HopWordCurrentLineAC<CR>", { noremap = true })
            vim.api.nvim_set_keymap("v", "b", "<cmd>HopWordCurrentLineBC<CR>", { noremap = true })
        end

    },

    {
        "windwp/nvim-autopairs",
        -- Optional dependency
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            require("nvim-autopairs").setup {}
            -- If you want to automatically add `(` after selecting a function or method
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    { "nvim-tree/nvim-web-devicons" },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "html",
            "css",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
}
