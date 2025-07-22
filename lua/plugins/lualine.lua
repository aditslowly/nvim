return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function username()
      return " aditslowly"
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
      return #names > 0 and " " .. table.concat(names, ", ") or ""
    end

    local function short_filename()
      return vim.fn.expand("%:t")
    end

    local mode_color = {
      n = { name = "NORMAL", color = "#7aa2f7" },
      i = { name = "INSERT", color = "#9ece6a" },
      v = { name = "VISUAL", color = "#bb9af7" },
      V = { name = "V-LINE", color = "#bb9af7" },
      [""] = { name = "V-BLOCK", color = "#bb9af7" },
      c = { name = "COMMAND", color = "#e0af68" },
      R = { name = "REPLACE", color = "#f7768e" },
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
      red = "#f7768e",
      green = "#9ece6a",
      blue = "#7aa2f7",
      pink = "#ff79c6",
      yellow = "#e5c76b",
      magenta = "#c47fd5",
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
          { get_branch, color = { fg = colors.blue, bg = colors.bg } },
          { short_filename, color = { fg = colors.fg, bg = colors.bg } },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            get_lsp,
            color = { fg = colors.black, bg = colors.green },
            separator = " ",
          },
          {
            username,
            color = { fg = colors.black, bg = colors.magenta },
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
