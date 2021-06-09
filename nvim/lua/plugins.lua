-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- return require('packer').startup(function()
local packer = require('packer')
local util = require('packer.util')

local config = {
  ensure_dependencies = true,
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.vim'),
  plugin_package = 'packer',
  max_jobs = nil,
  auto_clean = true,
  compile_on_sync = true,
  disable_commands = false,
  opt_default = false,
  transitive_opt = true,
  transitive_disable = true,
  git = {
    cmd = 'git',
    subcommands = {
      update = '-C %s pull --ff-only --progress --rebase=false',
      install = 'clone %s %s --depth %i --no-single-branch --progress',
      fetch = '-C %s fetch --depth 999999 --progress',
      checkout = '-C %s checkout %s --',
      update_branch = '-C %s merge --ff-only @{u}',
      current_branch = '-C %s rev-parse --abbrev-ref HEAD', -- For git 2.20+: '-C %s branch --show-current',
      diff = '-C %s log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
      diff_fmt = '%%h %%s (%%cr)',
      get_rev = '-C %s rev-parse --short HEAD',
      get_msg = '-C %s log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
      submodules = '-C %s submodule update --init --recursive --progress',
      revert = '-C %s reset --hard HEAD@{1}'
    },
    depth = 1,
    clone_timeout = 60
  },
  display = {
    open_fn = nil,
    open_cmd = '65vnew [packer]',
    working_sym = '⟳',
    error_sym = '✗',
    done_sym = '✓',
    removed_sym = '-',
    moved_sym = '→',
    header_sym = '━',
    header_lines = 2,
    title = 'packer.nvim',
    show_all_info = true,
  }
}


packer.init(config)
packer.startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Fuzzy search :)
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Indentation auto detection
  use 'tpope/vim-sleuth'

  -- LSP <3
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'

  -- Pretty syntax highlighter
  --use 'nvim-treesitter/nvim-treesitter'

  -- Color schemes
  use {'dracula/vim', as = 'dracula'}
  use 'AlessandroYorba/Sierra'
  use 'flrnd/candid.vim'

end)

