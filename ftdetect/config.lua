vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"},
		{pattern = {"*config", "*.conf"}, command = "setlocal ft=config"})
