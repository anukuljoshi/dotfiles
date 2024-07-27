Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall

vim.g.mapleader = " "

THROWAWAY_REGISTER = 'o'
THROWAWAY_MARK = 'I'

require('config')
require('helpers')
require('cmd')
require('plug')

if vim.g.vscode then
	require('vscode')
end

-- confirmation message after config loaded successfully
print("hello aj")
