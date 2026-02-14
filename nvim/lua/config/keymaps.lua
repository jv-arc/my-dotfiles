

--       ╔══════════════════════════════════════════════════════════════╗
--       ║                                                              ║
--       ║ ██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ███████╗ ║
--       ║ ██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗██╔════╝ ║
--       ║ █████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝███████╗ ║
--       ║ ██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║ ║
--       ║ ██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     ███████║ ║
--       ║ ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝ ║
--       ║                                                              ║
--       ╚══════════════════════════════════════════════════════════════╝


--       ╭────────────────────╮
--       │ General Navigation │
--       ╰────────────────────╯
--
-- These were stolen from the primeagen
-- vim.keymap.set('v', 'j', ":m '>+1<cr>gv=g")
-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=g")
-- vim.keymap.set('n', 'J', "mzJ`z")
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- vim.keymap.set('n', 'n', 'nzzzv')
-- vim.keymap.set('n', 'N', 'Nzzzv')

-- Adds lines without getting out of normal mode
vim.keymap.set('n', 'zj', 'o<Esc>k')
vim.keymap.set('n', 'zk', 'O<Esc>j')

-- other
vim.keymap.set('n', '<leader>fp', ':NeovimProjectDiscover default<CR><Esc>')
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal toggle left<CR>')







--     ╭──────────────────╮
--     │ Snacks' Terminal │
--     ╰──────────────────╯
--
-- To get out of the terminal easiear
vim.keymap.set('t', '<Esc><Esc>', [[<C-\>,C-n>]])

-- To toggle terminal status
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



--        ╭─────────────╮
--        │ GIT-Related │
--        ╰─────────────╯

-- TODO: Find out the best way of using git on Nvim
-- vim.keymap.set('n',   "<leader>gB", function() Snacks.gitbrowse() end  )  
-- vim.keymap.set('n',   "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches"})
-- vim.keymap.set('n',   "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log"}) 
-- vim.keymap.set('n',   "<leader>gs", function() Snacks.picker.git_status() end, {desc = "Git Status" }) 
-- vim.keymap.set('n',   "<leader>gd", function() Snacks.picker.git_diff() end, {desc = "Git Diff (Hunks)"}) 
-- vim.keymap.set('n',   "<leader>gf", function() Snacks.picker.git_log_file() end, {desc = "Git Log File"})





--        ╭─────────────╮
--        │ Comment-Box │
--        ╰─────────────╯

local cb_opts = {noremap = true, silent = true }

-- Main box keymaps
vim.keymap.set({'n', 'v'}, '<leader>cb1', '<Cmd>CBlabox7<CR>', cb_opts, {desc = 'Double line box'})
vim.keymap.set({'n', 'v'}, '<leader>cb2', '<Cmd>CBlabox1<CR>', cb_opts, {desc = 'Simple round box'})
vim.keymap.set({'n', 'v'}, '<leader>cb3', '<Cmd>CBlabox18<CR>', cb_opts, {desc = 'Box with side brackets'})

-- Main line keymaps
vim.keymap.set({'n', 'v'}, '<leader>cl1', '<Cmd>CBllline1<CR>', cb_opts, {desc = 'simple line'})
vim.keymap.set({'n', 'v'}, '<leader>cl2', '<Cmd>CBllline2<CR>', cb_opts, {desc = 'curved line beginning'})
vim.keymap.set({'n', 'v'}, '<leader>cl3', '<Cmd>CBlrline3<CR>', cb_opts, {desc = ' curved line end'})

-- Auxilliar keymaps
vim.keymap.set({'n','v'}, '<leader>cy', '<Cmd>CBy<CR>', cb_opts, {desc = 'copy text inside box/line'})
vim.keymap.set({'n','v'}, '<leader>cd', '<Cmd>CBd<CR>', cb_opts, {desc = 'delete box'})

-- Max box size setup
require("comment-box").setup({
	box_width = 100,
	document_width = 100,
})

