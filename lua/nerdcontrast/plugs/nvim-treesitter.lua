return {
	['@variable'] = 'Variable',
	['@variable.parameter'] = 'Parameter',
	['@variable.member'] = 'Field', -- field; TODO: concrete distinctions
	['@property'] = 'Field', -- field with getter/setter
	['@attribute'] = 'Field', -- direct access public field
	['@environment'] = 'Constant',
	['@constant.builtin'] = 'Boolean',
	['@variable.builtin'] = { fg = 'BuiltinVar', italic = true },
	['@function.builtin'] = { fg = 'BuiltinFn', italic = true },

	['@namespace'] = 'Label',
	['@keyword.directive'] = 'PreProc',
	['@module'] = 'Label',
	['@module.builtin'] = { fg = 'Label', italic = true },
	['@constructor'] = 'Type',
	['@type.builtin'] = { fg = 'Type', italic = true },

	['@storageclass'] = 'Keyword',
	['@keyword.conditional'] = 'Conditional',
	['@keyword.repeat'] = 'Repeat',
	['@string.special'] = 'LightOrange',
	-- Markdown
	['@markup.raw'] = 'PreProc',
	['@markup.raw.block'] = 'Fg1',
	['@markup.list.checked'] = { fg = 'Green', bold = true },
	['@markup.list.unchecked'] = 'Todo',
	['@markup.link.label'] = 'Url',
	['@markup.link.url'] = { fg = 'SpecialComment', underline = true },
	['@markup.italic'] = 'Italic',
	['@markup.strong'] = 'Bold',
	['@markup.strikethrough'] = { strikethrough = true },

	['@markup.heading'] = 'Title',
	['@markup.heading.1'] = { fg = 'Title', bold = true, underline = true },
	['@markup.heading.3'] = { fg = 'Title', bold = true, italic = true },
	['@markup.heading.4'] = 'Title',
	['@markup.heading.5'] = { fg = 'Title', italic = true },
	['@markup.heading.1.marker'] = { fg = 'Delimiter', bold = true },
	['@markup.heading.2.marker'] = '@markup.heading.1.marker',
	['@markup.heading.3.marker'] = 'Delimiter',
	['@markup.heading.4.marker'] = 'Delimiter',
	['@markup.heading.5.marker'] = 'Delimiter',
	['@markup.list'] = 'Delimiter',
	['@markup.link'] = 'Delimiter',
	['@markup.raw.delimiter'] = 'Delimiter',
	['@conceal.markdown_inline'] = 'Delimiter',
	-- GitCommit
	['@markup.link.gitcommit'] = 'Variable',
	['@string.special.url'] = 'File',
	-- Java
	['@type.qualifier'] = 'Keyword',
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
	['@label.vimdoc'] = 'Magenta',
	-- Make
	['@symbol.make'] = 'Variable',
	['@string.make'] = 'Variable',
	['@operator.make'] = 'Delimiter',
	-- Other
	['@type.builtin.kotlin'] = 'Type',
	['@keyword.import.c'] = 'PreProc',
	['@keyword.import.cpp'] = 'PreProc',
	['@conceal.json'] = 'String',
	['@namespace.javascript'] = 'Variable',
	['@namespace.typescript'] = 'Variable',
	['@operator.regex'] = '@string.special',
	['@type.query'] = 'Keyword',
	['@constructor.lua'] = 'Delimiter',
	['@keyword.luadoc'] = 'PreProc',
	['@function.macro.luadoc'] = 'Constant',
	['@keyword.jsdoc'] = 'PreProc',
}
