local server_names = {
	"lua_ls",
	"clangd",
	"bashls",
	"docker_compose_language_service",
	"fish_lsp",
	"superhtml",
	"cssls",
	"ts_ls"
}


return {
	"williamboman/mason-lspconfig.nvim",
	opts = { ensure_installed = server_names },
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				vim.lsp.enable(server_names)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
				vim.keymap.set('n', '<leader>K', vim.lsp.buf.code_action , {})
			end
		},
	}
}
