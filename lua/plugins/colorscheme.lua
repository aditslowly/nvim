return {
  "Everblush/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("everblush").setup({
      override = {},
      transparent_background = false,
      nvim_tree = {
        contrast = false,
      },
    })

    vim.cmd.colorscheme("everblush")
  end,
}
