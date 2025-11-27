local h2c = require("functions.hextochroma")
local hl_group = require("functions.highlight_group")


local function load_colorscheme(mode)
	package.loaded["mini.base16"] = nil
	package.loaded["assets.matugen_colors"] = nil
	collectgarbage("collect")

	if(mode == nil) then
		mode = "max"
	end

	local fpalette = require("assets.matugen_colors")
	local p = nil


	if(mode == "min") then
		p = require("mini.base16").mini_palette(
			fpalette.surface,
			fpalette.on_surface,
			h2c(fpalette.primary)
		)

	end

	if(mode == "max") then
		p = {
			base00 = fpalette.background,
			base01 = fpalette.surface_container_lowest,
			base02 = fpalette.surface_container_low,
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
			base0F = fpalette.error_container,
		}
	end

	require("mini.base16").setup({
		palette = p,
		plugins = { default = true }
	})


	-- Make background equal to kitty's:
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- Make Number column transparent as well
	vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })

	-- Make Selected text more visible
	vim.api.nvim_set_hl(0, 'Visual',
		{ bg = fpalette.primary_container,
		fg = fpalette.background }
	)


	vim.api.nvim_set_hl(0, 'Keyword',
		{ fg = fpalette.primary }
	)

	vim.api.nvim_set_hl(0, 'MesgArea',
		{ bg = fpalette.surface_container_lowest,
		  fg = fpalette.primary }
	)


	hl_group(
		{ 'TSComment', 'Comment' },
		{ fg = fpalette.on_tertiary_container }
	)

	hl_group(
		{ 'TSMethod', 'Method' },
		{ fg = fpalette.tertiary }
	)

	hl_group(
		{ 'TSFunction', 'Function' },
		{ fg = fpalette.secondary }
	)

end

return load_colorscheme
