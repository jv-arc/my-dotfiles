
return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- Detection methods: { "lsp", "pattern" }
      detection_methods = { "pattern" },
      patterns = { ".git", "Makefile", "package.json" },
    }
  end,
}


