local M = {}

function M.setup()
  require("treesitter-context").setup({
    enable = true,
    patterns = {},
  })
end

return M
