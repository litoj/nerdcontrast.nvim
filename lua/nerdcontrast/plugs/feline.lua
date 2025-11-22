return {
	feline = setmetatable({ {} }, {
		__index = function(self, i)
			if i == 'fg' then
				local nc = require 'nerdcontrast'
				local p = nc.palette
				-- inject fields to allow direct palette reuse for feline
				p.fg = p.Fg1
				p.bg = nc.palette.StatusLine or 'NONE'
				require('feline').use_theme(p)
				p.fg = nil
				p.bg = nil
			end
		end,
	}),
}
