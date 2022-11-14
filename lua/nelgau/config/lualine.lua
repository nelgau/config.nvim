local M = {}

function M.setup()
  require('lualine').setup({
    options = {
      theme = "gruvbox-baby",
      icons_enabled = false,
    }
  })
end

return M
