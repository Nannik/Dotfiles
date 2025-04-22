return {
	{
		'l3mon4d3/luasnip',
		priority = 2,
		dependencies = {
			'saadparwaiz1/cmp_luasnip'
		},
		config = function()
			local ls = require('luasnip')

			ls.setup({})
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

			vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-J>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
		end
	},
	{
		'hrsh7th/nvim-cmp',
		priority = 1,
		dependencies = {
			'hrsh7th/cmp-nvim-lsp'
		},
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					['<Right>'] = cmp.mapping.confirm({ select = false }),
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }
				}, {
					{ name = 'buffer' }
				})
			})
		end,
	}
}
