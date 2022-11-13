local M = {}

local constants = require("nelgau.constants")

function M.setup()
  vim.g.nord_contrast = false
  vim.g.nord_borders = true

  if constants.colorscheme == "nord" then
    vim.cmd("colorscheme nord")
  end
end

return M
