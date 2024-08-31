local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})


-- LSP setup
local lspconfig = require("lspconfig")

lspconfig["tsserver"].setup({
    on_attach = function(_client, buffer)
        local function goto_source_definition()
            local position_params = vim.lsp.util.make_position_params()
            vim.lsp.buf.execute_command({
                command = "_typescript.goToSourceDefinition",
                arguments = { vim.api.nvim_buf_get_name(0), position_params.position },
            })
        end
        local opts = { buffer = buffer }
        vim.keymap.set("n", "gs", goto_source_definition, opts)
    end,
    handlers = {
        ["workspace/executeCommand"] = function(_err, result, ctx, _config)
            if ctx.params.command ~= "_typescript.goToSourceDefinition" then
                return
            end
            if result == nil or #result == 0 then
                return
            end
            vim.lsp.util.jump_to_location(result[1], "utf-8")
        end,
    },
})
