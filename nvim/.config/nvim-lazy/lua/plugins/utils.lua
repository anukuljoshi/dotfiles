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

    -- {
    --     "leath-dub/snipe.nvim",
    --     keys = {
    --         {"<leader><leader>", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
    --     },
    --     opts = {
    --         ui = {
    --             max_width = -1, -- -1 means dynamic width
    --             -- Where to place the ui window
    --             -- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
    --             position = "center",
    --         },
    --         hints = {
    --             -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
    --             dictionary = "sadflewcmpghio",
    --         },
    --         navigate = {
    --             -- When the list is too long it is split into pages
    --             -- `[next|prev]_page` options allow you to navigate
    --             -- this list
    --             next_page = "J",
    --             prev_page = "K",
    --
    --             -- You can also just use normal navigation to go to the item you want
    --             -- this option just sets the keybind for selecting the item under the
    --             -- cursor
    --             under_cursor = "<cr>",
    --
    --             -- In case you changed your mind, provide a keybind that lets you
    --             -- cancel the snipe and close the window.
    --             cancel_snipe = "<esc><esc>",
    --         },
    --         -- Define the way buffers are sorted by default
    --         -- Can be any of "default" (sort buffers by their number) or "last" (sort buffers by last accessed)
    --         sort = "last"
    --     }
    -- }
}
