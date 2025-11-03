-- Key Mappings
local builtin = require("telescope.builtin")
vim.keymap.set('t', '<Esc><Esc>', [[<C-\>,C-n>]])
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal toggle left<CR>')

vim.keymap.set('n', 'zj', 'o<Esc>k')
vim.keymap.set('n', 'zk', 'O<Esc>j')
vim.keymap.set('n', '<leader>fp', ':NeovimProjectDiscover default<CR><Esc>')
vim.keymap.set('n', '<leader>t',
	function() Snacks.terminal.toggle(
		"fish",
		{
			win = {
				style = "terminal" ,
				position = "bottom",
				height = 0.2,
			},
			cwd = vim.fn.getcwd(),
			interactive = true,
		}
	)
	end
)




-- vim.keymap.set('n', '<leader>fp', '<cmd>Telescope projects<cr>')
-- Git Browse (open file/commit/branch in browser)
-- vim.keymap.set('n',   "<leader>gB", function() Snacks.gitbrowse() end  )  
-- Git Pickers
-- vim.keymap.set('n',   "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches"})
-- vim.keymap.set('n',   "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log"}) 
-- vim.keymap.set('n',   "<leader>gs", function() Snacks.picker.git_status() end, {desc = "Git Status" }) 
-- vim.keymap.set('n',   "<leader>gd", function() Snacks.picker.git_diff() end, {desc = "Git Diff (Hunks)"}) 
-- vim.keymap.set('n',   "<leader>gf", function() Snacks.picker.git_log_file() end, {desc = "Git Log File"})

