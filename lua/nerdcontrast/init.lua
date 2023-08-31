vim.o.termguicolors = os.getenv 'TERM' ~= 'linux'
---@type nerdcontrast
---@diagnostic disable-next-line: missing-fields
local M = { config = { bg = true, defer = 0, export = 0, overlay = false } }

M.themeDep = { Normal = { fg = 'Fg1', bg = 'Bg0', {} } }

M.palette = {
	None = { 'NONE', 'NONE' },
	Magenta = { '#a030a8', 5 }, -- #9d2098
	Pink = { '#c06680', 13 },
	Red = { '#cc1515', 1 },
	Orange = { '#cc7015', 3 },
	Yellow = { '#cca815', 11 },
	Olive = { '#99a015', 2 },
	Green = { '#54a015', 2 },
	Cyan = { '#32a08d', 6 },
	Blue = { '#3870c0', 4 },
	LightMagenta = { '#d050d8', 5 },
	LightPink = { '#e7909a', 13 },
	LightRed = { '#f03522', 9 },
	LightOrange = { '#f09322', 3 },
	LightYellow = { '#f0d822', 11 },
	LightOlive = { '#c0d022', 10 },
	LightGreen = { '#66d022', 10 },
	LightCyan = { '#50d0b8', 14 },
	LightBlue = { '#50a8f0', 12 },
}

local hl = vim.api.nvim_set_hl

---@param tbl nerdcontrast.Palette
function M.setPalette(tbl)
	for k, v in pairs(tbl) do
		M.palette[k] = v
	end
	M.palette.Bg0 = M.palette[(M.config.bg or not vim.o.termguicolors) and 'Bg1' or 'None']
	M.palette.Overlay = M.palette[M.config.overlay and 'Bg2' or 'Bg0']
	M.palette.OverlaySel = M.palette[M.config.overlay and 'Bg3' or 'Bg2']
	for k, v in pairs(M.palette) do
		hl(0, k, v.bg and { bg = v[1], ctermbg = v[2] } or { fg = v[1], ctermfg = v[2] })
	end
	vim.g.terminal_color_0 = M.palette.Bg2[1]
	vim.g.terminal_color_7 = M.palette.Bg6[1]
	vim.g.terminal_color_1 = M.palette.Red[1]
	vim.g.terminal_color_2 = M.palette.Green[1]
	vim.g.terminal_color_3 = M.palette.Yellow[1]
	vim.g.terminal_color_4 = M.palette.Blue[1]
	vim.g.terminal_color_5 = M.palette.Magenta[1]
	vim.g.terminal_color_6 = M.palette.Cyan[1]
	vim.g.terminal_color_9 = M.palette.LightRed[1]
	vim.g.terminal_color_10 = M.palette.LightGreen[1]
	vim.g.terminal_color_11 = M.palette.LightYellow[1]
	vim.g.terminal_color_12 = M.palette.LightBlue[1]
	vim.g.terminal_color_13 = M.palette.LightPink[1]
	vim.g.terminal_color_14 = M.palette.Olive[1]
	vim.g.terminal_color_8 = M.palette.Fg3[1]
	vim.g.terminal_color_15 = M.palette.Fg1[1]
	if package.loaded.feline then
		require('feline').use_theme { fg = M.palette.Fg1[1], bg = M.palette.Bg2[1] }
	end
	M:hiThemeDep()
	if vim.g.colors_name == 'nerdcontrast' then vim.cmd.redraw() end
	M.setTerm(M.config)
end

---@param cfg nerdcontrast.Config
function M.setTerm(cfg)
	if cfg.export > 0 then
		local c = M.palette.Bg1[1]
		io.stderr:write(
			('\x1b]11;rgba:%s/%s/%s/%s\a'):format(
				c:sub(2, 3),
				c:sub(4, 5),
				c:sub(6, 7),
				cfg.opacity or 'ff'
			)
		)
		c = M.palette.Fg1[1]
		io.stderr:write(('\x1b]10;rgb:%s/%s/%s\a\x1b]4'):format(c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		for i = 0, 15, cfg.export == 1 and 15 or 1 do
			c = vim.g['terminal_color_' .. i]
			io.stderr:write((';%s;rgb:%s/%s/%s'):format(i, c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		end
		io.stderr:write '\a'
	end
end

function M.hiThemeDep()
	for n, t in pairs(M.themeDep) do
		local c = t[1]
		if t.fg then
			c.fg = M.palette[t.fg][1]
			c.ctermfg = M.palette[t.fg][2]
		end
		if t.bg then
			c.bg = M.palette[t.bg][1]
			c.ctermbg = M.palette[t.bg][2]
		end
		if t.sp then c.sp = M.palette[t.sp][1] end
		hl(0, n, c)
	end
end

---@param tbl table<string,nerdcontrast.ThemeDepHl>
function M.hi(tbl)
	for k, v in pairs(tbl) do
		if #v > 0 and not v[1] then
			hl(0, k, { link = v })
		else
			local c
			if v[1] then
				M.themeDep[k] = v
				c = v[1]
			else
				c = v
			end
			if v.fg then
				c.ctermfg = M.palette[v.fg][2]
				c.fg = M.palette[v.fg][1]
			end
			if v.bg then
				c.ctermbg = M.palette[v.bg][2]
				c.bg = M.palette[v.bg][1]
			end
			if v.sp then c.sp = M.palette[v.sp][1] end
			hl(0, k, c)
		end
	end
end

--- Plugin setup with optional configuration
---@param opts? nerdcontrast.Config
function M.setup(opts)
	if opts then
		for k, v in pairs(opts) do
			M.config[k] = v
		end
	end
	M.setPalette(M.config.palette or require('nerdcontrast.palette.' .. vim.o.background))
	M.config.palette = nil

	if vim.g.colors_name ~= 'nerdcontrast' then
		M.hi(require 'nerdcontrast.groups')
		local function extraHl()
			local path = debug.getinfo(1, 'S').source:sub(2, -9)
			for ft, _ in vim.fs.dir(path .. 'ft') do
				ft = ft:sub(1, -5)
				if vim.bo.filetype == ft then
					M.hi(require('nerdcontrast.ft.' .. ft))
				else
					vim.api.nvim_create_autocmd('FileType', {
						once = true,
						pattern = ft,
						callback = function() M.hi(require('nerdcontrast.ft.' .. ft)) end,
					})
				end
			end
			local function preload(mod)
				package.preload[mod] = nil
				M.hi(require('nerdcontrast.plugs.' .. mod))
				for _, loader in pairs(package.loaders) do
					local ret = loader(mod)
					if type(ret) == 'function' then return ret() end
				end
			end
			for mod, _ in vim.fs.dir(path .. 'plugs') do
				mod = mod:sub(1, -5)
				if package.loaded[mod] then
					M.hi(require('nerdcontrast.plugs.' .. mod))
				else
					package.preload[mod] = function() return preload(mod) end
				end
			end
		end
		if M.config.defer then
			vim.defer_fn(extraHl, M.config.defer)
		else
			extraHl()
		end
		vim.g.colors_name = 'nerdcontrast'
	end
end
return M
