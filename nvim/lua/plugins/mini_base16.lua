local load_config = require("functions.load_matugen_colors")

return {
	"nvim-mini/mini.base16",
	version = "*",
	config = function()
		load_config()
	end
}
