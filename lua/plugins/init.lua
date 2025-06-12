return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "jwalton512/vim-blade",
    ft = "blade"
  },

  {
    "rafamadriz/friendly-snippets",
    config = function ()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    "laytan/tailwind-sorter.nvim",
    build = "cd formatter && npm i",
    depedencies = {"nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim"},
    config = true,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      }
    }
  },

  {
    "shellRaining/hlchunk.nvim",
    event = {"UIEnter"},
    config = function ()
      require("hlchunk").setup({
        indent = {
          enable = true,
          chars = {"│"},
          style = {
            {fg = "#3e4452"},
          },
        },
        blank = {
          enable = false,
        },
        line_num = {
          enable = false,
        }, 
        chunk = {
          enable = true,
          notify = true,
<<<<<<< HEAD
          support_filetypes = {"*.js","*.ts","*.php",",lua", "html", "css", "javascript", "php", "blade"},
=======
          support_filetypes = {"*.js","*.ts","*.php","*.lua"},
>>>>>>> e940720 (NEW UPDATES: REFACTOR THE CODE)
          use_treesitter = true,
          style = {
            {fg = "#98c379"}
          }
        }
      })
    end
  },

  {
    "brianhuster/autosave.nvim",
    event = {"InsertEnter", "TextChanged"},
    config = function ()
      require("autosave").setup({
        enable = true,
        execution_message = function ()
          return "Auto saved at " .. os.date("%H:%M:%S")
        end,
        debounce_delay = 135,
        conditions = {
          exists = true,
          modifiable = true,
          filename_is_not = {},
          filetype_is_not = {},
        },
      })
    end,
  }

}
