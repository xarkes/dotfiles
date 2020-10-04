" Post load config
color dracula

" Nvim treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "cpp",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
