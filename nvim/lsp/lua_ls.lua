return {
	cmd = { "lua-language-server" },
	filetypes = {"lua"},
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.jsonc",
		".luarc.json",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene,yml",
	},

	single_file_support = true,
}
