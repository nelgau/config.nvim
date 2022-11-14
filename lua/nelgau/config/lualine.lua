local M = {}

function M.setup()
  require('lualine').setup({
    options = {
      theme = "gruvbox-baby",
      icons_enabled = false,
    },
    sections = {
      lualine_a = {"mode"},
      -- 'diff' was removed because of lualine issue #699
      -- https://github.com/nvim-lualine/lualine.nvim/issues/699
      lualine_b = {"branch", "diagnostics"},
      lualine_c = {"filename", "lsp-progress"},
      lualine_x = {"encoding", "fileformat", "filetype"},
      lualine_y = {"progress"},
      lualine_z = {"location"},
    },
  })
end

return M
