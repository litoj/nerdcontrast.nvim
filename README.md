# nerdcontrast.nvim

A colorscheme with optimal contrast based on default light theme of NetBeans IDE

choose between **Light** and **Dark**, but keep all colors the same

## Requirements

- Neovim 0.8.0+

## Installation

### [`lazy.nvim`](https://github.com/folke/lazy.nvim)

```lua
return {
  "JosefLitos/nerdcontrast.nvim",
  lazy = false,
  priority = 999,
  config = true -- automatically sets colorscheme, or fun() like packer
}
```

### [`packer.nvim`](https://github.com/wbthomason/packer.nvim)

```lua
packer.use {
  "JosefLitos/nerdcontrast.nvim",
  config = function()
    vim.o.background = "dark" -- default, "light" for light theme
    vim.cmd.colorscheme "nerdcontrast"
    -- or manual for setting other options, default settings
    require'nerdcontrast'.setup {
      bg = true, -- set default bg, otherwise transparent
      export = 0, -- set source terminal theme 1=bg+fg, 2=all
    }
  end,
}
```

## Wider usage

### Theme toggle

```lua
-- Dark/Light theme toggle
nmap("n", "<Leader>c", function()
	vim.o.background = vim.o.background == "light" and "dark" or "light"
	vim.cmd.colorscheme "nerdcontrast" -- or `require'nerdcontrast'.setup()`
end)
```

### Highlight group customization

```lua
local nc = require "nerdcontrast"

nc.hi({
  -- set hex values of given nerdcontrast custom colors
  BoldGreen = {fg = "Green", bold = true},
  -- directly linked
  DefaultFg = "Fg1", -- fg part of `Normal`, Fg2=Bg7..Fg7=Bg2
  WhiteBg = "Bg7", -- Fgx changes Text, Bgx changes background
	-- put colors in a separate table for using `Fgx`/`Bgx` by value
	-- colors in 1. table, effects in 2. table
  Error = {{fg = "Fg4", bg = "Red"}},
  GraySpiked = {{sp = "Bg3"}, {undercurl = true}},
})
```

## Support

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [Feline](https://github.com/feline-nvim/feline.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [RnivmR](https://github.com/kevinhwang91/rnvimr)
- ...

## Screenshots

![Markdown](https://user-images.githubusercontent.com/54900518/208907793-5ddb1616-b96c-461f-8d89-73bc525ab885.png)
![Lua](https://user-images.githubusercontent.com/54900518/208909818-5550485a-652f-43cd-9328-ca536dddb4d8.png)

## Available colors

| DarkName | Code    | BrightName   | Code    |
| -------- | ------- | ------------ | ------- |
| Black    | #282828 | LightGrey2   | #959391 |
| Black2   | #424242 | LightGrey    | #b5b5b5 |
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
| Grey     | #5c5a58 | White2       | #dad8d5 |
| Grey2    | #7a7876 | White        | #f6f5f4 |

## Get color codes

Get color hex with `require'nerdcontrast'.colors["Color name"][1]`
or link to them directly by name

For Dark/Light independency, `Bg1-Bg7` and `Fg1-Fg8` color links are also available. If you
wish to use them and are expecting to be using the toggle shortcut, please refer to them through
Vim's `hi link` feature or set the value with `require'nerdcontrast'.hi({})` in the forementioned
format.
