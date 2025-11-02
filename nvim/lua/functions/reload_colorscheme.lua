
local h2c = require("functions.hextochroma")

local function reload_colorscheme()
	if mini ~= nil then
		if mini.base16 ~= nil then
			package.loaded["mini.base16"] = nil
		end
	end
	if assets ~= nil then
		if assets.matugen_all ~= nil then
			package.loaded["assets.matugen_all"] = nil
		end
	end
	collectgarbage("collect")

	local mode = "mini_palette"
	local palette = require("assets.matugen_all")

	if mode == "mini_palette" then
		require("mini.base16").setup({
			palette = require("mini.base16").mini_palette(palette.background, palette.primary_fixed, h2c(palette.primary)),
		})
	elseif mode == "palette" then
		require("mini.base16").setup({
			palette = require("assets.matugen_all"),
		})
	end
end

return reload_colorscheme
