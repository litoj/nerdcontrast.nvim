local nc = require 'nerdcontrast'
local p = nc.palette

if not nc.deps.StatusLineDef then nc.hi { StatusLineDef = { bg = 'StatusLine', fg = 'Fg4' } } end
local bg = p.StatusLine
local ret = {
	normal = {
		a = { bg = bg, fg = p.Ac1 },
		b = 'StatusLineDef',
		c = 'StatusLineDef',
		z = 'StatusLineDef',
	},
	insert = { a = { bg = bg, fg = p.Ac2 }, z = 'StatusLineDef' },
	visual = { a = { bg = bg, fg = p.Yellow }, z = 'StatusLineDef' },
	replace = { a = { bg = bg, fg = p.Red }, z = 'StatusLineDef' },
	command = { a = { bg = bg, fg = p.BuiltinFn }, z = 'StatusLineDef' },
	inactive = { a = { bg = bg, fg = p.Bg4 } },
}
local function deepMerge(dst, src)
	if type(src) == 'string' then return p[src] end
	if type(dst) ~= 'table' then dst = { bg = bg } end
	for k, v in pairs(src) do
		dst[k] = deepMerge(dst[k], v)
	end
	return dst
end
return nc.lualine and deepMerge(ret, nc.lualine) or ret
