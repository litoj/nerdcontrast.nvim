vim.o.termguicolors = os.getenv("TERM") ~= "linux"
---@type nerdcontrast
local M = {themeDep = {}}

M.config = {bg = true, export = 0}

M.palette = {
	None = {"NONE", "NONE"},
	Magenta = {"#a030a8", 5}, -- #9d2098
	Pink = {"#c06680", 13},
	Red = {"#cc2815", 1},
	Brown = {"#885515", 3},
	Orange = {"#cc6415", 3},
	Yellow = {"#cca815", 11},
	Olive = {"#99a015", 2},
	Green = {"#54a015", 2},
	Cyan = {"#32a08d", 6},
	Blue = {"#3870c0", 4},
	LightMagenta = {"#c850e0", 5},
	LightPink = {"#e7909a", 13},
	LightRed = {"#f03522", 9},
	LightOrange = {"#f09322", 3},
	LightYellow = {"#e8d822", 11},
	LightOlive = {"#b0cd22", 10},
	LightGreen = {"#66d022", 10},
	LightCyan = {"#66e0c0", 14}, -- #50e8b0
	LightBlue = {"#50a8f0", 12},
}

function M.hiThemeDep()
	for k, v in pairs(M.themeDep) do
		local c = v[2] or {}
		if v[1].fg then
			c.fg = M.palette[v[1].fg][1]
			c.ctermfg = M.palette[v[1].fg][2]
		end
		if v[1].bg then
			c.bg = M.palette[v[1].bg][1]
			c.ctermbg = M.palette[v[1].bg][2]
		end
		if v[1].sp then c.sp = M.palette[v[1].sp][1] end
		vim.api.nvim_set_hl(0, k, c)
	end
end

function M.hi(tbl)
	for k, v in pairs(tbl) do
		if type(v) == "string" then
			vim.api.nvim_set_hl(0, k, {link = v})
		else
			local c
			if type(v[1]) == "table" then
				M.themeDep[k] = v
				c = v[2] or {}
				v = v[1]
			else
				c = v
			end
			-- and v.xx:sub(1,1)~='#'
			if v.fg then
				c.ctermfg = M.palette[v.fg][2]
				c.fg = M.palette[v.fg][1]
			end
			if v.bg then
				c.ctermbg = M.palette[v.bg][2]
				c.bg = M.palette[v.bg][1]
			end
			if v.sp then c.sp = M.palette[v.sp][1] end
			vim.api.nvim_set_hl(0, k, c)
		end
	end
end

for k, v in pairs(M.palette) do vim.api.nvim_set_hl(0, k, {fg = v[1], ctermfg = v[2]}) end

function M.setPalette(tbl)
	for k, v in pairs(tbl) do
		M.palette[k] = v
		vim.api.nvim_set_hl(0, k, {fg = v[1], ctermfg = v[2]})
	end
	vim.api.nvim_set_hl(0, "Normal", {
		ctermbg = M.palette.Fg8[2],
		ctermfg = M.palette.Fg0[2],
		fg = M.palette.Fg0[1],
		bg = M.config.bg and M.palette.Fg8[1] or "NONE",
	})
	for i = 0, 8 do
		local c = M.palette["Fg" .. i]
		local idx = "Bg" .. (8 - i)
		M.palette[idx] = c
		vim.api.nvim_set_hl(0, idx, {bg = c[1], ctermbg = c[2]})
	end
	M:hiThemeDep()
end

--- Plugin setup with optional configuration
---@param opts (nerdcontrast.config|nil)
function M.setup(opts)
	if not opts then
		opts = {palette = require("nerdcontrast.palette." .. vim.o.background)}
	else
		if opts.bg ~= nil then M.config.bg = opts.bg end
		if opts.export ~= nil then M.config.export = opts.export end
		if not opts.palette then opts.palette = require("nerdcontrast.palette." .. vim.o.background) end
	end
	M.setPalette(opts.palette)

	vim.g.terminal_color_0 = M.palette.Fg7[1]
	vim.g.terminal_color_7 = M.palette.Fg5[1]
	if not M.loaded then
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
	end
	vim.g.terminal_color_8 = M.palette.Fg2[1]
	vim.g.terminal_color_15 = M.palette.Fg0[1]
	if vim.fn.exists("syntax_on") then vim.cmd.syntax "reset" end
	if package.loaded.feline then
		require'feline'.use_theme({fg = M.palette.Fg0[1], bg = M.palette.Bg1[1]})
	end
	vim.g.terminal_color_0 = M.palette.Fg7[1]
	if M.config.export > 0 then
		local c = M.palette.Bg0[1]
		io.write(("\x1b]11;rgb:%s/%s/%s\a"):format(c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		c = M.palette.Fg0[1]
		io.write(("\x1b]10;rgb:%s/%s/%s\a\x1b]4"):format(c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		for i = 0, 15, M.config.export == 1 and 15 or 1 do
			c = vim.g["terminal_color_" .. i]
			io.write((";%s;rgb:%s/%s/%s"):format(i, c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		end
		io.write "\a"
	end

	if not M.loaded then
		M.hi(require "nerdcontrast.groups")
		for _, ft in ipairs({"gitcommit", "help", "mcfunction"}) do
			if vim.bo.filetype == ft then
				M.hi(require("nerdcontrast.ft." .. ft))
			else
				vim.api.nvim_create_autocmd("FileType", {
					once = true,
					pattern = ft,
					callback = function() M.hi(require("nerdcontrast.ft." .. ft)) end,
				})
			end
		end
		local function preload(mod)
			package.preload[mod] = nil
			M.hi(require("nerdcontrast.plugs." .. mod))
			for _, loader in pairs(package.loaders) do
				local ret = loader(mod)
				if type(ret) == "function" then return ret() end
			end
		end
		for _, mod in ipairs({
			"bufferline",
			"cmp",
			"dapui",
			"lazy",
			"lspconfig",
			"nvim-tree",
			"nvim-treesitter",
		}) do
			if package.loaded[mod] then
				M.hi(require("nerdcontrast.plugs." .. mod))
			else
				package.preload[mod] = function() return preload(mod) end
			end
		end
		M.loaded = true
	end
	vim.g.colors_name = "nerdcontrast"
end
return M
