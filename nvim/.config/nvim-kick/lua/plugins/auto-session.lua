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
        require("auto-session").setup({
            log_level = "error",
            auto_save_enabled = true,
            auto_restore_enabled = true,
            auto_session_use_git_branch = true,
            auto_restore_lazy_delay_enabled = true,

            session_lens = {
                -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
                load_on_setup = true,
                previewer = false,
                mappings = {
                    -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
                    delete_session = { { "n" }, "dd" },
                    alternate_session = { { "n" }, "ss" },
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
