return 	{
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			source_selector = {
				winbar = true,
				statusline = false,
			},
			window = {
				mappings = {
					['e'] = function()
						vim.api.nvim_exec('Neotree focus filesystem left', true)
					end,
					['b'] = function()
						vim.api.nvim_exec('Neotree focus buffers left', true)
					end,
					['g'] = function()
						vim.api.nvim_exec('Neotree focus git_status left', true)
					end,
				},
			},
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						vim.cmd("Neotree close")
					end
				},
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.cmd("setlocal relativenumber")
					end,
				},
			},
			filesystem = {
				filtered_items = {
					visible = true
				},
			},
		})
	end
}



