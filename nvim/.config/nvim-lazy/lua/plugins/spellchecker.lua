return {
    "kamykn/spelunker.vim",
    config = function()

        -- disable spell checker on start
        vim.g.enable_spelunker_vim = 0
        -- Set highlight for SpelunkerSpellBad
        vim.api.nvim_set_hl(0, "SpelunkerSpellBad", {
            underline = true,
            fg = "#d41201",
        })
        -- Set terminal-specific highlight for SpelunkerSpellBad
        vim.cmd("highlight SpelunkerSpellBad cterm=underline ctermfg=247")

        -- Set highlight for SpelunkerComplexOrCompoundWord
        vim.api.nvim_set_hl(0, "SpelunkerComplexOrCompoundWord", {
            underline = true,
            fg = "NONE",
        })
        -- Set terminal-specific highlight for SpelunkerComplexOrCompoundWord
        vim.cmd("highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE")
    end,
}
