reload_matugen_colors = require("functions.load_matugen_colors")

-- Load lazy.vim
require("config.lazy")
require('config.general')
require('config.keymaps')

vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
		vim.opt.number = true
    vim.opt.relativenumber = false
		print("a")
  end
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
		vim.opt.number = true
		vim.opt.relativenumber = true
		print("b")
  end
})


local runtime_dir = os.getenv('XDG_RUNTIME_DIR')
vim.fn.serverstart(runtime_dir .. '/nvim.sock')
