return function(M)
	M.hi(require "nerdcontrast.groups_lazy")
	for _, ft in ipairs({"gitcommit", "help", "mcfunction"}) do
		local function load_hi() M.hi(require("nerdcontrast.ft." .. ft)) end
		if vim.bo.filetype == ft then
			load_hi()
		else
			vim.api.nvim_create_autocmd("FileType", {once = true, pattern = ft, callback = load_hi})
		end
	end
	for _, mod in ipairs({
		"bufferline",
		"cmp",
		"dapui",
		"lazy",
		"lspconfig",
		"nvim-tree",
		"nvim-treesitter",
	}) do
		local function load_hi() M.hi(require("nerdcontrast.plugs." .. mod)) end
		if package.loaded[mod] then
			load_hi()
		else
			package.preload[mod] = function()
				package.preload[mod] = nil
				load_hi()
				for _, loader in pairs(package.loaders) do
					local ret = loader(mod)
					if type(ret) == "function" then return ret() end
				end
			end
		end
	end
end
