return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      -- Nvim-tree toggle shortcut
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'File Tree' })
      local function nvim_tree_on_attach(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowa }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
      end

      require('nvim-tree').setup {
        git = {
          enable = false,
        },
        on_attach = nvim_tree_on_attach,
      }
    end,
  },
}
