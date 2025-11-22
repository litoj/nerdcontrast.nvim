local ret = {
	['@variable'] = 'Variable',
	['@variable.parameter'] = 'Parameter',
	['@variable.member'] = 'Field', -- field; TODO: concrete distinctions
	['@property'] = 'Field', -- field with getter/setter
	['@attribute'] = 'Parameter', -- direct access public field, given on creation → parameter-like
	['@environment'] = 'Constant',
	['@constant.builtin'] = 'Boolean',
	['@variable.builtin'] = { fg = 'BuiltinVar', italic = true },
	['@function.builtin'] = { fg = 'BuiltinFn', italic = true },

	['@namespace'] = 'BuiltinVar',
	['@keyword.directive'] = 'PreProc',
	['@function.macro'] = { fg = 'PreProc', underline = true, bold = true, sp = 'Define' },
	['@module'] = '@namespace',
	['@module.builtin'] = '@variable.builtin',
	['@constructor'] = 'Type',
	['@type.builtin'] = { fg = 'Type', italic = true },

	['@storageclass'] = 'Keyword',
	['@keyword.conditional'] = 'Conditional',
	['@keyword.repeat'] = 'Repeat',
	['@keyword.return'] = 'FlowControl',
	['@keyword.operator'] = 'Operator',
	['@string.special'] = 'LightOrange',
	['@punctuation.special'] = 'LightRed',
	-- Java
	['@type.qualifier'] = 'Keyword',
	['@attribute.java'] = 'PreProc',
	-- HTML
	['@tag'] = 'Tag',
	['@tag.delimiter'] = 'Delimiter',
	['@tag.attribute'] = '@attribute',
	-- SQL
	['@type.qualifier.sql'] = 'Conditional',
	['@keyword.operator.sql'] = 'Conditional',
	-- Vim
	['@variable.builtin.vim'] = 'Variable',
	['@string.regex.vim'] = '@string.special',
	['@string.special.vim'] = '@string',
	-- Make
	['@symbol.make'] = 'Variable',
	['@string.make'] = 'Variable',
	['@operator.make'] = 'Delimiter',
	-- Lua
	['@constructor.lua'] = 'Delimiter',
	-- ['@property.lua'] = '', -- false highlighting of table field definition via { [var-indexing] = xxx}
	['@function.lua'] = 'Define',
	['@function.call.lua'] = 'Function',
	-- Markdown, LaTeX
	['@markup.list.checked'] = { fg = 'Green', bold = true },
	['@markup.list.unchecked'] = 'Todo',
	['@markup.link.label'] = 'Url',
	['@markup.link.url'] = { fg = 'SpecialComment', underline = true },
	['@markup.italic'] = 'Italic',
	['@markup.strong'] = 'Bold',
	['@markup.quote'] = { fg = 'Fg2', bg = 'Bg1b', italic = true },
	['@markup.strikethrough'] = { strikethrough = true },
	['@markup.heading'] = '', -- workaround for overwriting heading highlights
	['@markup.heading.marker'] = { fg = 'FlowControl', bold = true },
	['@markup.heading.1'] = { fg = 'Title', bold = true, underdouble = true },
	['@markup.heading.2'] = { fg = 'Title', bold = true, underdouble = true, italic = true },
	['@markup.heading.3'] = { fg = 'Title', bold = true, underline = true },
	['@markup.heading.4'] = { fg = 'Title', bold = true, underline = true, italic = true },
	['@markup.heading.5'] = { fg = 'Title', bold = true, underdashed = true },
	['@markup.heading.6'] = { fg = 'Title', bold = true, underdashed = true, italic = true },
	['@markup.list'] = 'Red',
	['@markup.link'] = 'Delimiter',
	['@conceal.markdown_inline'] = 'Delimiter',
	['@markup.raw.delimiter'] = 'Delimiter',
	['@markup.raw.block'] = { fg = 'Fg2' },
	['@markup.raw'] = 'PreProc',
	-- Other
	['@type.builtin.kotlin'] = 'Type',
	['@keyword.import.c'] = 'PreProc',
	['@keyword.import.cpp'] = 'PreProc',
	['@conceal.json'] = 'String',
	['@module.javascript'] = 'Variable',
	['@module.typescript'] = 'Variable',
	['@operator.regex'] = '@string.special',
	['@type.query'] = 'Keyword',
	['@keyword.jsdoc'] = 'PreProc',
	['@keyword.doxygen'] = 'PreProc',
	['@comment.note'] = 'Todo',
}

local has = require('nvim-treesitter.parsers').has_parser
-- conditionally disable lsp highlighting in preference of parsers
if has 'luadoc' then
	ret['@keyword.luadoc'] = 'PreProc'
	ret['@function.macro.luadoc'] = { fg = 'Type', sp = 'Define', underline = true, bold = true }
	ret['@lsp.type.variable.lua'] = ''
	-- ret['@lsp.type.type.lua'] = ''
	ret['@lsp.type.macro.lua'] = ''
else
	ret['@lsp.type.macro.lua'] = { fg = 'Type', sp = 'Define', underline = true, bold = true }
end

return ret
