return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'BurntSushi/ripgrep' }
		},
		opts = {
			defaults = {
				mappings = {
					n = {
						["cd"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
						end
					}
				}
			},
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_mru = true,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
					},
				},
				find_files = {
					find_command = { "rg", "--files", "--color", "never", "--no-require-git" }
				}
			},
		},

		config = function()
			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<space>fp', function() builtin.find_files({ hidden = true, cwd = vim.fn.getcwd() }) end, {})
			vim.keymap.set('n', '<space>fa', function() builtin.find_files({ hidden = true, cwd = '/' }) end, {})
			vim.keymap.set('n', '<space>fc', function() builtin.find_files({ hidden = true, cwd = '~/.config/' }) end, {})
			vim.keymap.set('n', '<space>ffp', function() builtin.live_grep({}) end, {})
			vim.keymap.set('n', '<space>ffa', function() builtin.live_grep({ cwd = '/' }) end, {})
			vim.keymap.set('n', '<space>ffc', function() builtin.live_grep({ cwd = '~/.config/' }) end, {})
			vim.keymap.set('n', '<space>fg', function() builtin.git_files() end, { silent = true })
			vim.keymap.set('n', '<space>fr', function() builtin.registers() end, {})
			vim.keymap.set('n', '<space>fh', function() builtin.help_tags() end, {})
			vim.keymap.set('n', '<space>ww', function() builtin.buffers() end, {})
			vim.keymap.set('n', '<space>fd', function() builtin.diagnostics() end, {})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown()
					}
				}
			})

			require("telescope").load_extension("ui-select")
		end
	}
}
