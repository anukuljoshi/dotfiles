return {

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
        config = function ()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt" , "vim" },
            })
        end
    },

    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html", "javascript", "typescript", "javascriptreact",
            "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript",
            "xml",
            "php",
            "markdown",
            "astro", "glimmer", "handlebars", "hbs"
        },
        lazy = true,
        config = true,
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "chentoast/marks.nvim",
        config = function ()
            require("marks").setup({
                refresh_interval = 250,
            })
            vim.keymap.set("n", "<leader>dm", "<Cmd>delmarks a-z<CR>")
            vim.keymap.set("n", "<leader>dM", "<Cmd>delm! | delm A-Z0-9<CR>")
        end
    },

    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        config = function()
            local hop = require("hop")
            hop.setup({})
            vim.keymap.set(
                "", "s",
                function()
                    hop.hint_char1()
                end,
                {}
            )
        end
    },

}
