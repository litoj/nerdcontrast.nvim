---@class nerdcontrast.Highlight
---@field sp? string
---@field fg? string
---@field bg? string
---@field [1] vim.api.keyset.highlight
---@alias nerdcontrast.Palette table<string,string> map of color hexcodes
---@alias nerdcontrast.InitPalette table<string,vim.api.keyset.highlight> map of color definitions
---@class nerdcontrast.Config
---@field bg? boolean fill background or leave it transparent
---@field defer? false|integer defer ft+plugs highlights by given time
---@field export? 0|1|2 set source terminal colours to the theme, 1=bg+fg, 2=all
---@field palette? nerdcontrast.InitPalette
---@field opacity? string set terminal background opacity ('00' - 'ff')
---@field overlay? boolean set nvimtree+bufferline to distinct Bg
---@field reload? boolean reload on each theme change
---@class nerdcontrast
---@field config nerdcontrast.Config
---@field palette nerdcontrast.Palette
---@field addPalette fun(tbl: nerdcontrast.InitPalette)
---@field groups table<string,nerdcontrast.Highlight>
---@field hi fun(tbl: table<string,nerdcontrast.Highlight|string>) highlight or link a color
---@field setup fun(opts?: nerdcontrast.Config) Plugin setup with optional configuration
---@field loaded boolean
