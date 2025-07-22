return {
  {
    "stevearc/conform.nvim",
    optional = false,
    opts = {
      formatters_by_ft = {
        php = { { "php-cs-fixer", "pint" } },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        blade = { "prettier" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },
}
