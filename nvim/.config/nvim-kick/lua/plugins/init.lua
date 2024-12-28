return {
    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        config = function()
            local hop = require("hop")
            hop.setup({})
            vim.keymap.set("", "s", function()
                hop.hint_char1()
            end, {})
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
            "rescript",
            "xml",
            "php",
            "markdown",
            "astro",
            "glimmer",
            "handlebars",
            "hbs",
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
        end,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },
}
