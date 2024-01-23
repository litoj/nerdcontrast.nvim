# nerdcontrast.nvim

A colorscheme helper with some default based on default theme of big java IDEs.

## Requirements

- Neovim 0.8.0+

## Installation

### [`lazy.nvim`](https://github.com/folke/lazy.nvim)

```lua
return {
  'JosefLitos/nerdcontrast.nvim',
  lazy = false,
  priority = 1000,
  opts = { -- use config = fun() to change vim.o.bg beforehand
    export = false, -- set underlying terminal's colors to the theme
    opacity = true, -- false: no bg, true: nvim bg, '00'-'ff': term opacity
    theme = {base = 'nc', override = {}}, -- default used theme, unles changed
    light = {palette = {base = 'light'}}, -- opts above, light bg specific
    dark = {palette = {base = 'dark'}}, -- opts above, dark bg specific
  }
}
```

<details><summary>

### Screenshots

</summary>

- default `nc` theme
  ![nc md](https://user-images.githubusercontent.com/54900518/208907793-5ddb1616-b96c-461f-8d89-73bc525ab885.png)
  ![nc lua](https://user-images.githubusercontent.com/54900518/208909818-5550485a-652f-43cd-9328-ca536dddb4d8.png)

</details>

## Wider usage

### Theme toggle

```lua
-- Dark/Soft theme toggle
nmap('n', '<Leader>c', function()
  vim.o.bg = vim.o.bg == 'light' and 'dark' or 'light'
end)
```

### Day/Night theme change

```lua
require'nerdcontrast'.setup { -- set your presets
  export = true,
  light = {opacity = 'ff'},
  dark = {opacity = 'cc'},
}
local t = io.popen('sunwait poll 50N 14.5E', 'r')
if t ~= nil then -- determine day or night
  vim.o.background = t:read('*l') == 'DAY' and 'light' or 'dark'
  t.close(t)
else
  local h = os.time() % 86400 / 3600 +TZ
  vim.o.background = (7 < h and h < 20) and 'light' or 'dark'
end
```

### Highlight group customization

```lua
local nc = require 'nerdcontrast'

nc.setup { -- changes in both light and dark bg
	-- set palette/hue used by themes or add your own
  palette = {custom = {CustomColor = {bg = '#dd3388'}}}
	-- themes change what colors basic groups use
  theme = {override = {Operator = 'CustomColor'}} -- all related groups updated
}
nc.hi {
  OneBog = {fg='CustomColor', bg='Operator'}, -- both are available

  -- set hex values of given nerdcontrast custom colors
  BoldGreen = {fg = 'Green', bold = true},
  -- directly linked
  DefaultFg = 'Fg1', -- fg part of `Normal`… - Fg1,…,Fg5,Bg4,…,Bg1
  CursorBg = 'Bg2', -- BgX changes background
  -- Basic nvim groups set in `theme`, use these to be theme independent
  Error = {fg = 'Comment', bg = 'Red'}, -- specific color set in `palette`
  BgGraySpiked = {sp = 'Bg3', undercurl = true},
}
nc.setup {
  -- set overlay for NvimTree + BarBar, different for light and dark bg
  light = {theme = {override = {WinBar = 'Bg2', WinBarNC = 'Bg3'}}, opacity = 'ff'},
  dark = {theme = {override = {WinBar = 'Bg1b', WinBarNC = 'Bg2b'}}, opacity = 'cc'},
}
```

### Plugin support

see the [plugin folder](./lua/nerdcontrast/plugs/) and extra
[small adjustments](./lua/nerdcontrast/plugs/nerdcontrast.lua)

## Available colors/themes

- see available [palettes](./lua/nerdcontrast/palette/) and [themes](./lua/nerdcontrast/theme/)
- or make your own and use them with directly as `base` tbl or path to your module

## Get color codes

Get color hex with `require'nerdcontrast'.palette/theme['Color name'][1]` or link to them directly
by name
- for bg independency, `Bg/Fg<x>` and other color links under `nc.palette` are available
	- `palette` colors are targeted for colorscheme creation
- for extra highlights prefer use of `nc.theme` groups for theme independency

