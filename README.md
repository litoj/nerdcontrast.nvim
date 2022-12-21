# nerdcontrast

A colorscheme with optimal contrast based on default light theme of NetBeans IDE

choose between **Light** and **Dark** dynamically

## Requirements

- Neovim 0.8.0+

## Installing with [`packer`](https://github.com/wbthomason/packer.nvim)

```lua
require'packer'.startup(function(use)
  ...
  use "JosefLitos/nerdcontrast.nvim"
  use {"JosefLitos/nerdcontrast.nvim", config = function()
    -- with extra custom colors
    require'nerdcontrast'.hi({
      -- set hex values of given colors
      BoldGreen = {fg = "Green", bold = true},
      -- directly linked
      WhiteFg = "Fg", -- Fg hex = Bg8 hex, Fg2=Bg7...
      WhiteBg = "Bg8", -- Fg changes Text, Bg changes background
    })
    -- for colors using unlinked `Fg` or `Bg` values
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
  -- Transparent bg
  vim.g.bg_none = vim.o.background == "dark"
	vim.cmd.colorscheme "nerdcontrast" -- or `require'nerdcontrast'.load()`
end)
```

## Support

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [Feline](https://github.com/feline-nvim/feline.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [RnivmR](https://github.com/kevinhwang91/rnvimr)

## Screenshots

![Markdown](https://user-images.githubusercontent.com/54900518/208907793-5ddb1616-b96c-461f-8d89-73bc525ab885.png)
![Lua](https://user-images.githubusercontent.com/54900518/208909818-5550485a-652f-43cd-9328-ca536dddb4d8.png)

## Available colors

| DarkName | Code    | BrightName   | Code    |
| -------- | ------- | ------------ | ------- |
| Black    | #222222 | LightGrey    | #bdbcbb |
| Magenta  | #a030a8 | LightMagenta | #c850e0 |
| Pink     | #c06680 | LightPink    | #e7909a |
| Red      | #cc2815 | LightRed     | #f03522 |
| Brown    | #885515 | None         | NONE    |
| Orange   | #cc6415 | LightOrange  | #f09322 |
| Yellow   | #cca815 | LightYellow  | #e8d822 |
| Olive    | #99a015 | LightOlive   | #b0cd22 |
| Green    | #54a015 | LightGreen   | #66d022 |
| Cyan     | #32a08d | LightCyan    | #66e0c0 |
| Blue     | #3870c0 | LightBlue    | #50a8f0 |
| Grey     | #5a5856 | White        | #f0eeea |

## Get color codes

Get color hex with `require'nerdcontrast'.colors["Color name"][1]`

For ease of use, the main used colors are linked as shortcuts to allow simple change:

| Link           | Color        |
| -------------- | ------------ |
| Highlight      | Green        |
| LightHighlight | LightGreen   |
| Contrast       | Magenta      |
| LightContrast  | LightMagenta |

For Dark/Light independency, `Bg,Bg2-Bg8` and `Fg,Fg2-Fg8` color links are also available. If you
wish to use them and are expecting to be using the toggle shortcut, please refer to them through
Vim's `hi link` feature or set the value with `require'nerdcontrast'.themeDep["Color name"]` and
reload the theme
