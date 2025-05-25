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
  --------------------
  --- US, USESTATE ---
  --------------------
	s('us', fmt('const [{}, set{}] = useState{}({});', {
		i(1, 'default'),
		f(upperFirst, 1),
		c(2, {
			t(''),
			t('<>')
		}),
		i(3, 'null'),
	})),

  ---------------------------
  --- RC, REACT COMPONENT ---
  ---------------------------
  s({
      trig = 'rc',
      name = 'React Component',
    },
    fmt([[
    export const {} = () => {}
  ]], {
      i(1, 'Component'),
      c(2, {
        t({ '(', '', ')' }),
        t({ '{', '\treturn ()', '}' }),
      })
    })),

  -------------------
  --- CONSOLE.LOG ---
  -------------------
  s({
    trig = 'cl',
    name = 'console.log'
  },
  fmt([[
    console.log('{}', {})
  ]], {
    rep(1),
    i(1)
  }))
}
