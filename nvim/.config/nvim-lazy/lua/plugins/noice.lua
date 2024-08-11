return {

    {
        "folke/noice.nvim",
        opts = function(_, opts)
            opts.lsp.signature = {
                auto_open = { enabled = false },
                opts = {
                    size = { max_height = 2 },
                },
            }
        end,
        config = function ()
            require("noice").setup({
                views = {
                    cmdline_popup = {
                        position = {
                            row = "40%",
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = "65%",
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = 10,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                        },
                    },
                },
            })
        end
    },

}
