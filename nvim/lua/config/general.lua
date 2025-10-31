-- Set tab size
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")

-- Asking to confirm
vim.o.confirm = true

-- Highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight yanking',
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Leader key
vim.g.mapleader = ' '

-- vim.cmd.colorscheme = nil
vim.cmd("set t_Co=256")

-- Line numbers and highlight
vim.opt.foldlevel = 15
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = '0'
vim.o.foldenable = true
vim.opt.foldtext = ''


-- Sync clipboards
vim.api.nvim_create_autocmd('UIEnter', {
	callback = function()
		vim.o.clipboard = 'unnamedplus'
	end,
})


