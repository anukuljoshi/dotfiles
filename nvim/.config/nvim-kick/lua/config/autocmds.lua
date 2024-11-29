local function augroup(name)
    return vim.api.nvim_create_augroup("nvim_kick_" .. name, { clear = true })
end

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 100,
        })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "remove trailing spaces from files on save",
    group = augroup("clear_trailing_space"),
    callback = function()
        vim.cmd([[ %s/\s\+$//e ]])
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "disable adding comment to new line",
    group = augroup("comment_line"),
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "update file when there are changes",
    group = augroup("buffer_enter"),
    callback = function()
        vim.cmd("checktime")
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "checkhealth",
        "dbout",
        "gitsigns-blame",
        "grug-far",
        "help",
        "lspinfo",
        "neotest-output",
        "neotest-output-panel",
        "neotest-summary",
        "notify",
        "qf",
        "snacks_win",
        "spectre_panel",
        "startuptime",
        "tsplayground",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit buffer",
            })
        end)
    end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})
