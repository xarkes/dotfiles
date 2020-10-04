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
" It's good to have a mouse sometimes
set mouse=a
" Use true colors
set termguicolors

" For post loading configurations, see plugin/after.vim

""" Shortcuts
"" Buffers
nnoremap <space>bn :bn<CR>
nnoremap <space>bp :bp<CR>
nnoremap <space>bd :bd<CR>
nnoremap <space>bb :Buffers<CR>

nnoremap <space><space> :FZF<CR>
