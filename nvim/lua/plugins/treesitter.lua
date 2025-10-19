return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = 
				{
					"c",
					"lua",
					"make",
					"css",
					"bash",
					"asm",
					"cpp",
					"dockerfile",
					"git_rebase",
					"gitcommit",
					"gitignore",
					"git_config",
					"html",
					"http",
					"hyprlang",
					"javascript",
					"java",
					"json",
					"nasm",
					"python",
					"sql",
					"tcl",
					"toml",
					"yaml",
					"verilog"
				},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
