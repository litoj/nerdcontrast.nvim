vim.filetype.add {
	pattern = {[".*rc"] = "config", [".*config"] = "config"},
	extension = {
		conf = function(path, _) if not path:match("fontconfig") then return "config" end end,
		cfg = "config",
	},
}
