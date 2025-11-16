vim.keymap.set('t', '<Esc><Esc>', [[<C-\>,C-n>]])
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal toggle left<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=g")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=g")

vim.keymap.set('n', 'J', "mzJ`z")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'zj', 'o<Esc>k')
vim.keymap.set('n', 'zk', 'O<Esc>j')

vim.keymap.set('n', '<leader>fp', ':NeovimProjectDiscover default<CR><Esc>')

vim.keymap.set('n', '<leader>t', function()
	Snacks.terminal.toggle(
		"fish",
		{
			win = {
				style = "terminal" ,
				position = "bottom",
				height = 0.2,
			},
			cwd = vim.fn.getcwd(),
			interactive = false,
		}
	)
	end
)



-- TODO: Find out the best way of doing this
-- vim.keymap.set('n', '<leader>fp', '<cmd>Telescope projects<cr>')
-- Git Browse (open file/commit/branch in browser)
-- vim.keymap.set('n',   "<leader>gB", function() Snacks.gitbrowse() end  )  
-- Git Pickers
-- vim.keymap.set('n',   "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches"})
-- vim.keymap.set('n',   "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log"}) 
-- vim.keymap.set('n',   "<leader>gs", function() Snacks.picker.git_status() end, {desc = "Git Status" }) 
-- vim.keymap.set('n',   "<leader>gd", function() Snacks.picker.git_diff() end, {desc = "Git Diff (Hunks)"}) 
-- vim.keymap.set('n',   "<leader>gf", function() Snacks.picker.git_log_file() end, {desc = "Git Log File"})



-- TODO: Find out how to insert txt on lines
-- Comment Box keybindings
local cb_opts = {noremap = true, silent = true }
vim.keymap.set({'n', 'v'}, '<leader>cb', '<Cmd>CBccbox<CR>', cb_opts)
vim.keymap.set({'n', 'v'}, '<leader>ct', '<Cmd>CBllline<CR>', cb_opts)
vim.keymap.set('n', '<leader>cl', '<Cmd>CBline<CR>', cb_opts)
vim.keymap.set({'n','v'}, '<leader>cy', '<Cmd>CBy<CR>', cb_opts)
vim.keymap.set({'n','v'}, '<leader>cd', '<Cmd>CBd<CR>', cb_opts)
vim.keymap.set('n', ']b', '/\\S\\zs\\s*╭<CR>zt')
vim.keymap.set('n', '[b', '?\\S\\zs\\s*╭<CR>zt')
