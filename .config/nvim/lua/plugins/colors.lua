return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
  opts = {
    flavour = "mocha",
    integrations = {
      cmp = true,
      treesitter = true,
    },
  }
}
