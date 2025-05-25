return {
	'tpope/vim-fugitive',
  init = function ()
    vim.keymap.set('n', '\\b', ':G blame<CR>')
  end
}
