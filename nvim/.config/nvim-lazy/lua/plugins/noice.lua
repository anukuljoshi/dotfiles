return {

    {
        "folke/noice.nvim",
        opts = function(_, opts)
            opts.presets = {
                command_palette = {
                    views = {
                        cmdline_popup = {
                            position = {
                                row = "40%",
                                col = "50%",
                            },
                            size = {
                                min_width = 80,
                                width = "auto",
                                height = "auto",
                            },
                        },
                    },
                },
            }
        end,
    },

}
