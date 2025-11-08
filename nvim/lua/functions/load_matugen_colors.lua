
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
		})
	elseif mode == "palette" then
		require("mini.base16").setup({
			palette = fpalette,
		})
	end

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return load_colorscheme
