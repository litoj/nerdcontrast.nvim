# nerdcontrast

A colourscheme with optimal contrast based on default light theme of NetBeans IDE

**Light** and **Dark** variants

## Requirements

- Neovim 0.7.0+

## Installing with [`packer`](https://github.com/wbthomason/packer.nvim)

```lua
require'packer'.startup(function(use)
	...
	use "JosefLitos/nerdcontrast.nvim"
	use {"JosefLitos/nerdcontrast.nvim", config = function()
  -- with extra custom colors
    require'nerdcontrast'.hi({
      -- set hex values of given colours
      BoldGreen = {fg = "Green", bold = true},
      -- directly linked
      WhiteFg = "Fg", -- Fg hex = Bg8 hex, Fg2=Bg7...
      WhiteBg = "Bg8", -- Fg changes Text, Bg changes background
    })
  -- for colours using unlinked `Fg` or `Bg` values
  -- color in 1. table, effects in 2. table
    vim.tbl_extend("force", require'nerdcontrast'.themeDep, {
      Error = {{fg = "Fg8", bg = "Red"}},
      GraySpiked = {{sp = "Bg3"}, {undercurl = true}},
    })
  end}
end)
```

## Enable

Put this near the top of your `init.lua`.

```lua
vim.o.background = "light" -- defaults to dark theme (value = "dark")
vim.cmd.colorscheme "nerdcontrast"
```

For change based on daylight, use this:

```lua
local time = tonumber(os.date("%H"))
local month = tonumber(os.date("%m"))
if month > 6 then month = 12 - month end
month = math.floor(month / 2)
vim.o.background = (time > 8 - month and time < 17 + month) and "light" or "dark"
```

An optional keybind toggle:

```lua
-- Dark/Light theme toggle
nmap("n", "<Leader>c", function()
	vim.o.background = vim.o.background == "light" and "dark" or "light"
	vim.cmd.colorscheme "nerdcontrast" -- or `require'nerdcontrast'.load()`
  --[[ if you use galaxyline you have to load it's config again
	package.loaded["galaxyline-s"] = nil
	require "galaxyline-s"
  ]]
end)
```

## Support

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [Galaxyline](https://github.com/NTBBloodbath/galaxyline.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [RnivmR](https://github.com/kevinhwang91/rnvimr)

## Screenshots

![Markdown](https://user-images.githubusercontent.com/54900518/150679390-89653466-d66a-4286-8288-29c58faa096a.png)
![Lua](https://user-images.githubusercontent.com/54900518/150679516-f89dbcd1-f789-457c-a290-7934af949624.png)

## Available colours

| DarkName | Code    | BrightName   | Code    |
| -------- | ------- | ------------ | ------- |
| Black    | #222222 | LightGrey    | #bdbcbb |
| Violet   | #9040a8 | LightViolet  | #ad4dd0 |
| Magenta  | #ad30a8 | LightMagenta | #bd40b7 |
| Pink     | #c06680 | LightPink    | #e7909a |
| Red      | #cc2815 | LightRed     | #f03522 |
| Brown    | #885515 | None         | NONE    |
| Orange   | #cc6415 | LightOrange  | #f09322 |
| Yellow   | #cfa815 | LightYellow  | #e8d822 |
| Olive    | #99a015 | LightOlive   | #b0cd22 |
| Green    | #54a015 | LightGreen   | #77dd22 |
| Cyan     | #32a08d | LightCyan    | #66e0c0 |
| Blue     | #3268ad | LightBlue    | #40a3e0 |
| Grey     | #5a5856 | White        | #f0eeea |

## Get colour codes

Get colour hex with `require'nerdcontrast'.colors["Colour name"][1]`

For ease of use, the main used colours are linked as shortcuts to allow simple change:

| Link           | Colour       |
| -------------- | ------------ |
| Highlight      | Green        |
| LightHighlight | LightGreen   |
| Contrast       | Magenta      |
| LightContrast  | LightMagenta |

For Dark/Light independency, `Bg,Bg2-Bg8` and `Fg,Fg2-Fg8` colour links are also available. If you wish to use them
and are expecting to be using the toggle shortcut, please refer to them through Vim's `hi link`
feature or set the value with `require'nerdcontrast'.themeDep["Colour name"]` and reload the theme
