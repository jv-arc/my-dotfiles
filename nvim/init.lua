-- global so it can be run remotely
Reload_matugen_colors = require("functions.load_matugen_colors")


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




vim.filetype.add({
  extension = {
    vh = "verilog",      -- or 'systemverilog' if you prefer everything as sv
    svh = "systemverilog"
  }
})

local function align_upperline()
  local original_pos = vim.api.nvim_win_get_cursor(0)
	print(original_pos[1], original_pos[2])
	local final_pos = original_pos	
  vim.cmd('normal! $')  -- Go up to previous line
  vim.cmd('normal! k')  -- Go up to previous line
  vim.cmd('normal! e')  -- Go to start, then end of first word (e.g., after "test1")
  vim.cmd('normal! w')
  final_pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd('normal! j')  -- Back to original line
  vim.api.nvim_win_set_cursor(0, {original_pos[1], original_pos[2]})
  local spaces_needed = math.abs(final_pos[2] - original_pos[2]) + 2
  if spaces_needed > 0 then
		vim.api.nvim_buf_set_text(0, original_pos[1] - 1, original_pos[2] + 1, original_pos[1] - 1, original_pos[2] + 1, {string.rep(' ', spaces_needed)})
  	vim.cmd('normal! $')  -- Go up to previous line
  end
end



vim.keymap.set('n', '<leader>al', align_upperline, { desc = 'Align to column above' })
