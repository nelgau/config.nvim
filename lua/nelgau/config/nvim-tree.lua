local M = {}

function M.setup()
  require("nvim-tree").setup({
    filters = {
      dotfiles = false,
    },
    git = {
      ignore = false,
    },
  })
end

return M
