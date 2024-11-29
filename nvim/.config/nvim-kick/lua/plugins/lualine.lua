local colors = {
    bg = "#202328",
    fg = "#bbc2cf",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
}

local mode_color = {
    n = colors.red,
    i = colors.green,
    v = colors.blue,
    [""] = colors.blue,
    V = colors.blue,
    c = colors.magenta,
    no = colors.red,
    s = colors.orange,
    S = colors.orange,
    [""] = colors.orange,
    ic = colors.yellow,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ["r?"] = colors.cyan,
    ["!"] = colors.red,
    t = colors.red,
}

return {
    "nvim-lualine/lualine.nvim",
    event = "BufReadPre",
    init = function()
        vim.keymap.set("n", "<leader>l", ':lua require("lualine").refresh<CR>', { desc = "Refresh status line" })
    end,
    opts = {
        options = {
            theme = "auto",
            component_separators = "",
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    color = { gui = "bold" },
                },
            },
            lualine_b = {
                {
                    "filename",
                    path = 1,
                    color = { gui = "bold" },
                },
            },
            lualine_c = {
                "diagnostics",
            },
            lualine_x = {},
            lualine_y = {
                {
                    "diff",
                    symbols = { added = " ", modified = "󰝤 ", removed = " " },
                },
            },
            lualine_z = {
                {
                    "branch",
                    icon = "",
                    color = { gui = "bold" },
                },
            },
        },
        inactive_sections = {
            lualine_a = {
                {
                    "filename",
                    file_status = true,
                    path = 1,
                },
                "diagnostics",
                "diff",
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
        tabline = {},
        extensions = {
            "trouble",
            "fzf",
            "nvim-dap-ui",
        },
    },
}

-- return {
--     {
--         "nvim-lualine/lualine.nvim",
--         dependencies = { "nvim-tree/nvim-web-devicons" },
--         config = function()
--             -- Eviline config for lualine
--             -- Author: shadmansaleh
--             -- Credit: glepnir
--             local lualine = require("lualine")
--
--             -- Color table for highlights
--             -- stylua: ignore
--             local colors = {
--               bg       = "#3b4261",
--               fg       = "#c8d3f5",
--               yellow   = "#ECBE7B",
--               cyan     = "#008080",
--               darkblue = "#081633",
--               green    = "#98be65",
--               orange   = "#FF8800",
--               violet   = "#a9a1e1",
--               magenta  = "#c678dd",
--               blue     = "#51afef",
--               red      = "#ec5f67",
--               skyblue  = "#7ea2ed",
--             }
--
--             local conditions = {
--                 buffer_not_empty = function()
--                     return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
--                 end,
--                 hide_in_width = function()
--                     return vim.fn.winwidth(0) > 80
--                 end,
--                 check_git_workspace = function()
--                     local filepath = vim.fn.expand("%:p:h")
--                     local gitdir = vim.fn.finddir(".git", filepath .. ";")
--                     return gitdir and #gitdir > 0 and #gitdir < #filepath
--                 end,
--             }
--
--             -- Config
--             local config = {
--                 options = {
--                     -- Disable sections and component separators
--                     -- component_separators = { left = "", right = "" },
--                     -- section_separators = { left = "", right = "" },
--                     component_separators = { left = "", right = "" },
--                     section_separators = { left = "", right = "" },
--                     theme = {
--                         -- We are going to use lualine_c an lualine_x as left and
--                         -- right section. Both are highlighted by c theme .  So we
--                         -- are just setting default looks o statusline
--                         normal = { c = { fg = colors.fg, bg = colors.bg } },
--                         inactive = { c = { fg = colors.fg, bg = colors.bg } },
--                     },
--                 },
--                 sections = {
--                     -- these are to remove the defaults
--                     lualine_a = {},
--                     lualine_b = {},
--                     lualine_y = {},
--                     lualine_z = {},
--                     -- These will be filled later
--                     lualine_c = {},
--                     lualine_x = {},
--                 },
--                 inactive_sections = {
--                     -- these are to remove the defaults
--                     lualine_a = {},
--                     lualine_b = {},
--                     lualine_y = {},
--                     lualine_z = {},
--                     lualine_c = {},
--                     lualine_x = {},
--                 },
--             }
--
--             -- Inserts a component in lualine_c at left section
--             local function ins_left(component)
--                 table.insert(config.sections.lualine_c, component)
--             end
--
--             -- Inserts a component in lualine_x at right section
--             local function ins_right(component)
--                 table.insert(config.sections.lualine_x, component)
--             end
--
--             ins_left({
--                 -- mode component
--                 "mode",
--                 color = function()
--                     -- auto change color according to neovims mode
--                     local mode_color = {
--                         n = colors.red,
--                         i = colors.green,
--                         v = colors.blue,
--                         [""] = colors.blue,
--                         V = colors.blue,
--                         c = colors.magenta,
--                         no = colors.red,
--                         s = colors.orange,
--                         S = colors.orange,
--                         [""] = colors.orange,
--                         ic = colors.yellow,
--                         R = colors.violet,
--                         Rv = colors.violet,
--                         cv = colors.red,
--                         ce = colors.red,
--                         r = colors.cyan,
--                         rm = colors.cyan,
--                         ["r?"] = colors.cyan,
--                         ["!"] = colors.red,
--                         t = colors.red,
--                     }
--                     return { fg = colors.bg, bg = mode_color[vim.fn.mode()] }
--                 end,
--                 padding = { left = 1, right = 1 },
--             })
--
--             ins_left({
--                 "filename",
--                 path = 1,
--                 cond = conditions.buffer_not_empty,
--                 color = { fg = colors.magenta, gui = "bold" },
--             })
--
--             ins_left({
--                 "diagnostics",
--                 sources = { "nvim_diagnostic" },
--                 symbols = { error = " ", warn = " ", info = " " },
--                 diagnostics_color = {
--                     error = { fg = colors.red, bg = colors.bg },
--                     warn = { fg = colors.yellow, bg = colors.bg },
--                     info = { fg = colors.cyan, bg = colors.bg },
--                 },
--             })
--
--             ins_right({
--                 "diff",
--                 -- Is it me or the symbol for modified us really weird
--                 symbols = { added = " ", modified = "󰝤 ", removed = " " },
--                 diff_color = {
--                     added = { fg = colors.green },
--                     modified = { fg = colors.orange },
--                     removed = { fg = colors.red },
--                 },
--                 cond = conditions.hide_in_width,
--             })
--
--             ins_right({
--                 "branch",
--                 icon = "",
--                 color = { fg = colors.violet, gui = "bold" },
--             })
--
--             -- ins_right({
--             --     "filetype",
--             --     color = {
--             --         fg = colors.bg,
--             --         bg = colors.skyblue,
--             --     },
--             -- })
--
--             -- Now don"t forget to initialize lualine
--             lualine.setup(config)
--         end,
--     },
-- }
