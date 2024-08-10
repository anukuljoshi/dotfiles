return {

    {
        "rmagatti/auto-session",
        config = function()
            local function change_nvim_tree_dir()
                local nvim_tree = require("nvim-tree")
                nvim_tree.change_dir(vim.fn.getcwd())
            end

            require("auto-session").setup({
                log_level = "error",
                auto_save_enabled = true,
                auto_restore_enabled = true,
                auto_session_use_git_branch = true,
                auto_restore_lazy_delay_enabled = true,

                cwd_change_handling = {
                    restore_upcoming_session = true, -- Disabled by default, set to true to enable
                    -- pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
                    -- post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
                    --     -- require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
                    -- end,
                },

                post_restore_cmds = { change_nvim_tree_dir },
                pre_save_cmds = { "NvimTreeClose" },

                -- ⚠️ This will only work if Telescope.nvim is installed
                -- The following are already the default values, no need to provide them if these are already the settings you want.
                session_lens = {
                    -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
                    buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
                    load_on_setup = true,
                    theme_conf = { border = true },
                    previewer = false,
                    path_display = { "shorten" },
                },
            })

            -- Set mapping for searching a session.
            -- ⚠️ This will only work if Telescope.nvim is installed
            vim.keymap.set("n", "<leader>sf", require("auto-session.session-lens").search_session, {
                noremap = true,
            })
            vim.keymap.set("n", "<leader>sd", "<Cmd>Autosession delete<cr>", {
                noremap = true,
            })
        end,
    },
}
