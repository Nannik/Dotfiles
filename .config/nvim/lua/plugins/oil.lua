return {
	'stevearc/oil.nvim',
	opts = {
		view_options = {
			show_hidden = true
		},
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<C-f>"] = "actions.select",
			["<C-p>"] = "actions.preview",
			["<ESC>"] = "actions.close",
			["<C-r>"] = "actions.refresh",
			["`"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
		},
		use_default_keymaps = false
	},
	init = function()
		vim.keymap.set('n', '-', "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
		vim.keymap.set('n', '_', function() 
			local cwd = vim.fn.getcwd()
			vim.cmd("Oil --float " .. cwd)
		end, { desc = "Open cwd directory" })
	end
}
