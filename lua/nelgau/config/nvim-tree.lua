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
    },
    git = {
      ignore = false,
    },
  })
end

return M
