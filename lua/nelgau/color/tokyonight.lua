local M = {}

local constants = require("nelgau.constants")

function M.setup()
  require("tokyonight").setup({
    style = "storm",
  })

  if constants.colorscheme == "tokyonight" then
    vim.cmd("colorscheme tokyonight")
  end
end

return M
