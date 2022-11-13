local M = {}

local constants = require("nelgau.constants")

function M.setup()
  vim.opt.background = "dark"

  vim.g.gruvbox_italic = 1
  vim.g.gruvbox_contrast_dark = "medium"

  if constants.colorscheme == "gruvbox" then
    vim.cmd("colorscheme gruvbox")
  end
end

return M
