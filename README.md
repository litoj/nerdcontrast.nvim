# nerdcontrast.nvim

A dark colourscheme with optimal contrast based on default light theme of NetBeans IDE

## Requirements

- Neovim 0.6.0+

## Installing with [`packer`](https://github.com/wbthomason/packer.nvim)

```lua
require'packer'.startup(function(use)
	...
	use "JosefLitos/nerdcontrast.nvim"
end)
```

## Enable

Put this near the top of your `init.lua`.

```lua
vim.cmd "colorscheme nerdcontrast"
```

## Support

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [LspSaga](https://github.com/tami5/lspsaga.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [RnivmR](https://github.com/kevinhwang91/rnvimr)
- [Startify](https://github.com/mhinz/vim-startify)

## Screenshots

![Markdown](https://user-images.githubusercontent.com/54900518/150679390-89653466-d66a-4286-8288-29c58faa096a.png)
![Lua](https://user-images.githubusercontent.com/54900518/150679516-f89dbcd1-f789-457c-a290-7934af949624.png)

## Available colours

| DarkName | Code    | BrightName   | Code    |
| -------- | ------- | ------------ | ------- |
| Black    | #222222 | LightGrey    | #969390 |
| Violet   | #9040a8 | LightViolet  | #ad4dd0 |
| Magenta  | #ad30a8 | LightMagenta | #bd40b7 |
| Pink     | #c06680 | LightPink    | #e7909a |
| Red      | #cc2815 | LightRed     | #f03522 |
| Brown    | #885515 | None         | NONE    |
| Orange   | #cc6415 | LightOrange  | #f09322 |
| Yellow   | #cfa815 | LightYellow  | #f0e822 |
| Olive    | #99a015 | LightOlive   | #c0e022 |
| Green    | #54a015 | LightGreen   | #85f022 |
| Cyan     | #32a08d | LightCyan    | #80f0c8 |
| Blue     | #326dcd | LightBlue    | #40a3e0 |
| None     | NONE    | MarineBlue   | #88c0e0 |
| Grey     | #5a5856 | White        | #f0eeea |

## Wider usage

For more colour customization use global `colours["Colour name"][1]`
You can link other colours to the same name as in the table.
Create customized highlights using `hi` method like:

```lua
hi("toSet", "fgColour", "bgColour", "bold,undercurl,NONE", "underlineColour")
```
