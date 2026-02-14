return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed =
				{
					"c",
					"cpp",
					"lua",
					"make",
					"css",
					"bash",
					"asm",
					"dockerfile",
					"git_rebase",
					"gitcommit",
					"gitignore",
					"git_config",
					"html",
					"http",
					"hyprlang",
					"python",
					"javascript",
					"typescript",
					"java",
					"json",
					"nasm",
					"java",
					"sql",
					"tcl",
					"toml",
					"yaml",
					"verilog",
					"vhdl"
				},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
