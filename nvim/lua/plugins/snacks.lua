return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		---@class snacks.dashboard.Config
		dashboard = {
			preset = {
				pick = nil,
				header = require("assets.wired_faded")
			},
		---@type snacks.image.Config
		image = {
			formats = {
				"png",
				"jpg",
				"jpeg",
				"gif",
				"bmp",
				"webp",
				"tiff",
				"heic",
				"avif",
				"mp4",
				"mov",
				"avi",
				"mkv",
				"webm",
				"pdf",
				"icns",
				},
			doc = {
				enabled = true
				},
			},
		},
		explorer = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
		{ "nvim-tree/nvim-web-devicons", opts = {} }
	}
}
