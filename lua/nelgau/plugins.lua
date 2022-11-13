vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use('nvim-lualine/lualine.nvim')

  use('neovim/nvim-lspconfig')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/nvim-treesitter-context')
  use('nvim-treesitter/playground')

  use('gruvbox-community/gruvbox')

  use('gpanders/editorconfig.nvim')

  -- use "preservim/nerdtree"
  use {'santiagovrancovich/nerdtree', branch = 'hotfix-issue-#1321'}
end)
