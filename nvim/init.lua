reload_colorscheme = require("functions.reload_colorscheme")

-- Load lazy.vim
require("config.lazy")
-- colorscheme
require('functions.reload_colorscheme')
require('config.general')
require('config.keymaps')


vim.onumber = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.list = true

local runtime_dir = os.getenv('XDG_RUNTIME_DIR')
vim.fn.serverstart(runtime_dir .. '/nvim.sock')
