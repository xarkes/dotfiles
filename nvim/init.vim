:" Plugin manager
call plug#begin('~/.local/share/nvim/plugged')
Plug 'prabirshrestha/async.vim'   " Asynchronous tasks
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'} " CoC! Great LSP plugin
Plug 'airblade/vim-gitgutter'     " Show git diff
Plug 'liuchengxu/vista.vim'       " LSP Tagbar
Plug 'scrooloose/nerdtree'        " File manager
Plug 'sheerun/vim-polyglot'       " More programming languages syntax highlighting support
Plug 'dhruvasagar/vim-table-mode' " Some plugin to play with various tables formats
Plug 'ayu-theme/ayu-vim'          " Awesome theme
Plug 'bling/vim-bufferline'	  " Show buffers in statusbar
Plug 'itchyny/lightline.vim'      " A cool status line
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'           " Fuzzy Search because whynot
Plug 'tpope/vim-sleuth'           " Fuck this vim indentation ...
Plug 'tomasiser/vim-code-dark'
call plug#end()

" General 
filetype indent on                " smart indent based on filetypes
filetype plugin on
set hidden                        " allow unsaved buffer to be hidden
set ai                            " auto indent
set ruler                         " show cursor line and column in status
set number                        " show line numbers
set inccommand=nosplit            " show live substitution
set ignorecase smartcase          " search case-insensitively unless uppercase characters are used
set autoread                      " automatically reload file on changes
set incsearch                     " incremental search
set backspace=indent,eol,start    " smarter backspaces
set wildmenu                      " visual autocomplete for command menu
set cc=80                         " show line at 80ch
set mouse=a                       " it's good to have a mouse sometimes

" Color and style configuration
"set termguicolors
syntax on
let g:enable_bold_font = 1
let g:enable_italic_font = 1
"set background=dark
"let ayucolor="dark"
"colorscheme ayu
colorscheme codedark

""""""""""""""""""""""
" CoC configuration
""""""""""""""""""""""
" coc
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" Highlight symbol under cursor on CursorHold
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" don't give |ins-completion-menu| messages.
" set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> <leader>xd <Plug>(coc-definition)
nmap <silent> <leader>xt <Plug>(coc-type-definition)
nmap <silent> <leader>xi <Plug>(coc-implementation)
nmap <silent> <leader>xr <Plug>(coc-references)

" Use L to show documentation in preview window
nnoremap <silent> L :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>xn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
""""""""""""""""""""""
" End CoC configuration
""""""""""""""""""""""

"""" File lookup
nnoremap <C-p> :Files<CR>
nnoremap <leader>. :Vista finder<CR>
nnoremap <leader>l :Vista!!<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

"" Buffers
nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>p :bp<CR>
nnoremap <silent> <leader>d :bdelete<CR>

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'method': 'NearestMethodOrFunction',
      \ },
      \ }
