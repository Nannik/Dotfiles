return {
	{'mattn/emmet-vim'},
  {
    'chrisbra/colorizer',
    init = function()
      vim.keymap.set('n', '\\ct', ':ColorToggle<CR>')
    end
  }
}
