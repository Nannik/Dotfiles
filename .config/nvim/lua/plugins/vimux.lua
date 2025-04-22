return {
	'tpope/vim-fugitive',
	init = function()
		vim.keymap.set('n', '<leader>vp', ':VimuxPromptCommand<CR>', {})

		vim.g.VimuxHeight = 200
		vim.g.VimuxOrientation = 'h'
		vim.g.VimuxUseNearest = 3
	end
}
