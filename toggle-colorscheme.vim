" Toggle day and night {{{
:nnoremap <ESC><ESC><ESC> :call <SID>toggleDayNight()<CR>
:nnoremap <leader><leader><leader> :call <SID>toggleDayNight()<CR>

:let g:is_day = 0
function s:toggleDayNight()
  if g:is_day == 1 " it is day
    colorscheme flattened_light  
    set background=light
    let g:is_day = 0
  elseif g:is_day == 0 " it's night
    colorscheme monokai  
    set background=dark
    let g:is_day = 1
  endif

  hi CursorLine cterm=bold
endfunction

:call <SID>toggleDayNight()
"}}}

