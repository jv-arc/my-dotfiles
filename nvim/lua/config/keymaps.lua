

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


local KM = {}


vim.keymap.set('n', '<leader>fp', ':NeovimProjectDiscover default<CR><Esc>')
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal toggle left<CR>')


KM.zellij = function()
	vim.keymap.set('n', "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>",  { silent = true, desc = "navigate left or tab"  })
	vim.keymap.set('n', "<c-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  })
	vim.keymap.set('n', "<c-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    })
	vim.keymap.set('n', "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" })
end






--     ╭──────────────────╮
--     │ Snacks' Terminal │
--     ╰──────────────────╯
--
KM.snacks_terminal = {}
local st = KM.snacks_terminal

-- To get out of the terminal easiear
st.easy_get_out = function()
	vim.keymap.set('t', '<Esc><Esc>', [[<C-\>,C-n>]])
end

	-- To toggle terminal status
st.toggle = function()
	vim.keymap.set('n', '<leader>t', function()
		Snacks.terminal.toggle( "fish", { win = {
			style = "terminal" ,
			position = "bottom",
			height = 0.2, },
			cwd = vim.fn.getcwd(),
			interactive = false, })
		end)
end

st.set = function()
	st.easy_get_out()
	st.toggle()
end



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

KM.comment_box = {}
local cb = KM.comment_box

-- Main box keymaps
cb.main_box = function ()
	vim.keymap.set({'n', 'v'}, '<leader>cb1', '<Cmd>CBlabox7<CR>',
		{noremap = true, silent=true}, {desc = 'Double line box'}
	)
	vim.keymap.set({'n', 'v'}, '<leader>cb2', '<Cmd>CBlabox1<CR>',
		{noremap = true, silent=true}, {desc = 'Simple round box'}
	)
	vim.keymap.set({'n', 'v'}, '<leader>cb3', '<Cmd>CBlabox18<CR>',
		{noremap = true, silent=true}, {desc = 'Box with side brackets'}
	)
end

-- Main line keymaps
cb.main_line = function ()
	vim.keymap.set({'n', 'v'}, '<leader>cl1', '<Cmd>CBllline1<CR>',
		{noremap = true, silent=true}, {desc = 'simple line'}
	)
	vim.keymap.set({'n', 'v'}, '<leader>cl2', '<Cmd>CBllline2<CR>',
		{noremap = true, silent=true}, {desc = 'curved line beginning'}
	)
	vim.keymap.set({'n', 'v'}, '<leader>cl3', '<Cmd>CBlrline3<CR>',
		{noremap = true, silent=true}, {desc = ' curved line end'}
	)
end

-- Auxilliar keymaps
cb.auxiliar =  function ()
	vim.keymap.set({'n','v'}, '<leader>cy', '<Cmd>CBy<CR>', {noremap = true, silent=true}, {desc = 'copy text inside box/line'})
	vim.keymap.set({'n','v'}, '<leader>cd', '<Cmd>CBd<CR>', {noremap = true, silent=true}, {desc = 'delete box'})
end

-- Max box size setup
cb.max_box = function ()
require("comment-box").setup({
	box_width = 100,
	document_width = 100,
})
end

cb.set = function()
	cb.main_box()
	cb.main_line()
	cb.auxiliar()
	cb.max_box()
end



return KM
