return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)

            -- remove diagnostics from lualine_c
            table.remove(opts.sections.lualine_c, 2)
            -- remove lsp symbols from lualine_c
            table.remove(opts.sections.lualine_c)

            -- remove all from lualine_x
            opts.sections.lualine_x = {}
            -- add git in lualine_x
            table.insert(opts.sections.lualine_x, "diff")
            -- add diagnostics in lualine_x
            table.insert(opts.sections.lualine_x, "diagnostics")

            -- remove all from lualine_z
            opts.sections.lualine_z = {}
        end,
    },
}
