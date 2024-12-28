return {
    {
        "danymat/neogen",
        input_after_comment = false,
        config = function()
            require("neogen").setup({})
            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap("n", "<leader>nf", ":lua require('neogen').generate({ type = 'func'})<CR>", opts)
            vim.api.nvim_set_keymap("n", "<leader>nc", ":lua require('neogen').generate({ type = 'class'})<CR>", opts)
            vim.api.nvim_set_keymap("n", "<leader>nt", ":lua require('neogen').generate({ type = 'type'})<CR>", opts)
        end,
    },
}
