return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				'lua_ls',
				'ts_ls'
			}
		}
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local conf = require('lspconfig')
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			conf.lua_ls.setup({
				capabilities = capabilities
			})
			conf.ts_ls.setup({
				capabilities = capabilities
			})

			vim.keymap.set('n', '\\th', function() vim.lsp.buf.typehierarchy() end)
			vim.keymap.set('n', '\\td', function() vim.lsp.buf.type_definition() end)
			vim.keymap.set('n', '\\d', function() vim.lsp.buf.definition() end)
			vim.keymap.set('n', '\\<Space>', function() vim.lsp.buf.code_action() end)
			vim.keymap.set('n', '\\*', function() vim.lsp.buf.workspace_symbol() end)
			vim.keymap.set('n', '\\lf', function() vim.lsp.buf.format() end)
			vim.keymap.set('n', '\\i', function() vim.lsp.buf.implementation() end)
			vim.keymap.set('n', '\\r', function() vim.lsp.buf.references() end)
			vim.keymap.set('n', '\\s', function() vim.lsp.buf.rename() end)
			vim.keymap.set('n', '\\cl', function() vim.lsp.codelens.display() end)

			vim.api.nvim_create_autocmd('CursorMoved', {
				callback = function()
					vim.lsp.buf.clear_references()
				end
			})
		end
	}
}
