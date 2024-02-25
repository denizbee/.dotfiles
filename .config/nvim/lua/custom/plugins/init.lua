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
                    null_ls.builtins.formatting.autopep8,
                },
            })
            require("mason-null-ls").setup({
                ensure_installed = { "prettierd", "autopep8", }
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
        "Exafunction/codeium.vim",
        event = "BufEnter",
        config = function()
            vim.g.codeium_no_map_tab = 1
            vim.g.codeium_enabled = false
            vim.keymap.set('i', '<c-f>', function() return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end
    },

    -- {
    --     "github/copilot.vim",
    --     event = "InsertEnter",
    --     config = function()
    --         vim.g.copilot_no_tab_map = true
    --         vim.g.copilot_enabled = false
    --         vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    --     end,
    -- },
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
        "xiyaowong/transparent.nvim",
        lazy = false,
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
