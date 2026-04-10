-- Set tab size
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")


vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})


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

vim.o.cursorline = true
vim.o.list = true

vim.opt.scrolloff = 8
vim.opt.foldlevel = 15
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = '0'
vim.o.foldenable = true
vim.opt.foldtext = ''
vim.opt.smartindent = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
