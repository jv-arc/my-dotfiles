local load_config = require("functions.load_matugen_colors")

return {
	"echasnovski/mini.base16",
	config = function()
		load_config()
	end
}
