return {
	'2KAbhishek/exercism.nvim',
	cmd = { 'Exercism' },
	keys = { '<leader>exa', '<leader>exl', '<leader>exr'},
	dependencies = {
		'2KAbhishek/utils.nvim',
		'2KAbhishek/termim.nvim',
	},
	opts = {
		exercism_workspace = '~/exercism',
		add_default_keybindings = true,
		icons = {
			concept = '',
			practice = '',
		}
	}
}
