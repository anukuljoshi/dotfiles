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
        "sindrets/diffview.nvim",
        config = function()
            -- Lua
            local actions = require("diffview.actions")

            require("diffview").setup({
                view = {
                    -- Configure the layout and behavior of different types of views.
                    -- Available layouts:
                    --  'diff1_plain'
                    --    |'diff2_horizontal'
                    --    |'diff2_vertical'
                    --    |'diff3_horizontal'
                    --    |'diff3_vertical'
                    --    |'diff3_mixed'
                    --    |'diff4_mixed'
                    -- For more info, see |diffview-config-view.x.layout|.
                    merge_tool = {
                        -- Config for conflicted files in diff views during a merge or rebase.
                        -- UPDATED
                        layout = "diff3_mixed",
                        disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
                        winbar_info = true, -- See |diffview-config-view.x.winbar_info|
                    },
                },
                file_panel = {
                    win_config = { -- See |diffview-config-win_config|
                        -- UPDATED
                        position = "right",
                        width = 35,
                        win_opts = {},
                    },
                },
                keymaps = {
                    disable_defaults = false, -- Disable the default keymaps
                    view = {
                        -- The `view` bindings are active in the diff buffers, only when the current
                        -- tabpage is a Diffview.
                        -- UPDATED
                        {
                            "n", "]f", actions.select_next_entry, { desc = "Open the diff for the next file" },
                        },
                        -- UPDATED
                        {
                            "n", "[f", actions.select_prev_entry, { desc = "Open the diff for the previous file" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>gf", actions.goto_file_edit, { desc = "Open the file in the previous tabpage" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>gs", actions.goto_file_split, { desc = "Open the file in a new split" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>gt", actions.goto_file_tab, { desc = "Open the file in a new tabpage" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>b", actions.focus_files, { desc = "Bring focus to the file panel" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>e", function ()
                                actions.toggle_files()
                                vim.cmd("wincmd =")
                            end, { desc = "Toggle the file panel." },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>gl", actions.cycle_layout, { desc = "Cycle through available layouts." },
                        },
                        {
                            "n", "<leader>co", actions.conflict_choose("ours"), { desc = "Choose the OURS version of a conflict" },
                        },
                        {
                            "n", "<leader>ct", actions.conflict_choose("theirs"), { desc = "Choose the THEIRS version of a conflict" },
                        },
                        {
                            "n", "<leader>cb", actions.conflict_choose("base"), { desc = "Choose the BASE version of a conflict" },
                        },
                        {
                            "n", "<leader>ca", actions.conflict_choose("all"), { desc = "Choose all the versions of a conflict" },
                        },
                        {
                            "n", "<leader>cx", actions.conflict_choose("none"), { desc = "Delete the conflict region" },
                        },
                        {
                            "n", "<leader>cO", actions.conflict_choose_all("ours"), { desc = "Choose the OURS version of a conflict for the whole file" },
                        },
                        {
                            "n", "<leader>cT", actions.conflict_choose_all("theirs"), { desc = "Choose the THEIRS version of a conflict for the whole file" },
                        },
                        {
                            "n", "<leader>cB", actions.conflict_choose_all("base"), { desc = "Choose the BASE version of a conflict for the whole file" },
                        },
                        {
                            "n", "<leader>cA", actions.conflict_choose_all("all"), { desc = "Choose all the versions of a conflict for the whole file" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>cX", actions.conflict_choose_all("none"), { desc = "Delete the conflict region for the whole file" },
                        },
                    },
                    file_panel = {
                        {
                            "n", "j", actions.select_next_entry, { desc = "Open the diff for the next file" },
                        },
                        -- UPDATED
                        {
                            "n", "k", actions.select_prev_entry, { desc = "Open the diff for the previous file" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>gf", actions.goto_file_edit, { desc = "Open the file in the previous tabpage" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>gs", actions.goto_file_split, { desc = "Open the file in a new split" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>gt", actions.goto_file_tab, { desc = "Open the file in a new tabpage" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>b", actions.focus_files, { desc = "Bring focus to the file panel" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>e", function ()
                                actions.toggle_files()
                                vim.cmd("wincmd =")
                            end, { desc = "Toggle the file panel." },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>gl", actions.cycle_layout, { desc = "Cycle through available layouts." },
                        },
                        {
                            "n", "<leader>co", actions.conflict_choose("ours"), { desc = "Choose the OURS version of a conflict" },
                        },
                        {
                            "n", "<leader>ct", actions.conflict_choose("theirs"), { desc = "Choose the THEIRS version of a conflict" },
                        },
                        {
                            "n", "<leader>cb", actions.conflict_choose("base"), { desc = "Choose the BASE version of a conflict" },
                        },
                        {
                            "n", "<leader>ca", actions.conflict_choose("all"), { desc = "Choose all the versions of a conflict" },
                        },
                        {
                            "n", "<leader>cx", actions.conflict_choose("none"), { desc = "Delete the conflict region" },
                        },
                        {
                            "n", "<leader>cO", actions.conflict_choose_all("ours"), { desc = "Choose the OURS version of a conflict for the whole file" },
                        },
                        {
                            "n", "<leader>cT", actions.conflict_choose_all("theirs"), { desc = "Choose the THEIRS version of a conflict for the whole file" },
                        },
                        {
                            "n", "<leader>cB", actions.conflict_choose_all("base"), { desc = "Choose the BASE version of a conflict for the whole file" },
                        },
                        {
                            "n", "<leader>cA", actions.conflict_choose_all("all"), { desc = "Choose all the versions of a conflict for the whole file" },
                        },
                        -- UPDATED
                        {
                            "n", "<leader>cX", actions.conflict_choose_all("none"), { desc = "Delete the conflict region for the whole file" },
                        },

                    }
                },
            })
            vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>", { desc = "Open diffview" })
            vim.keymap.set("n", "<leader>dx", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" })
        end,
    },

    {
        -- git
        "lewis6991/gitsigns.nvim",
        opts = {},
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signs_staged = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signs_staged_enable = true,
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
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
