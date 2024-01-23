return {
	feline = setmetatable({ {} }, {
		__index = function(self, i)
			if i == 'fg' then
				local nc = package.loaded.nerdcontrast
				local p = nc.palette
				p.fg = p.Fg1
				p.bg = nc.theme.StatusLine or 'NONE'
				package.loaded.feline.use_theme(p)
				p.fg = nil
				p.bg = nil
			end
		end,
	}),
}
