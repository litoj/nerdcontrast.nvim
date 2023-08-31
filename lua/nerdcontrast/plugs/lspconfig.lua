local gid = vim.api.nvim_create_augroup('LspTokenHighlight', { clear = true })
vim.api.nvim_create_autocmd('LspTokenUpdate', {
	group = gid,
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
	DiagnosticVirtualTextWarn = { fg = 'Orange', italic = true },
	DiagnosticVirtualTextHint = { fg = 'Fg5', italic = true },
	DiagnosticVirtualTextInfo = { fg = 'Fg5', italic = true },
	DiagnosticVirtualTextOk = { fg = 'Fg5', italic = true },
	DiagnosticUnderlineError = { sp = 'Red', undercurl = true },
	DiagnosticUnderlineWarn = { sp = 'Orange', undercurl = true },
	DiagnosticUnderlineHint = { sp = 'Fg5', underdashed = true },
	DiagnosticUnderlineInfo = { sp = 'Fg5', underdashed = true },
	DiagnosticError = 'Red',
	DiagnosticWarn = 'Orange',
	DiagnosticHint = 'Fg3',
	DiagnosticInfo = 'LightOlive',
	DiagnosticOk = 'LightOlive',
	DiagnosticUnnecessary = { sp = 'Fg5', underdotted = true },
	LspReferenceRead = { bg = 'Bg3', fg = 'LightCyan', { bold = true } },
	LspReferenceText = { bg = 'Bg3', fg = 'Yellow', { bold = true } },
	LspReferenceWrite = { bg = 'Bg3', fg = 'LightOrange', { bold = true } },
	LspInlayHint = { bg = 'Bg1b', fg = 'Bg5', {} },
	['@lsp'] = {},
	['@lsp.type.property'] = '@property',
	['@lsp.type.variable'] = 'Variable',
	['@lsp.type.parameter'] = '@parameter',
	['@lsp.type.namespace'] = '@namespace',
	['@lsp.type.macro'] = 'Macro',
	['@lsp.type.event'] = 'LightOrange',
	['@lsp.mod.readonly'] = 'Bg1b',
	['@lsp.mod.static'] = { italic = true },
	['@lsp.mod.global'] = { italic = true },
	['@lsp.typemod.function.defaultLibrary'] = '@function.builtin',
	['@lsp.typemod.variable.defaultLibrary'] = '@variable.builtin',
	['@lsp.typemod.variable.classScope'] = '@field',
	['@lsp.typemod.variable.globalScope'] = { fg = 'LightGreen', italic = true },
	['@lsp.typemod.variable.fileScope'] = { fg = 'LightGreen', italic = true },
	['@lsp.typemod.class.declaration'] = 'TypeDef',
	['@lsp.typemod.keyword.documentation'] = 'PreProc',
}
