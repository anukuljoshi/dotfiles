return {
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        config = function()
            local hop = require("hop")
            hop.setup({})
            Map(
                "", "s",
                function()
                    hop.hint_char1()
                end,
                {}
            )
            Map(
                "", "<leader>gg",
                function()
                    hop.hint_vertical()
                end,
                {}
            )
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        opts = {},
    }
}