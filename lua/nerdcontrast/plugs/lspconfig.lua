local gid = vim.api.nvim_create_augroup("LspTokenHighlight", {clear = true})
vim.api.nvim_create_autocmd('LspTokenUpdate', {
	group = gid,
	callback = function(args)
		local token = args.data.token
		if token.modifiers.readonly and token.type == 'variable' and
				(token.modifiers.static or token.modifiers.fileScope) then
			vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, 'Constant')
		elseif token.modifiers.globalScope and token.modifiers.defaultLibrary and token.type == 'variable' then
			vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, '@namespace')
		end
	end,
})
return {
	DiagnosticVirtualTextError = {fg = "Red", italic = true, bold = true},
	DiagnosticVirtualTextWarn = {fg = "Orange", italic = true},
	DiagnosticVirtualTextHint = {fg = "LightGrey", italic = true},
	DiagnosticVirtualTextInfo = {fg = "LightGrey", italic = true},
	DiagnosticVirtualTextOk = {fg = "LightGrey", italic = true},
	DiagnosticUnderlineError = {sp = "Red", undercurl = true},
	DiagnosticUnderlineWarn = {sp = "Orange", undercurl = true},
	DiagnosticUnderlineHint = {sp = "LightGrey", underline = true},
	DiagnosticUnderlineInfo = {sp = "LightGrey", undercurl = true},
	DiagnosticError = "Red",
	DiagnosticWarn = "Orange",
	DiagnosticHint = "Fg3",
	DiagnosticInfo = "LightOlive",
	LspReferenceRead = {{bg = "Bg2", fg = "LightCyan"}, {bold = true}},
	LspReferenceText = {{bg = "Bg2", fg = "Yellow"}, {bold = true}},
	LspReferenceWrite = {{bg = "Bg2", fg = "LightOrange"}, {bold = true}},
	DiagnosticUnnecessary = {{sp = "Fg4"}, {underdotted = true}},
	["@lsp"] = "",
	["@lsp.type.property"] = "@property",
	["@lsp.type.variable"] = "Variable",
	["@lsp.type.parameter"] = "@parameter",
	["@lsp.type.namespace"] = "@namespace",
	["@lsp.type.macro"] = "Macro",
	["@lsp.mod.readonly"] = "Bg1",
	["@lsp.mod.static"] = {italic = true},
	["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
	["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
	["@lsp.typemod.variable.classScope"] = "@field",
	["@lsp.typemod.variable.globalScope"] = {fg = "LightGreen", italic = true},
	["@lsp.typemod.variable.fileScope"] = {fg = "LightGreen", italic = true},
	["@lsp.typemod.class.declaration"] = "TypeDef",
}
