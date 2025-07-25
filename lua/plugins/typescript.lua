return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ts_ls = {
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        settings = {
          ts_ls = {
            files = {
              associations = { "*.js", "*.jsx", "*.ts", "*.tsx" },
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
