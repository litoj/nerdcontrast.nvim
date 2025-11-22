---@class nerdcontrast.Highlight: vim.api.keyset.highlight
---@field sp? string
---@field fg? string
---@field bg? string
---@field [1]? vim.api.keyset.highlight

---@alias nerdcontrast.Palette table<string,string> map of color hexcodes / color name links
---@alias nerdcontrast.InitPalette table<string,vim.api.keyset.highlight> map of color definitions

---@class nerdcontrast.ThemeConfig
---@field palette? string|{base?:nerdcontrast.InitPalette|string,
--- override?:nerdcontrast.InitPalette} color definitions or nerdcontrast.palette.<name> of color palette + overrides
---@field theme? string|{base?:nerdcontrast.Palette|string,
--- override?:nerdcontrast.Palette} base group → color name map or nerdcontrast.theme.<name> of theme
---@field opacity? boolean|string false for terminal bg, true for nvim bg, '00'-'ff' for terminal opacity

---@class nerdcontrast.Config: nerdcontrast.ThemeConfig
---@field defer? false|integer defer ft+plugs highlights by given time
---@field export? boolean set underlying terminal's colors to the theme
---@field light? nerdcontrast.ThemeConfig defaults override for light theme
---@field dark? nerdcontrast.ThemeConfig defaults override for dark theme
---@field reload? boolean reload on each theme change
