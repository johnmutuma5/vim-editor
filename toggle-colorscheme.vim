" Toggle day and night {{{
:nnoremap <ESC><ESC><ESC> :call <SID>toggleDayNight()<CR>

:let g:is_day = 0
function s:toggleDayNight()
  if g:is_day == 1 " it is day
    colorscheme flattened_light  
    set background=light
    hi Normal ctermbg=15
    hi CursorLine cterm=bold ctermbg=254
    hi CursorColumn cterm=bold ctermbg=254
    hi ColorColumn ctermbg=254 guibg=lightgray
    let g:is_day = 0
  elseif g:is_day == 0 " it's night
    colorscheme monokai  
    set background=dark
    hi Normal ctermbg=235
    hi CursorLine cterm=bold ctermbg=237
    hi CursorColumn cterm=bold ctermbg=237
    hi ColorColumn ctermbg=237 guibg=lightgray
    let g:is_day = 1
  endif
endfunction

:call <SID>toggleDayNight()
"}}}

