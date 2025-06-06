local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- Daftar server atau LSP 
local servers = {"html", "cssls", "intelephense", "lua_ls", "ts_ls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require('lspconfig').intelephense.setup {
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          "vendor/phpunit/phpunit/",
          "vendor/laravel/framework/src/",
        }
      }
    }
  }
}

lspconfig.tailwindcss.setup {}
lspconfig.ts_ls.setup {}
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.emmet_ls.setup {
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "blade" },
}
