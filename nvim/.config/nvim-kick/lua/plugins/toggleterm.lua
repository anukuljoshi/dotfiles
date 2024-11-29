return {

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function ()
            require("toggleterm").setup({
                open_mapping = [[<C-p>]],
                hide_numbers = false,
                start_in_insert = true,
                insert_mappings = false,
                terminal_mappings = true,
                direction = "float",
                float_opts = {
                    -- The border key is *almost* the same as "nvim_open_win"
                    -- see :h nvim_open_win for details on borders however
                    -- the "curved" border is a custom border type
                    -- not natively supported but implemented in this plugin.
                    border = "curved"
                },
            })
        end
    },

}
