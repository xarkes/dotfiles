""" Load plugins (thanks wbthomason/packer.nvim)
"""
""" Install:
""" `git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
""" :PackerUpdate
""" Requires neovim master (builtin TreeSitter)
"""
lua require('plugins')

""" General configuration
" Show cursor line and column in status
set ruler
" Show line numbers
set number
" Search case-insensitively unless uppercase characters are used
set ignorecase smartcase
" Incremental search (show matched pattern in real time)
set incsearch
" Show live substitution
set inccommand=nosplit
" It's good to have a mouse sometimes
set mouse=a
" Use true colors
set termguicolors
" Completion
set completeopt=menuone,noselect
" Font
set guifont=Deja\ Vu\ Sans\ Mono:h11

let g:python3_host_prog="/usr/bin/python3"

" For post loading of configurations, see plugin/after.vim

""" Shortcuts
"" Buffers
nnoremap <space>bn :bn<CR>
nnoremap <space>bp :bp<CR>
nnoremap <space>bd :bd<CR>

"" Explorers
nnoremap <space>bb :Buffers<CR>
nnoremap <space><space> :FZF<CR>
" Git grep wrapper
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
nnoremap <space>gg :GGrep<CR>
nnoremap <space>gr :Rg<CR>

"" Easy Copy
vnoremap <C-c> "+y

"" LSP
"nnoremap <leader>x] <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <leader>xK <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>xk <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <leader>x[ <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <leader>x0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
"nnoremap <leader>xW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"nnoremap <leader>xd <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <leader>xn <cmd>lua vim.lsp.buf.rename()<CR>

