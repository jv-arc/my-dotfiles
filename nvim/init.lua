-- Load lazy.vim
require("config.lazy")
-- colorscheme
vim.cmd.colorscheme "vague"

require('config.general')
require('config.keymaps')


vim.onumber = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.list = true


