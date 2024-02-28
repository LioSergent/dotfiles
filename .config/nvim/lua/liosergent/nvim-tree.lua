local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

local function my_on_attach(bufnr)
    vim.keymap.set("n", "h", api.tree.close_node)
    vim.keymap.set("n", "l", api.tree.open_node)
    vim.keymap.set("n", "?", api.tree.toggle_help)
end

nvim_tree.setup {
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
    view = { adaptive_size = true, side="right" },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
}
