vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use("wbthomason/packer.nvim")

  --
  -- Colorschemes
  --

  use({
    "shaunsingh/nord.nvim",
    requires = "folke/lsp-colors.nvim",
    config = function()
      require("nelgau.color.nord").setup()
    end,
  })

  use({
    "gruvbox-community/gruvbox",
    requires = "folke/lsp-colors.nvim",
    config = function()
      require("nelgau.color.gruvbox").setup()
    end,
  })

  --
  -- Statusline
  --

  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("nelgau.config.lualine").setup()
    end,
  })

  --
  -- Language Server
  --

  use({
    "neovim/nvim-lspconfig",
    requires = {
      -- "williamboman/nvim-lsp-installer",
      "ray-x/lsp_signature.nvim",
    },
    config = function()
      require("nelgau.config.lspconfig").setup()
    end,
  })

  --
  -- Syntax
  --

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/playground",
    },
    run = ":TSUpdate",
    config = function()
      require("nelgau.config.treesitter").setup()
    end,
  })

  --
  -- Navigation and Editing
  --

  use({
    -- use "preservim/nerdtree"
    "santiagovrancovich/nerdtree",
    branch = "hotfix-issue-#1321",
    config = function()
      require("nelgau.config.nerdtree").setup()
    end,
  })

  use({
    "gpanders/editorconfig.nvim",
  })

  --
  -- Input
  --

  use({
    "b0o/mapx.nvim",
    config = function()
      require("nelgau.config.mappings").setup()
    end,
  })
end)
