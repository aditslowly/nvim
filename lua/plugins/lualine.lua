return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function time()
      return "󱑆 " .. os.date("%H:%M:%S")
    end

    local function get_branch()
      local branch = vim.b.gitsigns_head or ""
      if branch ~= "" then
        return " " .. branch
      end
      return " " .. "main"
    end

    local function get_lsp()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      local names = {}
      for _, client in pairs(clients) do
        if client.name ~= "" and client.name ~= "null-ls" then
          table.insert(names, client.name)
        end
      end
      return #names > 0 and " LSP " .. table.concat(names, ", ") or ""
    end

    local function short_filename()
      local filename = vim.fn.expand("%:t")
      local filetype = vim.bo.filetype

      local icons = {
        lua = "󰢱",
        python = "",
        javascript = "",
        typescript = "",
        html = "",
        css = "",
        markdown = "",
        json = "",
        sh = "",
        blade = "",
        php = "",
        default = "", -- gunakan ikon ini jika tidak ditemukan
      }

      local icon = icons[filetype] or icons["default"]
      return string.format("%s %s", icon, filename)
    end

    local mode_color = {
      n = { name = "󰘳 NORMAL", color = "#5DE4C7" },
      i = { name = "󰘳 INSERT", color = "#5DE4C7" },
      v = { name = "󰘳 VISUAL", color = "#5DE4C7" },
      V = { name = "󰘳 V-LINE", color = "#5DE4C7" },
      [""] = { name = "󰘳 V-BLOCK", color = "#5DE4C7" },
      c = { name = "󰘳 COMMAND", color = "#5DE4C7" },
      R = { name = "󰘳 REPLACE", color = "#5DE4C7" },
    }

    local function mode_display()
      local m = vim.api.nvim_get_mode().mode
      local data = mode_color[m]
      return data and data.name or m
    end

    local colors = {
      bg = "#1a1b26",
      fg = "#c0caf5",
      black = "#1a1b26",
      teal = "#5DE4C7",
    }

    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = "│",
        section_separators = "",
      },
      sections = {
        lualine_a = {
          {
            mode_display,
            color = function()
              local m = vim.api.nvim_get_mode().mode
              local c = mode_color[m]
              return { fg = colors.black, bg = c and c.color or colors.fg, gui = "bold" }
            end,
          },
        },
        lualine_b = {
          { get_branch, color = { fg = colors.teal, bg = colors.bg } },
          { short_filename, color = { fg = colors.bg, bg = colors.teal } },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            get_lsp,
            color = { fg = colors.teal, bg = colors.black },
            separator = " ",
          },
          {
            time,
            color = { fg = colors.bg, bg = colors.teal },
            separator = " ",
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
