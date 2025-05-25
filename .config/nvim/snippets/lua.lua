local ls = require('luasnip')

local fmt = require('luasnip.extras.fmt').fmt
local s = ls.s
local i = ls.i
local f = ls.f

local function replace(args)
  return args[1][1]:gsub('.', '-')
end

return {
  ---------------------
  --- MULTI COMMENT ---
  ---------------------
  s('mc', fmt('----{}----\n--- {} ---\n----{}----', {
    f(replace, 1),
    i(1),
    f(replace, 1)
  }))
}

