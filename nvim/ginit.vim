if exists('g:GuiLoaded')
  GuiFont DejaVu Sans Mono:h11
endif
set linespace=4

let s:fontsize = 11
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize + a:amount
  :execute "GuiFont! DejaVu Sans Mono:h" . s:fontsize
endfunction

noremap <C-+> :call AdjustFontSize(1)<CR>
noremap <C--> :call AdjustFontSize(-1)<CR>
inoremap <C-+> :call AdjustFontSize(1)<CR>
inoremap <C--> :call AdjustFontSize(-1)<CR>
