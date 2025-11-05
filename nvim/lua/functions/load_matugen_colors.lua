
local h2c = require("functions.hextochroma")

local function load_colorscheme()
	package.loaded["mini.base16"] = nil
	package.loaded["assets.matugen_colors"] = nil
	collectgarbage("collect")

	local mode = "mini_palette"
	local palette = require("assets.matugen_colors")

	if mode == "mini_palette" then
		require("mini.base16").setup({
			palette = require("mini.base16").mini_palette(palette.surface, palette.on_surface, h2c(palette.primary)),
		})
	elseif mode == "palette" then
		require("mini.base16").setup({
			palette = require("assets.matugen_colors"),
		})
	end
end

return load_colorscheme
