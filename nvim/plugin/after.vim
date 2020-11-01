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

" LSP Configuration
lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.ccls.setup{
  cmd = { "/usr/local/bin/ccls" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}
EOF
