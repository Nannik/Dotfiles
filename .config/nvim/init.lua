require('helpers') -- lua helper functions

vim.o.termguicolors = true

-- ENV variables
vim.env.RTP = split(vim.o.runtimepath, ',')[1]
vim.env.CFG = '~/.config'
vim.env.IN = '~/.config/nvim/init.lua'
vim.env.PLUG = '~/.config/nvim/lua/plugins'
vim.env.R = '~/repo'
vim.env.F = '~/repo/freelance'

-- Default variables
vim.o.rnu = true
vim.o.nu = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.tabstop = 8
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.showtabline = 0
vim.o.foldcolumn = '3'
vim.o.foldlevel = 99
vim.o.showtabline = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.swapfile = false
vim.o.path = '.,**'

-- Mappings
vim.keymap.set('n', '<Leader>l', ':Lint ', {})
vim.keymap.set('n', '<Leader>ll', ':Lint ', {})

vim.keymap.set('n', '.', 'z', {})
vim.keymap.set('n', '<Space>', 'za', {})
vim.keymap.set('n', '<C-c>', ':bp|bd #<CR>')

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('x', '.', 'z', {})
vim.keymap.set({ 'n', 'x' }, '<C-_>', 'gc', { remap = true })

-- Autocommands
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! loadview"
})

-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	pattern = "*",
-- 	command = "silent! lcd%:p:h"
-- })

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  command = "silent! mkview"
})

vim.filetype.add {
  extension = {
    rasi = 'rasi'
  }
}

-- Commands
vim.api.nvim_create_user_command("Lint", function(opts)
  local args = split(opts.fargs[1], ' ');
  local mappedArgs = map(args, function(arg) 
    local short = {
      f = "fix",
      q = "quiet"
    }

    if not (short[arg] == nil) then
      arg = short[arg]
    end

    return '--' .. arg 
  end);

  vim.cmd('!npx eslint % ' .. table.concat(mappedArgs, ' '))
end, { nargs = 1 })

vim.api.nvim_create_user_command("ERC", "norm $i{<CR>return kj%a}kj", {})
vim.api.nvim_create_user_command("TODO", "e $RTP/todo.txt", {})

-- lang
require 'lang.go'
require 'lang.tex'

require 'projects'
require 'plugins.plugins'
require 'colorscheme'
