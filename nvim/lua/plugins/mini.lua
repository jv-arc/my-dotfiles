local load_config = require("functions.reload_colorscheme")

return {
	"echasnovski/mini.base16",
	config = function()
		load_config()
	end
}
