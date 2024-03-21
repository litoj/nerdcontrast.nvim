vim.o.termguicolors = true
---@type nerdcontrast
---@diagnostic disable-next-line: missing-fields
local M = {
	config = {
		defer = 0,
		export = false,
		light = { palette = { base = 'nerdcontrast.palette.hard_light' } },
		dark = { palette = { base = 'nerdcontrast.palette.hard_dark' } },
	},
	deps = {},
}
function M.setConfig(cfg)
	local default = { palette = cfg.palette, theme = cfg.theme, opacity = cfg.opacity }
	cfg.palette = nil
	cfg.theme = nil
	cfg.opacity = nil
	M.config = vim.tbl_deep_extend('force', M.config, { light = default, dark = default }, cfg)
end
M.setConfig { theme = { base = 'nc' }, opacity = true }

local hl = vim.api.nvim_set_hl

function M.update(cfg)
	local function getTbl(val, prefix)
		return type(val) == 'string' and require(val:match '%.' and val or prefix .. val) or val
	end
	-- TODO: make monochrome pre-theme → just give an array of consecutive color definition tables
	M.palette = {} -- set base color hex
	local p = M.palette
	for _, tbl in ipairs { getTbl(cfg.palette.base, 'nerdcontrast.palette.'), cfg.palette.custom } do
		for k, v in pairs(type(tbl) == 'string' and require(tbl) or tbl) do
			p[k] = v.fg or v.bg
			hl(0, k, v)
		end
	end
	p.Bg0 = cfg.opacity == true and p.Bg1 or 'NONE'

	for _, tbl in ipairs { getTbl(cfg.theme.base, 'nerdcontrast.theme.'), cfg.theme.override } do
		for k, v in pairs(type(tbl) == 'string' and require(tbl) or tbl) do
			p[k] = p[v]
			hl(0, k, { link = v })
		end
	end

	vim.g.terminal_color_0 = p.Bg1
	vim.g.terminal_color_1 = p.Red
	vim.g.terminal_color_2 = p.Green
	vim.g.terminal_color_3 = p.Yellow
	vim.g.terminal_color_4 = p.Blue
	vim.g.terminal_color_5 = p.Magenta
	vim.g.terminal_color_6 = p.Cyan
	vim.g.terminal_color_7 = p.Fg4
	vim.g.terminal_color_8 = p.Fg5
	vim.g.terminal_color_9 = p.LightRed
	vim.g.terminal_color_10 = p.LightGreen
	vim.g.terminal_color_11 = p.LightYellow
	vim.g.terminal_color_12 = p.LightBlue
	vim.g.terminal_color_13 = p.Number
	vim.g.terminal_color_14 = p.Parameter
	vim.g.terminal_color_15 = p.Fg1

	for n, t in pairs(M.deps) do -- rehighlight dependant groups
		local c = t[1]
		if t.fg then c.fg = p[t.fg] end
		if t.bg then c.bg = p[t.bg] end
		if t.sp then c.sp = p[t.sp] end
		hl(0, n, c)
	end
end

function M.hi(tbl)
	local p = M.palette
	for k, v in pairs(tbl) do
		if type(v) == 'string' then
			hl(0, k, { link = v })
		else
			local c
			if not v[1] then
				c = { v }
				M.deps[k] = c
				if v.fg then
					c.fg = v.fg
					v.fg = p[v.fg]
				end
				if v.bg then
					c.bg = v.bg
					v.bg = p[v.bg]
				end
				if v.sp then
					c.sp = v.sp
					v.sp = p[v.sp]
				end
				tbl[k] = c
				c = v
			else
				M.deps[k] = v
				c = v[1]
				if v.fg then c.fg = p[v.fg] end
				if v.bg then c.bg = p[v.bg] end
				if v.sp then c.sp = p[v.sp] end
			end
			hl(0, k, c)
		end
	end
end

function M.setup(opts)
	if opts then M.setConfig(opts) end

	M.update(M.config[vim.o.background])

	if vim.g.colors_name == 'nerdcontrast' then vim.cmd.redraw() end -- sync with term color update
	if M.config.export then
		local c = M.palette.Bg1
		if type(M.config[vim.o.background].opacity) == 'string' then
			io.stderr:write(
				('\x1b]11;rgba:%s/%s/%s/%s\a'):format(
					c:sub(2, 3),
					c:sub(4, 5),
					c:sub(6, 7),
					M.config[vim.o.background].opacity
				)
			)
		end
		c = M.palette.Fg1
		io.stderr:write(('\x1b]10;rgb:%s/%s/%s\a\x1b]4'):format(c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		for i = 0, 15 do
			c = vim.g['terminal_color_' .. i]
			io.stderr:write((';%s;rgb:%s/%s/%s'):format(i, c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		end
		io.stderr:write '\a'
	end

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
			for mod, _ in vim.fs.dir(path .. 'plugs') do
				mod = mod:sub(1, -5)
				if package.loaded[mod] then
					M.hi(require('nerdcontrast.plugs.' .. mod))
				else
					local old = package.preload[mod]
					package.preload[mod] = function()
						package.preload[mod] = nil
						if old then
							old()
						else
							for _, loader in pairs(package.loaders) do
								local ret = loader(mod)
								if type(ret) == 'function' then
									package.loaded[mod] = ret()
									break
								end
							end
						end
						M.hi(require('nerdcontrast.plugs.' .. mod))
					end
				end
			end
		end
		if M.config.defer then
			vim.defer_fn(extraHl, M.config.defer)
		else
			extraHl()
		end
		vim.g.colors_name = 'nerdcontrast'
	else
		vim.api.nvim_exec_autocmds('ColorScheme', { pattern = vim.g.colors_name })
	end
end
return M
