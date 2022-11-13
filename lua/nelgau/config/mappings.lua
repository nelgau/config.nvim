local M = {}

function M.setup()
  local mapx = require("mapx")

  mapx.nnoremap("<C-g>", ":NvimTreeToggle<CR>")
  mapx.nnoremap("<C-f>", ":NvimTreeFocus<CR>")
end

return M
