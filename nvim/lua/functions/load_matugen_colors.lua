
local h2c = require("functions.hextochroma")

local function load_colorscheme()
	package.loaded["mini.base16"] = nil
	package.loaded["assets.matugen_colors"] = nil
	collectgarbage("collect")

	local mode = "mini_palette"
	local fpalette = require("assets.matugen_colors")

	if mode == "mini_palette" then
		require("mini.base16").setup({
			palette = require("mini.base16").mini_palette(fpalette.surface, fpalette.on_surface, h2c(fpalette.primary)),
			plugins = { default = true },
		})
	elseif mode == "palette" then
		require("mini.base16").setup({
			palette = fpalette,
			plugins = { default = true },
		})
	end
	vim.defer_fn(function()
		-- Make background equal to kitty's:
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		-- Make Number column transparent as well
		vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
	end, 20)
end

return load_colorscheme
