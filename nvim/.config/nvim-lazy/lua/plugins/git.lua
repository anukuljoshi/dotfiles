return {

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = function()
            local neogit = require("neogit")
            neogit.setup({
                commit_editor = {
                    kind = "split",
                    show_staged_diff = false,
                    -- Accepted values:
                    -- "split" to show the staged diff below the commit editor
                    -- "vsplit" to show it to the right
                    -- "split_above" Like :top split
                    -- "vsplit_left" like :vsplit, but open to the left
                    -- "auto" "vsplit" if window would have 80 cols, otherwise "split"
                    staged_diff_split_kind = "vsplit",
                },
            })

            vim.keymap.set("n", "<leader>hv", function()
                neogit.open({ kind = "vsplit" })
            end, {
                desc = "Open Neogit in vertical split",
            })

            vim.keymap.set("n", "<leader>hc", function()
                neogit.open({ "commit" })
            end, {
                desc = "Open Neogit for commit",
            })
        end,
    },

    {
        -- git
        "lewis6991/gitsigns.nvim",
        opts = {},
        config = function()
            require("gitsigns").setup({
                signs = {
                    add          = { text = "┃" },
                    change       = { text = "┃" },
                    delete       = { text = "_" },
                    topdelete    = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked    = { text = "┆" },
                },
                signs_staged = {
                    add          = { text = "┃" },
                    change       = { text = "┃" },
                    delete       = { text = "_" },
                    topdelete    = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked    = { text = "┆" },
                },
                signs_staged_enable = true,
                signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text = true,
                    -- "eol" | "overlay" | "right_align"
                    virt_text_pos = "eol",
                    delay = 500,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            })

            local gs = package.loaded.gitsigns
            -- Navigation
            vim.keymap.set("n", "]g", function()
                if vim.wo.diff then
                    return "]g"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            vim.keymap.set("n", "[g", function()
                if vim.wo.diff then
                    return "[g"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            -- Actions
            vim.keymap.set("n", "<leader>ha", gs.stage_hunk)
            vim.keymap.set("n", "<leader>hA", gs.stage_buffer)
            vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk)
            vim.keymap.set("n", "<leader>hr", gs.reset_hunk)
            vim.keymap.set("n", "<leader>hR", gs.reset_buffer)
            vim.keymap.set("n", "<leader>hp", "<Cmd>Gitsigns preview_hunk_inline<CR>", {})
            vim.keymap.set("n", "<leader>hb", gs.toggle_current_line_blame, {})
            vim.keymap.set("n", "<leader>hB", function()
                gs.blame_line({ full = true })
            end)
            vim.keymap.set("n", "<leader>hd", gs.diffthis)
        end,
    },
}
