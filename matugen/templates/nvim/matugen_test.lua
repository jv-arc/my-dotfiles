return  {
	base00 = "{{colors.background.default.hex}}",
	base01 = "{{colors.surface_container_low.default.hex}}",
	base02 = "{{colors.surface_container_highest.default.hex}}",
	base03 = "{{colors.on_surface.default.hex | set_lightness: -25.0 }}", --comentarios
	base04 = "{{colors.primary.default.hex | set_hue: -27.12 }}",
	base05 = "{{colors.primary.default.hex | set_hue: +27.12 }}",
	base06 = "{{colors.on_surface.default.hex | set_lightness: -10.0}}", -- texto principal
	base07 = "{{colors.on_surface.default.hex}}",
	base08 = "{{colors.primary.default.hex}}",
	base09 = "{{colors.secondary.default.hex | set_hue: -27.12 }}",
	base0A = "{{colors.secondary.default.hex | set_hue: +27.12 }}",
	base0B = "{{colors.secondary.default.hex}}",
	base0C = "{{colors.tertiary.default.hex | set_hue: -27.12}}",
	base0D = "{{colors.tertiary.default.hex | set_hue: +27.12}}",
	base0E = "{{colors.on_surface.default.hex | set_lightness: +10.0}}",
	base0F = "{{colors.on_surface.default.hex}}",
}
