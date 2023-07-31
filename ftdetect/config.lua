vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	group = "filetypedetect",
	pattern = {"*.rc","*config", "*.conf"},
	callback = function(state)
		local ft = vim.api.nvim_buf_get_option(state.buf, "filetype")
		if ft == "" or ft:match("^conf") or ft:match("^cfg") then
			vim.api.nvim_buf_set_option(state.buf, "filetype", "config")
		end
	end,
})
