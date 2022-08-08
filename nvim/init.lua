-- Packer installation
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute(
    '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path
  )
end

vim.cmd [[
augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
augroup end
]]

-- Plugin installation
use = require("packer").use
require("packer").startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Color themes
  use 'sainnhe/everforest'
  use 'navarasu/onedark.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- LSP all the way!
  use 'neovim/nvim-lspconfig'

  -- Better highlight
  use 'nvim-treesitter/nvim-treesitter'

  ---- BONUS: Customizations over LSP
  ---- Show VSCode-esque pictograms
  --use 'onsails/lspkind-nvim'
  ---- show various elements of LSP as UI
  --use {'tami5/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}

  ---- Autocompletion plugin
  --use {
  --  'hrsh7th/nvim-cmp',
  --  requires = {
  --    'hrsh7th/cmp-nvim-lsp',
  --    'hrsh7th/cmp-buffer',
  --    'hrsh7th/cmp-path',
  --    'hrsh7th/cmp-cmdline',
  --  }
  --}

  ---- snippets
  --use {
  --  'hrsh7th/cmp-vsnip', requires = {
  --    'hrsh7th/vim-vsnip',
  --    'rafamadriz/friendly-snippets',
  --  }
  --}

  ---- bracket autocompletion
  --use 'vim-scripts/auto-pairs-gentle'

  -- Fancier statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
    },
  }


  ---- Fast incremental parsing library
  --use 'nvim-treesitter/nvim-treesitter'

end)

-- Neovim configuration
-- Do not show current vim mode since it is already shown by Lualine
vim.o.showmode = false

-- enable autowriteall
vim.o.autowriteall = true

-- Show the line numbers
vim.wo.number = true

-- Show chars at the end of line
vim.opt.list = true

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- Decrease update time (save swap files faster)
--vim.o.updatetime = 250

-- Shows signs by Autocompletion plugin
vim.wo.signcolumn = 'yes'

-- Enable termguicolors. Very essential if you want 24-bit RGB color in TUI.
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone'

-- colorscheme
--vim.cmd('colorscheme everforest')
--require('onedark').setup {
--    style = 'warm'
--}
--require('onedark').load()
--vim.cmd('colorscheme nightfox')
--vim.cmd('colorscheme terafox')
--vim.g.tokyonight_style = "storm"
--vim.cmd('colorscheme tokyonight')
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Buffer mappings
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>bn', '<cmd>bn<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>bp', '<cmd>bp<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>bd', '<cmd>bd<cr>', opts)

-- System-wide yank
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', opts)

-- Highlight on yank
vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]]

-- Plugin configuration

-- LSP Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- LSP Style
--vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
--vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'}),
}


require'lspconfig'.ccls.setup{
  on_attach = on_attach,
  handlers = handlers
}

-- Syntax highlighting
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "cpp" },
  sync_install = true,
  auto_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- autopairs
-- vim.g.AutoPairs = {
--   ['(']=')',
--   ['[']=']',
--   ['{']='}',
--   ["'"]="'",
--   ['"']='"',
--   ['`']='`',
--   ['<']='>',
-- }


-- lualine
require('lualine').setup({
  sections = {
    lualine_c = {
      {'filename', path = 1},
      'lsp_progress',
    },
  },
})

---- treesitter
--require('nvim-treesitter.configs').setup {
--  ensure_installed = {"python", "rust", "c", "cpp", "bash", "go", "html"},
--  highlight = {
--    enable = true, -- false will disable the whole extension
--  },
--}
--
-- lspsaga
--require("lspsaga").init_lsp_saga({
--  finder_action_keys = {
--    open = '<CR>',
--    quit = {'q', '<esc>'},
--  },
--  code_action_keys = {
--    quit = {'q', '<esc>'},
--  },
--  rename_action_keys = {
--    quit = '<esc>',
--  },
--})
