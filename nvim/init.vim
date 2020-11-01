""" Load plugins (thanks wbthomason/packer.nvim)
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

let g:python3_host_prog="/usr/bin/python3"

" For post loading configurations, see plugin/after.vim

""" Shortcuts
"" Buffers
nnoremap <space>bn :bn<CR>
nnoremap <space>bp :bp<CR>
nnoremap <space>bd :bd<CR>
nnoremap <space>bb :Buffers<CR>

nnoremap <space><space> :FZF<CR>

"" Easy Copy
vnoremap <C-c> "+y

"" LSP
nnoremap <space>x] <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <space>xK <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <space>xD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <space>xk <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>x[ <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>xx <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <space>x0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <space>xW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <space>xd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <space>xn <cmd>lua vim.lsp.buf.rename()<CR>
