local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")

    --
    -- Colorscheme
    --

    use({
      "luisiacc/gruvbox-baby",
      config = function()
        vim.cmd("colorscheme gruvbox-baby")
      end,
    })

    --
    -- Statusline
    --

    use({
      "nvim-lualine/lualine.nvim",
      after = "gruvbox-baby",
      requires = {
        "arkav/lualine-lsp-progress",
      },
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
        "nvim-treesitter/playground",
      },
      run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
      end,
      config = function()
        require("nelgau.config.treesitter").setup()
      end,
    })

    use({
      "nvim-treesitter/nvim-treesitter-context",
      --requires = {
      --  "nvim-treesitter/nvim-treesitter"
      --},
      after = "nvim-treesitter",
      config = function()
        require("nelgau.config.treesitter-context").setup()
      end
    })

    --
    -- Terminal
    --

    use({
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require("nelgau.config.toggleterm").setup()
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

    if packer_bootstrap then
      require('packer').sync()
    end
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
