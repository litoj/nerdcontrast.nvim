vim.o.termguicolors = true
---@type nerdcontrast
---@diagnostic disable-next-line: missing-fields
local M = {
	config = { bg = true, defer = 0, export = 0, overlay = false, opacity = 'ff' },
	groups = {},
	palette = {},
}

local hl = vim.api.nvim_set_hl

function M.addPalette(tbl)
	tbl.Bg0 = M.config.bg and tbl['Bg1'] or {}
	tbl.Overlay = tbl[M.config.overlay and 'Bg2' or 'Bg0']
	tbl.OverlaySel = tbl[M.config.overlay and 'Bg3' or 'Bg2']
	for k, v in pairs(tbl) do
		M.palette[k] = v.fg or v.bg
		hl(0, k, v)
	end

	vim.g.terminal_color_0 = M.palette.Bg2
	vim.g.terminal_color_7 = M.palette.Fg5
	vim.g.terminal_color_1 = M.palette.Red
	vim.g.terminal_color_2 = M.palette.Green
	vim.g.terminal_color_3 = M.palette.Yellow
	vim.g.terminal_color_4 = M.palette.Blue
	vim.g.terminal_color_5 = M.palette.Magenta
	vim.g.terminal_color_6 = M.palette.Cyan
	vim.g.terminal_color_9 = M.palette.LightRed
	vim.g.terminal_color_10 = M.palette.LightGreen
	vim.g.terminal_color_11 = M.palette.LightYellow
	vim.g.terminal_color_12 = M.palette.LightBlue
	vim.g.terminal_color_13 = M.palette.FgRed
	vim.g.terminal_color_14 = M.palette.Olive
	vim.g.terminal_color_8 = M.palette.Fg3
	vim.g.terminal_color_15 = M.palette.Fg1

	for n, t in pairs(M.groups) do -- rehighlight dependant groups
		local c = t[1]
		if t.fg then c.fg = M.palette[t.fg] end
		if t.bg then c.bg = M.palette[t.bg] end
		if t.sp then c.sp = M.palette[t.sp] end
		hl(0, n, c)
	end

	if vim.g.colors_name == 'nerdcontrast' then vim.cmd.redraw() end
	if M.config.export > 0 then
		local c = M.palette.Bg1
		io.stderr:write(
			('\x1b]11;rgba:%s/%s/%s/%s\a'):format(c:sub(2, 3), c:sub(4, 5), c:sub(6, 7), M.config.opacity)
		)
		c = M.palette.Fg1
		io.stderr:write(('\x1b]10;rgb:%s/%s/%s\a\x1b]4'):format(c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		for i = 0, 15, M.config.export == 1 and 15 or 1 do
			c = vim.g['terminal_color_' .. i]
			io.stderr:write((';%s;rgb:%s/%s/%s'):format(i, c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		end
		io.stderr:write '\a'
	end
end

function M.hi(tbl)
	for k, v in pairs(tbl) do
		if type(v) ~= 'table' then
			hl(0, k, { link = v })
		else
			local c
			if not v[1] then
				c = { v }
				M.groups[k] = c
				if v.fg then
					c.fg = v.fg
					v.fg = M.palette[v.fg]
				end
				if v.bg then
					c.bg = v.bg
					v.bg = M.palette[v.bg]
				end
				if v.sp then
					c.sp = v.sp
					v.sp = M.palette[v.sp]
				end
				tbl[k] = c
				c = v
			else
				M.groups[k] = v
				c = v[1]
				if v.fg then c.fg = M.palette[v.fg] end
				if v.bg then c.bg = M.palette[v.bg] end
				if v.sp then c.sp = M.palette[v.sp] end
			end
			hl(0, k, c)
		end
	end
end

function M.setup(opts)
	if opts then
		for k, v in pairs(opts) do
			M.config[k] = v
		end
	end
	M.addPalette(M.config.palette or require('nerdcontrast.palette.' .. vim.o.background))
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
				for _, loader in pairs(package.loaders) do
					local ret = loader(mod)
					if type(ret) == 'function' then package.loaded[mod] = ret() end
				end
				M.hi(require('nerdcontrast.plugs.' .. mod))
				return package.loaded[mod]
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
	else
		vim.api.nvim_exec_autocmds('ColorScheme', { pattern = vim.g.colors_name })
	end
end
return M
