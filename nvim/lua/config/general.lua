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


-- Mason DAP
local dap, dapui = require("dap"), require("dapui")



dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
		env = {
			DOTNET_ROOT = "/mnt/ssd2/file_storage/programas_grandes/dotnet",
			PATH = "/mnt/ssd2/file_storage/programas_grandes/dotnet:" .. vim.env.PATH
		},
  },
}
dapui.setup()



dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
