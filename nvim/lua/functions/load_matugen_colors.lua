local h2c = require("functions.hextochroma")

local function load_colorscheme(mode)
	package.loaded["mini.base16"] = nil
	package.loaded["assets.matugen_colors"] = nil
	collectgarbage("collect")

	if(mode == nil) then
		mode = "min"
	end

	local fpalette = require("assets.matugen_colors")

	if mode == "min" then
		require("mini.base16").setup({
			palette = require("mini.base16").mini_palette(
				fpalette.surface,
				fpalette.on_surface,
				h2c(fpalette.primary)
			),
			plugins = { default = true },
		})

	elseif mode == "max" then
		require("mini.base16").setup({
			base00 = fpalette.background,
			base01 = fpalette.surface_container_lowest,
			base02 = fpalette.surface_containert_low,
			base03 = fpalette.outline_variant,
			base04 = fpalette.on_surface_variant,
			base05 = fpalette.on_surface,
			base06 = fpalette.inverse_on_surface,
			base07 = fpalette.surface_bright,
			base08 = fpalette.error,
			base09 = fpalette.tertiary,
			base0A = fpalette.secondary,
			base0B = fpalette.primary,
			base0C = fpalette.tertiary_container,
			base0D = fpalette.primary_container,
			base0E = fpalette.secondary_container,
			base0F = fpalette.error_container
		})

	end

	-- Make background equal to kitty's:
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- Make Number column transparent as well
	vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })

	-- Make Highlights more visible
	vim.api.nvim_set_hl(0, 'Visual', {
		bg = fpalette.primary_container,
		fg = fpalette.background
	})

	-- Update lualine separetedely
	require('lualine').setup({
		options = { theme = 'base16' }
	})

end

return load_colorscheme
