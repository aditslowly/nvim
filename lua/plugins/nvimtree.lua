return {
  "nvim-tree/nvim-tree.lua",
  event = "VimEnter",
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
      },
      renderer = {
        root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ":t")
        end,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function map(key, func, desc)
          vim.keymap.set("n", key, func, { buffer = bufnr, desc = desc })
        end

        local function safe_open()
          local node = api.tree.get_node_under_cursor()
          if node and node.absolute_path == vim.fn.getcwd() then
            vim.notify("Root folder cannot opened", vim.log.levels.INFO)
          else
            api.node.open.edit()
          end
        end

        -- Custom Keymaps for NvimTree
        map("<CR>", safe_open, "Safe open file and folders")
        map("l", safe_open, "Safe open folder with l")

        -- Another mappings keymap
        map("h", api.node.navigate.parent_close, "Go to parent")
        map("r", api.fs.rename, "Rename")
        map("d", api.fs.remove, "Delete")
        map("a", api.fs.create, "Create file/folder")
        map("x", api.fs.cut, "Cut")
        map("c", api.fs.copy.node, "Copy")
        map("p", api.fs.paste, "Paste")
        map("R", api.tree.reload, "Refresh")
        map("?", api.tree.toggle_help, "Toggle help")
      end,
    })
  end,
}
