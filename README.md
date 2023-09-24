# nerdcontrast.nvim

A colourscheme with optimal contrast based on default light theme of NetBeans IDE

choose between **Light** and **Dark**, but keep all colours the same

## Requirements

- Neovim 0.8.0+

## Installation

### [`lazy.nvim`](https://github.com/folke/lazy.nvim)

```lua
return {
  'JosefLitos/nerdcontrast.nvim',
  lazy = false,
  priority = 1000,
  config = true -- automatically sets colourscheme, or fun() like packer
}
```

### [`packer.nvim`](https://github.com/wbthomason/packer.nvim)

```lua
packer.use {
  'JosefLitos/nerdcontrast.nvim',
  config = function()
    vim.o.background = 'dark' -- default, 'light' for light theme
    vim.cmd.colorscheme 'nerdcontrast'
    -- or manual for setting other options, default settings:
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
nmap('n', '<Leader>c', function()
	vim.o.background = vim.o.background == 'light' and 'dark' or 'light'
	vim.cmd.colorscheme 'nerdcontrast' -- or `require'nerdcontrast'.setup{}`
end)
```

### Day/Night theme change

```lua
local t = io.popen('sunwait poll 50N 14.5E', 'r')
if t ~= nil then
  local ret = t.read(t, '*a')
  t.close(t)
  vim.o.background = ret == 'DAY\n' and 'light' or 'dark'
else
  local h = os.time() % 86400 / 3600 +TZ
  vim.o.background = (7 < h and h < 20) and 'light' or 'dark'
end
require'nerdcontrast'.setup {
  bg = false,
  export = 1,
  overlay = true,
  opacity = vim.o.background == 'light' and 'ff' or 'b2',
}
```

### Highlight group customization

```lua
local nc = require 'nerdcontrast'

nc.hi({
  -- set hex values of given nerdcontrast custom colours
  BoldGreen = {fg = 'Green', bold = true},
  -- directly linked
  DefaultFg = 'Fg1', -- fg part of `Normal`... - Fg5=Bg5
  CursorBg = 'BgHi', -- BgX changes background
	-- for using changing colours, put effects in an extra table
  Error = {fg = 'Fg4', bg = 'Red', {}},
  GraySpiked = {sp = 'Bg3', {undercurl = true}},
  -- custom rgb for onetime use
  CustomColour = {{bg = '#dd3388', ctermbg = 9}}
})
-- dynamic colour registration - for multiple usages
nc.addPalette {
	Overlay = setmetatable({}, {
		__index = function(self, i)
			if i == 'bg' then
				local c = nc.palette[nc.config.overlay and 'Bg2' or 'Bg0']
				self[1] = c[1]
				self[2] = c[2]
        return true -- default as background highlight
			end
		end,
	})
}
```

## Plugin support

see [general groups](./lua/nerdcontrast/groups.lua) and [plugin folder](./lua/nerdcontrast/plugs/)

## Screenshots

![Markdown](https://user-images.githubusercontent.com/54900518/208907793-5ddb1616-b96c-461f-8d89-73bc525ab885.png)
![Lua](https://user-images.githubusercontent.com/54900518/208909818-5550485a-652f-43cd-9328-ca536dddb4d8.png)

## Available colours

see [palettes](./lua/nerdcontrast/palette/) and [defaults](./lua/nerdcontrast/init.lua)

## Get colour codes

Get colour hex with `require'nerdcontrast'.palette['Colour name'][1]` or link to them directly by
name

For Dark/Light independency, `Bg<x>`, `Fg1-Fg5` and other colour links under
`nerdcontrast.palette.` are also available. If you wish to use them and are expecting to be using
the toggle shortcut, please refer to them through Vim's `hi link` feature or set the value with
`require'nerdcontrast'.hi({})` in the forementioned format.
