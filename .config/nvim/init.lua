require('helpers') -- lua helper functions

vim.o.termguicolors = true

-- ENV variables
vim.env.RTP = split(vim.o.runtimepath, ',')[1]
vim.env.IN = '~/.config/nvim/init.lua'
vim.env.R = '~/repo'

-- Default variables
vim.o.rnu = true
vim.o.nu = true
vim.o.wrap = false
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.showtabline = 0
vim.o.foldmethod = 'syntax'
vim.o.foldcolumn = '3'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.swapfile = false
vim.o.path = '.,**'

-- Mappings
vim.keymap.set('n', '.', 'z', {})
vim.keymap.set('n', '<Space>', 'za', {})
vim.keymap.set('n', '<C-c>', ':bp|bd #<CR>')
vim.keymap.set('n', '<Leader>=', ':winc +<CR>')
vim.keymap.set('n', '<Leader>-', ':winc -<CR>')
vim.keymap.set('n', '<Leader>>', ':winc ><CR>')
vim.keymap.set('n', '<Leader><', ':winc <<CR>')

vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')

vim.keymap.set('x', '.', 'z', {})

-- Autocommands
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	command = "silent! loadview"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	command = "set foldlevel=99"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	command = "silent! lcd%:p:h"
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	command = "silent! mkview"
})

vim.filetype.add {
	extension = {
		rasi = 'rasi'
	}
}

-- lang
require 'lang.go'

require 'projects'
require 'plugins.plugins'
require 'colorscheme'
