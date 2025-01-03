return {

    { -- Fuzzy Finder (files, lsp, etc)
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { -- If encountering errors, see telescope-fzf-native README for install instructions
                "nvim-telescope/telescope-fzf-native.nvim",

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = "make",

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },

            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = {
                            preview_width = 0.5,
                        },
                    },
                    path_display = {
                        filename_first = {
                            reverse_directories = true,
                        },
                    },
                    mappings = {
                        n = {
                            ["q"] = require("telescope.actions").close,
                        },
                    },
                },
                pickers = {
                    buffers = {
                        initial_mode = "insert",
                        show_all_buffers = true,
                        sort_mru = true,
                        theme = "ivy",
                        layout_config = { height = 20 },
                        winblend = 0,
                        previewer = true,
                        mappings = {
                            n = {
                                ["dd"] = "delete_buffer",
                            },
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            -- Enable telescope extensions, if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            -- See `:help telescope.builtin`
            local builtin = require("telescope.builtin")
            -- custom keymaps
            -- files
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
            vim.keymap.set("n", "<leader>fa", function()
                builtin.find_files({
                    hidden = true,
                    no_ignore = true,
                })
            end, { desc = "[F]ind [A]ll (including hidden)" })
            vim.keymap.set("n", "<leader>f.", function()
                builtin.find_files({
                    cwd = vim.fn.expand("%:p:h"),
                })
            end, { desc = "[F]ind in [.] cwd" })

            -- search
            vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind search by [G]rep" })
            vim.keymap.set("n", "<leader>fh", builtin.search_history, { desc = "[F]ind Search [H]istory" })

            -- neovim
            vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "[F]ind [M]arks" })
            vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "[F]ind [Q]uickfix" })
            vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "[F]ind [J]ump list" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
            vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
            vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

            -- git
            vim.keymap.set("n", "<leader>gg", builtin.git_status, { desc = "find [G]it [S]tatus" })
            vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "find [G]it [F]iles" })
            vim.keymap.set("n", "<leader>gc", builtin.git_bcommits, { desc = "Search [G]it [C]omits for Buffer" })
            vim.keymap.set("n", "<leader>gC", builtin.git_commits, { desc = "Search [G]it [C]omits" })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Search [G]it [B]ranches" })
            vim.keymap.set("n", "<leader>gs", builtin.git_stash, { desc = "Search [G]it [S]tash list" })

            -- extras
            vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "[F]ind [C]olorscheme" })

            -- advanced search
            -- Slightly advanced example of overriding default behavior and theme
            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" })

            -- Also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set("n", "<leader>f/", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end, { desc = "[F]ind [/] in Open Files" })
        end,
    },

}
