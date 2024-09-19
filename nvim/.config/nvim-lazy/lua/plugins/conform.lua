return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            -- lsp servers
            table.insert(opts.ensure_installed, "eslint-lsp")
            table.insert(opts.ensure_installed, "eslint_d")
            table.insert(opts.ensure_installed, "typescript-language-server")
            table.insert(opts.ensure_installed, "pyright")
            table.insert(opts.ensure_installed, "ruff")
            table.insert(opts.ensure_installed, "gopls")

            -- formatters
            table.insert(opts.ensure_installed, "stylua")
            table.insert(opts.ensure_installed, "goimports")
            table.insert(opts.ensure_installed, "gofumpt")
            table.insert(opts.ensure_installed, "prettier")
            table.insert(opts.ensure_installed, "prettierd")
            table.insert(opts.ensure_installed, "isort")
            table.insert(opts.ensure_installed, "black")
            table.insert(opts.ensure_installed, "codespell")
        end,
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                go = { "goimports", "gopls", "gofumpt" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
                -- You can use a function here to determine the formatters dynamically
                python = function(bufnr)
                    if require("conform").get_formatter_info("ruff_format", bufnr).available then
                        return { "ruff_format" }
                    else
                        return { "isort", "black" }
                    end
                end,
                -- Use the "*" filetype to run formatters on all filetypes.
                ["*"] = { "codespell" },
                -- Use the "_" filetype to run formatters on filetypes that don't
                -- have other formatters configured.
                ["_"] = { "trim_whitespace" },
            },
        },
    },
}
