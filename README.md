# nerdcontrast.nvim

A colourscheme with optimal contrast based on default light theme of NetBeans IDE

choose between **Light** and **Dark**, but keep all colours the same

## Requirements

- Neovim 0.8.0+

## Installation

### [`lazy.nvim`](https://github.com/folke/lazy.nvim)

```lua
return {
  "JosefLitos/nerdcontrast.nvim",
  lazy = false,
  priority = 1000,
  config = true -- automatically sets colourscheme, or fun() like packer
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
      overlay = false, -- set nvimtree and bufferline bg to statusline bg
      palette = {}, -- custom colour palette, see `nerdcontrast.initPalette`
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
	vim.cmd.colorscheme "nerdcontrast" -- or `require'nerdcontrast'.setup{}`
end)
```

### Highlight group customization

```lua
local nc = require "nerdcontrast"

nc.hi({
  -- set hex values of given nerdcontrast custom colours
  BoldGreen = {fg = "Green", bold = true},
  -- directly linked
  DefaultFg = "Fg1", -- fg part of `Normal`... - Fg5=Bg5
  CursorBg = "BgHi", -- BgX changes background
	-- put colours in a separate table for using `Fgx`/`Bgx` by value
	-- colours in 1st table, effects in 2nd table
  Error = {{fg = "Fg4", bg = "Red"}},
  GraySpiked = {{sp = "Bg3"}, {undercurl = true}},
})
-- using custom rgb; could be simplified, but this is faster
nc.setPalette({fg = {MyLovelyColor = {"#dd3388", 9}}})
nc.hi({ UsingCustomColor = {sp = "MyLovelyColor", underwave = true} })
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

## Available colours

| DarkName | Code    | BrightName   | Code    |
| -------- | ------- | ------------ | ------- |
| Magenta  | #a030a8 | LightMagenta | #c850e0 |
| Pink     | #c06680 | LightPink    | #e7909a |
| Red      | #cc2815 | LightRed     | #f03522 |
| Brown    | #885515 | SlateGrey    | #7880ae |
| Orange   | #cc6415 | LightOrange  | #f09322 |
| Yellow   | #cca815 | LightYellow  | #e8d822 |
| Olive    | #99a015 | LightOlive   | #b0cd22 |
| Green    | #54a015 | LightGreen   | #66d022 |
| Cyan     | #32a08d | LightCyan    | #66e0c0 |
| Blue     | #3870c0 | LightBlue    | #50a8f0 |

## Get colour codes

Get colour hex with `require'nerdcontrast'.palette["Colour name"][1]` or link to them directly by
name

For Dark/Light independency, `Bg<x>`, `Fg1-Fg5` and other colour links under
`nerdcontrast.palette.` are also available. If you wish to use them and are expecting to be using
the toggle shortcut, please refer to them through Vim's `hi link` feature or set the value with
`require'nerdcontrast'.hi({})` in the forementioned format.
