local p = package.loaded.nerdcontrast.palette
return {
	feline = setmetatable({{}}, {
		__index = function(self, i)
			if i == 'fg' then
				p.fg = p.Fg1
				p.bg = p.Bg2
				require('feline').use_theme(p)
				p.fg = nil
				p.bg = nil
			end
		end,
	}),
}
