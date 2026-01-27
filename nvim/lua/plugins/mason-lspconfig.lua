local concatenate_list = require("functions.concatenate_lists")

local lsp_servers = {
	"angularls",
	"lua_ls",
	"omnisharp",
	"clangd",
	"bashls",
	"docker_compose_language_service",
	"fish_lsp",
	"superhtml",
	"cssls",
	"ts_ls"
}

local dap_servers = {
	"netcoredbg",
}

local all_servers = concatenate_list( {lsp_servers, dap_servers} )


return {
	"williamboman/mason-lspconfig.nvim",
	opts = { ensure_installed = lsp_servers },
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
				vim.lsp.enable(lsp_servers)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
				vim.keymap.set('n', '<leader>K', vim.lsp.buf.code_action , {})
			end
		},
	}
}
