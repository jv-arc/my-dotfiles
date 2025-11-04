-- global so it can be run remotely
reload_matugen_colors = require("functions.load_matugen_colors")


-- Load lazy.vim
require("config.lazy")
require('config.general')
require('config.keymaps')

-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--   callback = function()
-- 		vim.opt.number = true
--     vim.opt.relativenumber = false
-- 		print("a")
--   end
-- })
--
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   callback = function()
-- 		vim.opt.number = true
-- 		vim.opt.relativenumber = true
-- 		print("b")
--   end
-- })
--



-- Start nevovim on a specific Unix Socket
local get_next_socket = require("functions.get_sockets")
local runtime_dir = "/tmp"
local socket_path = get_next_socket(runtime_dir, "nvim")
vim.fn.serverstart(socket_path)





