vim.o.termguicolors = os.getenv("TERM") ~= "linux"
local M = {}

--- Configuration options
---@class nerdcontrast.config
---@field bg boolean fill background or leave it transparent
---@field export (0|1|2) set source terminal colors to the theme, 1=bg+fg, 2=all
M.config = {bg = true, export = 0}

---@type table<string,table<string,integer>>
local colors = {
	Dark = {"#000000", 0},
	Light = {"#ffffff", 15},
	None = {"NONE", "NONE"},
	Black = {"#282828", 0},
	Black2 = {"#424242", 0},
	Magenta = {"#a030a8", 5}, -- 9d2098
	Pink = {"#c06680", 13},
	Red = {"#cc2815", 1},
	Brown = {"#885515", 3},
	Orange = {"#cc6415", 3},
	Yellow = {"#cca815", 11},
	Olive = {"#99a015", 2},
	Green = {"#54a015", 2},
	Cyan = {"#32a08d", 6},
	Blue = {"#3870c0", 4},
	Grey = {"#5c5a58", 8},
	Grey2 = {"#7a7876", 8},
	LightGrey2 = {"#959391", 7},
	LightGrey = {"#b5b5b5", 7},
	LightMagenta = {"#c850e0", 5},
	LightPink = {"#e7909a", 13},
	LightRed = {"#f03522", 9},
	LightOrange = {"#f09322", 3},
	LightYellow = {"#e8d822", 11},
	LightOlive = {"#b0cd22", 10},
	LightGreen = {"#66d022", 10},
	LightCyan = {"#66e0c0", 14}, -- 50e8b0"
	LightBlue = {"#50a8f0", 12},
	White2 = {"#dad8d5", 15},
	White = {"#f6f5f4", 15},
	-- SlateGray = {"#8088ae", 8},
}
M.colors = colors

M.themeDep = {}

local function hiTheme(tbl)
	for k, v in pairs(tbl) do
		local c = v[2] or {}
		if v[1].fg then
			c.fg = colors[v[1].fg][1]
			c.ctermfg = colors[v[1].fg][2]
		end
		if v[1].bg then
			c.bg = colors[v[1].bg][1]
			c.ctermbg = colors[v[1].bg][2]
		end
		if v[1].sp then c.sp = colors[v[1].sp][1] end
		vim.api.nvim_set_hl(0, k, c)
	end
end

function M.hi(tbl)
	for k, v in pairs(tbl) do
		if type(v) == "string" then
			vim.api.nvim_set_hl(0, k, {link = v})
		else
			if type(v[1]) == "table" then
				M.themeDep[k] = v
				hiTheme({[k] = v})
			else
				-- and v.xx:sub(1,1)~='#'
				if v.fg then
					v.ctermfg = colors[v.fg][2]
					v.fg = colors[v.fg][1]
				end
				if v.bg then
					v.ctermbg = colors[v.bg][2]
					v.bg = colors[v.bg][1]
				end
				if v.sp then v.sp = colors[v.sp][1] end
				vim.api.nvim_set_hl(0, k, v)
			end
		end
	end
end

--- Plugin setup with optional configuration
---@param opts (nerdcontrast.config|nil)
function M.setup(opts)
	if not M.loaded then
		for k, v in pairs(colors) do vim.api.nvim_set_hl(0, k, {fg = v[1], ctermfg = v[2]}) end
	end
	if opts then
		if opts.bg ~= nil then M.config.bg = opts.bg end
		if opts.export ~= nil then M.config.export = opts.export end
	end
	local bg, fg, links
	if vim.o.background == "light" then
		bg, fg = colors.Light, colors.Dark
		links = {"Black2", "Grey", "Grey2", "LightGrey2", "LightGrey", "White2", "White"}
		vim.g.terminal_color_15 = M.colors.Black[1]
	else
		fg, bg = colors.Light, colors.Dark
		links = {"White2", "LightGrey", "LightGrey2", "Grey2", "Grey", "Black2", "Black"}
		vim.g.terminal_color_15 = M.colors.White[1]
	end
	if vim.fn.exists("syntax_on") then vim.cmd.syntax "reset" end
	vim.api.nvim_set_hl(0, "Normal", {
		ctermbg = bg[2],
		ctermfg = fg[2],
		fg = fg[1],
		bg = M.config.bg and bg[1] or "NONE",
	})
	colors.Fg1 = fg
	vim.api.nvim_set_hl(0, "Fg1", {fg = fg[1], ctermfg = fg[2]})
	local color = colors[links[1]]
	for i = 7, 1, -1 do
		color = colors[links[i]]
		local idx = "Fg" .. (i + 1)
		colors[idx] = color
		vim.api.nvim_set_hl(0, idx, {link = links[i]})
		idx = "Bg" .. (8 - i)
		colors[idx] = color
		vim.api.nvim_set_hl(0, idx, {bg = color[1], ctermbg = color[2]})
	end
	hiTheme(M.themeDep)
	vim.g.terminal_color_0 = M.colors.Bg1[1]
	if M.config.export > 0 then
		local c = bg[1]
		io.write(("printf '\x1b]11;rgb:%s/%s/%s\a"):format(c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		c = fg[1]
		io.write(("\x1b]10;rgb:%s/%s/%s\a\x1b]4"):format(c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		for i = 0, 15, M.config.export == 1 and 15 or 1 do
			c = vim.g["terminal_color_" .. i]
			io.write((";%s;rgb:%s/%s/%s"):format(i, c:sub(2, 3), c:sub(4, 5), c:sub(6, 7)))
		end
		io.write "\a'"
	end
	vim.g.colors_name = "nerdcontrast"

	if package.loaded.feline then require'feline'.use_theme({fg = colors.Fg1[1], bg = colors.Bg1[1]}) end
	if not M.loaded then
		vim.g.terminal_color_1 = M.colors.Red[1]
		vim.g.terminal_color_2 = M.colors.Green[1]
		vim.g.terminal_color_3 = M.colors.Yellow[1]
		vim.g.terminal_color_4 = M.colors.Blue[1]
		vim.g.terminal_color_5 = M.colors.Magenta[1]
		vim.g.terminal_color_6 = M.colors.Cyan[1]
		vim.g.terminal_color_7 = M.colors.LightGrey[1]
		vim.g.terminal_color_8 = M.colors.Grey[1]
		vim.g.terminal_color_9 = M.colors.LightRed[1]
		vim.g.terminal_color_10 = M.colors.LightGreen[1]
		vim.g.terminal_color_11 = M.colors.LightYellow[1]
		vim.g.terminal_color_12 = M.colors.LightBlue[1]
		vim.g.terminal_color_13 = M.colors.LightPink[1]
		vim.g.terminal_color_14 = M.colors.Olive[1]
		M.hi(require "nerdcontrast.groups")
		for _, ft in ipairs({"gitcommit", "help", "mcfunction"}) do
			local function load_hi() M.hi(require("nerdcontrast.ft." .. ft)) end
			if vim.bo.filetype == ft then
				load_hi()
			else
				vim.api.nvim_create_autocmd("FileType", {once = true, pattern = ft, callback = load_hi})
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
			local function load_hi() M.hi(require("nerdcontrast.plugs." .. mod)) end
			if package.loaded[mod] then
				load_hi()
			else
				package.preload[mod] = function()
					package.preload[mod] = nil
					load_hi()
					for _, loader in pairs(package.loaders) do
						local ret = loader(mod)
						if type(ret) == "function" then return ret() end
					end
				end
			end
		end
		M.loaded = true
	end
end
return M
