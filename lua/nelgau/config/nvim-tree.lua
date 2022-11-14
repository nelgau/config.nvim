local M = {}

function M.setup()
  require("nvim-tree").setup({
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = true,
          git = true,
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = {
        ".DS_Store",
      },
    },
    git = {
      ignore = false,
    },
  })
end

return M
