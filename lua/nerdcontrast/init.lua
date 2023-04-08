vim.o.termguicolors = os.getenv("TERM") ~= "linux"
local M = {}
local colors = {
	None = {"NONE", "NONE"},
	Black = {"#282828", 0},
	Black2 = {"#424242", 0},
	Magenta = {"#a030a8", 5}, -- 9d2098
	Pink = {"#c06680", 13},
	Red = {"#cc2815", 1},
	Brown = {"#885515", 3},
	Orange = {"#cc6415", 3},
	Yellow = {"#cca815", 3},
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
	LightOrange = {"#f09322", 11},
	LightYellow = {"#e8d822", 11},
	LightOlive = {"#b0cd22", 10},
	LightGreen = {"#66d022", 10},
	LightCyan = {"#66e0c0", 14}, -- 50e8b0"
	LightBlue = {"#50a8f0", 12},
	White2 = {"#dad8d5", 15},
	White = {"#f0eeea", 15},
}
M.colors = colors

for i, v in pairs(colors) do vim.api.nvim_set_hl(0, i, {fg = v[1], ctermfg = v[2]}) end

colors.Highlight = colors.Green -- highlight
colors.LightHighlight = colors.LightGreen -- highlight
colors.Contrast = colors.Magenta -- contrast
colors.LightContrast = colors.LightMagenta -- contrast

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

M.setup = function()
	if vim.fn.exists("syntax_on") then vim.cmd.syntax "reset" end
	local function link(links)
		vim.g.terminal_color_0 = colors[links[8]][1]
		vim.g.terminal_color_15 = colors[links[1]][1]
		colors.Fg1 = links[1] == "Black" and {"#000000", 0} or {"#ffffff", 15}
		vim.api.nvim_set_hl(0, "Fg1", {fg = colors.Fg1[1]})
		local color = colors[links[1]]
		colors.Bg8 = color
		vim.api.nvim_set_hl(0, "Bg8", {bg = color[1], ctermbg = color[2]})
		for i = 8, 2, -1 do
			color = colors[links[i]]
			local idx = "Fg" .. i
			colors[idx] = color
			vim.api.nvim_set_hl(0, idx, {link = links[i]})
			idx = "Bg" .. (9 - i)
			colors[idx] = color
			vim.api.nvim_set_hl(0, idx, {bg = color[1], ctermbg = color[2]})
		end
	end
	if vim.o.background == "light" then
		link({"Black", "Black2", "Grey", "Grey2", "LightGrey2", "LightGrey", "White2", "White"})
		vim.api.nvim_set_hl(0, "Normal", {
			ctermfg = 0,
			ctermbg = 15,
			fg = "#000000",
			bg = vim.g.bg_none and "NONE" or "#faf8ff",
		})
	else
		link({"White", "White2", "LightGrey", "LightGrey2", "Grey2", "Grey", "Black2", "Black"})
		vim.api.nvim_set_hl(0, "Normal", {
			ctermbg = 0,
			ctermfg = 15,
			fg = "#ffffff",
			bg = vim.g.bg_none and "NONE" or "#101010",
		})
	end
	hiTheme(M.themeDep)
	vim.g.colors_name = "nerdcontrast"

	if package.loaded.feline then require'feline'.use_theme({fg = colors.Fg1[1], bg = colors.Bg1[1]}) end
	if not M.loaded then
		M.hi(require "nerdcontrast.groups")
		vim.schedule(function() require "nerdcontrast.lazy_load"(M) end)
		M.loaded = true
	end
end
return M
