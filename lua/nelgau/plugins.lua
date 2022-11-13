vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup({
  function(use)
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

    use({
      "folke/tokyonight.nvim",
      requires = "folke/lsp-colors.nvim",
      config = function()
        require("nelgau.color.tokyonight").setup()
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

    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "nvim-treesitter",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-cmdline",
      },
      config = function()
        require("nelgau.config.cmp").setup()
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
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("nelgau.config.nvim-tree").setup()
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
  end,

  -- Packer startup config
  config = {
    max_jobs = 50,
    autoremove = true,
    display = {
      open_fn = function()
        return require("packer.util").float({
          border = "single",
          width = 80,
        })
      end,
    },
  },
})
