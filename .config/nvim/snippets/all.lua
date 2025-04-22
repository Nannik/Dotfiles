local ls = require('luasnip')

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local s = ls.snippet
local sn = ls.snippet_node
local c = ls.choice_node
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

local function upperFirst(args)
	if args[1] == nil then
		return ''
	end

	return (args[1][1]:gsub("^%l", string.upper))
end

return {
	-- s('usestate', fmt(
	-- 	'const [{}, set{}] = useState{}',
	-- 	{
	-- 		i(1),
	-- 		rep(1),
	-- 		c(3, {
	-- 			sn(nil, fmt('<{}>()', { r(1,  })),
	-- 			sn(nil, fmt('()', { })),
	-- 		})
	-- 	}
	-- ))

	s('a', c(1, {
		sn(nil, { i(1), sn(nil, fmt('const [{}, set{}] = useState({});', { i(2, 'default'), rep(2), i(3, 'null') }) ) }),
		sn(nil, { i(1), sn(nil, fmt('const [{}, set{}] = useState<{}>({});', { i(2, 'default'), rep(2), i(3), i(4, 'null') }) ) }),
	})),
	s('t', fmt('const [{}, set{}] = useState{}({});', {
		i(1, 'default'),
		f(upperFirst, 1),
		c(2, {
			t(''),
			t('<>')
		}),
		i(3, 'null'),
	}))
}
