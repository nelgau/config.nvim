local M = {}

function M.setup()
  require("nvim-treesitter.install").prefer_git = false

  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "lua",
      "python",
      "ruby",
      "rust",
      "vim",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end

return M
