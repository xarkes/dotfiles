-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Fuzzy search :)
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Indentation auto detection
  use 'tpope/vim-sleuth'

  -- A nice colors scheme
  use {'dracula/vim', as = 'dracula'}

  -- Pretty syntax highlighter
  use 'nvim-treesitter/nvim-treesitter'


end)

