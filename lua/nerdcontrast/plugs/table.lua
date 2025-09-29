-- cannot figure out a working hook for vim.lsp so using always-loaded 'table' to load lsp colors
vim.api.nvim_create_autocmd('LspTokenUpdate', {
	group = vim.api.nvim_create_augroup('LspTokenHighlight', { clear = true }),
	callback = function(args)
		local token = args.data.token
		if
			token.modifiers.readonly
			and token.type == 'variable'
			and (token.modifiers.static or token.modifiers.fileScope or token.modifiers.globalScope)
		then
			vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, 'Constant')
		elseif
			token.modifiers.globalScope
			and token.modifiers.defaultLibrary
			and token.type == 'variable'
		then
			vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, '@namespace')
		end
	end,
})

return {
	DiagnosticVirtualTextError = { fg = 'Red', italic = true, bold = true },
	DiagnosticVirtualTextWarn = { fg = 'LightOrange', italic = true },
	DiagnosticVirtualTextHint = 'DiagnosticVirtualTextOk',
	DiagnosticVirtualTextInfo = 'DiagnosticVirtualTextOk',
	DiagnosticVirtualTextOk = { fg = 'Fg5', italic = true },
	DiagnosticUnderlineError = { sp = 'Red', undercurl = true },
	DiagnosticUnderlineWarn = { sp = 'LightOrange', undercurl = true },
	DiagnosticUnderlineHint = { sp = 'Fg5', undercurl = true },
	DiagnosticUnderlineInfo = 'DiagnosticUnderlineHint',
	DiagnosticError = 'Red',
	DiagnosticWarn = 'LightOrange',
	DiagnosticHint = 'Fg3',
	DiagnosticInfo = 'DiagnosticOk',
	DiagnosticOk = 'Ac2',
	DiagnosticFloatingError = 'DiagnosticError',
	DiagnosticFloatingWarn = 'DiagnosticWarn',
	DiagnosticFloatingHint = 'DiagnosticHint',
	DiagnosticFloatingInfo = 'DiagnosticInfo',
	DiagnosticFloatingOk = 'DiagnosticOk',
	DiagnosticDeprecated = { sp = 'Fg5', strikethrough = true },
	DiagnosticUnnecessary = 'DiagnosticUnderlineHint',
	LspReferenceRead = { bg = 'Bg3', fg = 'Cyan', bold = true },
	LspReferenceText = { bg = 'Bg3', fg = 'Yellow', bold = true },
	LspReferenceWrite = { bg = 'Bg3', fg = 'Orange', bold = true },
	LspInlayHint = { bg = 'Bg1b', fg = 'Fg5' },
	['@lsp'] = '',
	['@lsp.type.property'] = '@property',
	['@lsp.type.variable'] = 'Variable',
	['@lsp.type.variable.lua'] = '',
	['@lsp.type.parameter'] = 'Parameter',
	['@lsp.type.typeParameter'] = { fg = 'FgGreen', bold = true },
	['@lsp.type.macro'] = 'Macro',
	['@lsp.type.namespace'] = '@namespace',
	['@lsp.type.event'] = 'Orange',
	['@lsp.mod.readonly'] = 'Bg2',
	['@lsp.mod.static'] = 'Italic',
	['@lsp.mod.global'] = 'Italic',
	['@lsp.mod.globalScope'] = 'Italic',
	['@lsp.mod.fileScope'] = 'Italic',
	['@lsp.mod.defaultLibrary'] = 'Italic',
	['@lsp.typemod.function.defaultLibrary'] = '@function.builtin',
	['@lsp.typemod.variable.defaultLibrary'] = '@variable.builtin',
	['@lsp.typemod.variable.classScope'] = 'Field',
	['@lsp.typemod.class.declaration'] = 'TypeDef',
	['@lsp.typemod.keyword.documentation'] = 'PreProc',
	['@lsp.mod.declaration'] = { sp = 'Magenta', underline = true },
	['@lsp.type.variable.typescript'] = '',
}
