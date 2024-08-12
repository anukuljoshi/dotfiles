local function removeAll(T)
    for k in pairs(T) do
        T[k] = nil
    end
end

return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            -- remove diagnostics from lualine_c
            table.remove(opts.sections.lualine_c, 2)
            -- remove lsp symbols from lualine_c
            table.remove(opts.sections.lualine_c)

            -- store diff from lualine_x in temp var
            local lualine_diff = table.remove(opts.sections.lualine_x)

            -- remove all from lualine_x
            removeAll(opts.sections.lualine_x)

            -- insert diagnostics in lualine_x
            table.insert(opts.sections.lualine_x, "diagnostics")

            -- remove values from lualine_y
            removeAll(opts.sections.lualine_y)

            -- insert diff info in lualine_y
            table.insert(opts.sections.lualine_y, lualine_diff)

            -- remove values from lualine_z
            removeAll(opts.sections.lualine_z)
            table.insert(opts.sections.lualine_z, { "location" })
        end,
    },
}
