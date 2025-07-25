return {
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  {
    "adibhanna/laravel.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    ft = "php",
    config = function()
      require("laravel").setup({
        route_info = {
          enabled = true,
        },
        commands = {
          enabled = true,
        },
        telescope = {
          enabled = true,
        },
      })
    end,
  },

  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
