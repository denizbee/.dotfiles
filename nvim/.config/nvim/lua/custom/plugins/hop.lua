return {
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

}
