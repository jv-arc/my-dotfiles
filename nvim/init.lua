-- global so it can be run remotely
reload_matugen_colors = require("functions.load_matugen_colors")


-- Load lazy.vim
require("config.lazy")
require('config.general')
require('config.keymaps')

vim.opt.number = true
vim.opt.relativenumber = true


-- Start nevovim on a specific Unix Socket
local get_next_socket = require("functions.get_sockets")
local socket_path = get_next_socket("nvim")
vim.fn.serverstart(socket_path)





