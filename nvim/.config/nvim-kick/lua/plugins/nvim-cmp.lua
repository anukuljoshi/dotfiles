return {
    { -- Autocompletion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                "L3MON4D3/LuaSnip",
                build = function()
                    return "make install_jsregexp"
                end,
                dependencies = {
                    -- Optional: Add friendly-snippets if you want pre-made snippets
                    -- "rafamadriz/friendly-snippets",
                },
            },
            "saadparwaiz1/cmp_luasnip", -- CMP source for LuaSnip
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "hrsh7th/cmp-path", -- Path completions
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Setup LuaSnip
            luasnip.config.setup({
                history = true,
                updateevents = "TextChanged,TextChangedI",
            })

            -- Setup nvim-cmp
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- Use LuaSnip for snippet expansion
                    end,
                },

                -- -- Configure completion window options
                -- window = {
                --     -- Configure the completion menu
                --     completion = cmp.config.window.bordered(),
                --     -- Configure the documentation window (hover)
                --     documentation = cmp.config.window.bordered(),
                -- },

                completion = {
                    completeopt = "menu,menuone,noselect",
                },

                -- Key mappings for autocompletion
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),

                    -- Snippet navigation
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                }),

                -- Define completion sources
                sources = {
                    { name = "nvim_lsp" }, -- LSP completions
                    { name = "luasnip" }, -- Snippet completions
                    { name = "path" }, -- Path completions
                },
            })
        end,
    },
}
