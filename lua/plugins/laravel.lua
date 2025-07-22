return {
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              files = {
                associations = { "*.php", "*.blade.php" },
              },
            },
          },
        },
      },
    },
  },

  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
