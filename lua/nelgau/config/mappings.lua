local M = {}

function M.setup()
  local mapx = require("mapx")

  mapx.nnoremap("<C-f>", ":NERDTreeFocus<CR>")
  mapx.nnoremap("<C-n>", ":NERDTree<CR>")
  mapx.nnoremap("<C-t>", ":NERDTreeToggle<CR>")
end

return M
