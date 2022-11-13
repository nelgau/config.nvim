local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })

  require("treesitter-context").setup({
    enable = true,
    patterns = {},
  })
end

return M
