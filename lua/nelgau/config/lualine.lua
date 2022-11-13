local M = {}

local constants = require("nelgau.constants")

function M.setup()
  require('lualine').setup({
    options = {
      theme = constants.colorscheme,
      icons_enabled = false,
    }
  })
end

return M
