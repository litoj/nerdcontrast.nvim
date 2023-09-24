local p = package.loaded.nerdcontrast.palette
return {
	feline = setmetatable({ {} }, {
		__index = function(self, i)
			if i == 'fg' then require('feline').use_theme { fg = p.Fg1[1], bg = p.Bg2[1] } end
		end,
	}),
}
