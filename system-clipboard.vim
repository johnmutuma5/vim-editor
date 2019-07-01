noremap <leader>scy :set operatorfunc=<SID>SysClipboardYank<CR>g@
noremap <leader>scp :call <SID>SysClipboardPaste()<CR>
noremap <leader>scP :call <SID>SysClipboardPasteUp()<CR>
noremap <leader>scs :call <SID>SysClipboardSearch()<CR>

"
"
" Yank to system clipboard
function! s:SysClipboardYank(type)
  let current_val_in_register = @@
  " TODO save &selection set it to "inclusive" and restore saved at the end
  " of the function

  if a:type ==# 'char'
    " yank into register @
    silent execute "normal! `[v`]y`]"
  endif

  if a:type ==# 'line' 
    silent execute "normal! '[V']y']"
  endif
  "
  " TODO  for visual mode if a:type ==# 'v' and line

  " Add the selection into clipboard register @*
  let @* = @@ 
  " restore what was previously in the unknown register and register r
  let @@ = current_val_in_register
endfunction
"
"
" Paste from system clipboard
function! s:SysClipboardPaste()
  normal! "*p
endfunction

"
"
" Paste from system clipboard
function! s:SysClipboardPasteUp()
  normal! "*P
endfunction

"
" Search from system clipboard 
function! s:SysClipboardSearch()
  execute "normal! " . '/\v<' . @* . "\<cr>"
  " move match line to the middle of screen
  normal! zz
endfunction

