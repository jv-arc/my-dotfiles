-- Leader key
vim.g.mapleader = ' '

-- vim.cmd.colorscheme = nil
vim.cmd("set t_Co=256")

-- Set tab size
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")

-- Line numbers and highlight
vim.onumber = true
vim.o.number = true 
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.list = true

-- Sync clipboards
vim.api.nvim_create_autocmd('UIEnter', {
	callback = function()
		vim.o.clipboard = 'unnamedplus'
	end,
})

-- Highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight yanking',
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Asking to confirm
vim.o.confirm = true

vim.lsp.enable({
	"clangd",
	"lua_ls"
})
-- Load lazy.vim
require("config.lazy")


-- colorscheme
vim.cmd.colorscheme "vague"

-- Key Mappings
local builtin = require("telescope.builtin")
vim.keymap.set('t', '<Esc><Esc>', [[<C-\>,C-n>]])
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal toggle left<CR>')
require('lualine').setup()
vim.keymap.set('n', '<leader>t', 
	function() Snacks.terminal.toggle(
		"fish",
		{
			win = { 
				style = "terminal" ,
				position = "bottom",
				height = 0.4
			}, 
			cwd = vim.fn.getcwd(),
			interactive = true,
		}
	) 
	end
)

vim.opt.foldlevel = 15
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = '0'
vim.o.foldenable = true
vim.opt.foldtext = ''

-- Git Browse (open file/commit/branch in browser)
vim.keymap.set('n',   "<leader>gB", function() Snacks.gitbrowse() end  )
  
-- Git Pickers
vim.keymap.set('n',   "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches"})
vim.keymap.set('n',   "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log"}) 
vim.keymap.set('n',   "<leader>gs", function() Snacks.picker.git_status() end, {desc = "Git Status" }) 
vim.keymap.set('n',   "<leader>gd", function() Snacks.picker.git_diff() end, {desc = "Git Diff (Hunks)"}) 
vim.keymap.set('n',   "<leader>gf", function() Snacks.picker.git_log_file() end, {desc = "Git Log File"})

