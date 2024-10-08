return {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
        -- Will use Telescope if installed or a vim.ui.select picker otherwise
        { "<leader>wf", "<cmd>SessionSearch<CR>", desc = "Session Find" },
        { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
        { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
    },

    config = function()
        -- local function change_nvim_tree_dir()
        --     local nvim_tree = require("nvim-tree")
        --     nvim_tree.change_dir(vim.fn.getcwd())
        -- end

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

            -- post_restore_cmds = { change_nvim_tree_dir },
            -- pre_save_cmds = { "NvimTreeClose" },

            -- ⚠️ This will only work if Telescope.nvim is installed
            -- The following are already the default values, no need to provide them if these are already the settings you want.

            session_lens = {
                -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
                load_on_setup = true,
                previewer = false,
                mappings = {
                    -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
                    delete_session = { {"n"}, "dd" },
                    alternate_session = { {"n"}, "ss" },
                },
                -- Can also set some Telescope picker options
                theme_conf = {
                    border = true,
                    layout_config = {
                        width = 0.9, -- Can set width and height as percent of window
                        height = 0.6,
                    },
                },
            },
        })
    end,

}
