return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                update_cwd = true,
                hijack_cursor = true,
                git = {
                    ignore = false,
                },
                actions = {
                    open_file = {
                        resize_window = true,
                    },
                },
                view = {
                    width = 32,
                },
                renderer = {
                    highlight_git = true,
                    root_folder_modifier = ':t',
                    icons = {
                        glyphs = {
                            default = '',
                            symlink = '',
                            bookmark = '◉',
                            git = {
                                unstaged = '',
                                staged = '',
                                unmerged = '',
                                renamed = '',
                                deleted = '',
                                untracked = '',
                                ignored = '',
                            },
                            folder = {
                                default = '',
                                open = '',
                                symlink = '',
                            },
                        },
                        show = {
                            git = false,
                            file = true,
                            folder = true,
                            folder_arrow = false,
                        },
                    },
                    indent_markers = {
                        enable = true,
                    },
                },
            })
        end,
    },
    {

        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.ai').setup { n_lines = 500 }
            require('mini.surround').setup()
        end

    },
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
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        opts = {
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")

            -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })
        end,
        keys = {
            { "]]", desc = "Next Reference" },
            { "[[", desc = "Prev Reference" },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
}
