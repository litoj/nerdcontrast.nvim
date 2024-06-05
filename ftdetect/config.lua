vim.g.nerdcontrast_ft_config = (vim.g.nerdcontrast_ft_config or { 'swayconfig', 'i3config' })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	group = 'filetypedetect',
	pattern = { '*config/*rc', '*config', '*.conf' },
	callback = function(state)
		local ft = vim.bo[state.buf].ft
		if ft == '' or ft:match '^conf' or ft:match '^cfg' or ft:match 'config$' then
			for _, x in ipairs(vim.g.nerdcontrast_ft_config) do
				if ft == x then return end
			end
			vim.bo[state.buf].ft = 'config'
		end
	end,
})
