return {
  "coffebar/neovim-project",
  opts = {
		last_session_on_startup = false,
    projects = { -- define project roots
     "~/0/*",
    },
    picker = {
      type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
    },
		preview = {
			enabled = true,
			git_status = true,
			git_fetch = true,
			show_hidden = true,
		},
  },
  init = function()
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
