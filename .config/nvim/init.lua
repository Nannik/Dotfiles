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
vim.o.tabstop = 2
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
vim.o.termguicolors = true
vim.o.scrolloff = 20
vim.o.path = '.,**'

-- Mappings
vim.keymap.set('n', '<Leader><Leader>s', ':so %<CR>', {})
vim.keymap.set('n', '<Leader><Esc>', ':noh<CR>', {})
vim.keymap.set('n', '<A-j>', '10j', {})
vim.keymap.set('n', '<A-k>', '10k', {})
vim.keymap.set('n', '<Leader>sn', function ()
  require("luasnip.loaders").edit_snippet_files()
end, {})

vim.keymap.set('n', '<Space>l', ':cn<CR>zz', {})
vim.keymap.set('n', '<Space>h', ':cp<CR>zz', {})
vim.keymap.set('n', '<Space>j', ':ccl<CR>zz', {})
vim.keymap.set('n', '<C-c>', ':bp|bd #<CR>')

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('x', '.', 'z', {})
vim.keymap.set({ 'n', 'x' }, '<C-_>', 'gc', { remap = true })

vim.keymap.set('n', '\\<', ':winc 10 <<CR>')
vim.keymap.set('n', '\\>', ':winc 10 ><CR>')
vim.keymap.set('n', '\\-', ':winc 5 -<CR>')
vim.keymap.set('n', '\\+', ':winc 5 +<CR>')

-- Autocommands
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! loadview"
})

-- vim.api.nvim_create_autocmd("BufWinEnter", {
--  pattern = "*",
--  command = "silent! lcd%:p:h"
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

vim.api.nvim_create_user_command("EditSnippet", function(opts)
  local lang = opts.fargs[1]

  vim.cmd('e $RTP/snippets/' .. lang .. '.lua')
end, { nargs = 1})

vim.api.nvim_create_user_command("ERC", "norm $i{<CR>return kj%a}kj", {})
vim.api.nvim_create_user_command("TODO", "e $RTP/todo.txt", {})

require 'config.lazy'
require 'projects'
require 'colorscheme'

require 'func.mathExp'
