:set backspace=2
:set number
:set relativenumber " show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
let NERDTreeShowHidden=1

:let mapleader=","
:let localleader=",,"
"
"
" Mappings
" put up - move a line up
:noremap <leader>mu yymakPmz`add`z
" put down - move a line down
:noremap <leader>md ddp
" cut line - cut a line
:noremap <leader>xl dd
" copy line - copy a line
:noremap <leader>cl yy
" Ctrl + n - Open nerdTree
:noremap <C-n> :NERDTree ~/Documents/Projects<cr>
" Open vimrc in a vertical split
:noremap <leader>ov :vsplit $MYVIMRC<cr>
" Source vimrc
:noremap <leader>sv :source $MYVIMRC<cr>
" Uppercase current word insert mode
:inoremap <c-u> <esc>magUiw`aa
" Open file in vertical split with under cursor name in same dir as current file
:nnoremap <leader>of :vertical wincmd f<CR>
" go to the first character of the current line
:noremap H ^
" go to the last character of the current line
:noremap L $
" go into normal mode quickly
:inoremap jk <esc>
" add space and remain in normal mode
:nnoremap <cr> O<esc>j
"
"
" auto close { braces into block mode
:inoremap {<cr> {<cr>}<esc>O
" auto close [ brackets into block mode
:inoremap [<cr> [<cr>]<esc>O
" auto close ( brackets into block mode
:inoremap (<cr> (<cr>)<esc>O
"
"
" auto close ( inline mode
:inoremap (cc ()<left>
" auto close ( inline mode and add sorrounding spaces
:inoremap (cs (<space><space>)<left><left>
"
" auto close { inline mode
:inoremap {cc {}<left>
" auto close { inline mode and add sorrounding spaces
:inoremap {cs {<space><space>}<left><left>
"
"
" auto close [ inline mode
:inoremap [cc []<left>
" auto close [ inline mode and add sorrounding spaces
:inoremap [cs [<space><space>]<left><left>
" auto close self closing tags e.g. <img /> inline mode
:inoremap <cc <<space>/><left><left><left>
" move right with ctrl-l in insert mode
:inoremap <C-l> <right>
" move left with ctrl-h in insert mode
:inoremap <C-h> <left>
" move up with ctrl-k in insert mode
:inoremap <C-k> <up>
" move down with ctrl-j in insert mode
:inoremap <C-j> <down>
"
" auto close " inline mode
:inoremap "cc ""<left>
" auto close ' inline mode
:inoremap 'cc ''<left>
" auto close ` inline mode
:inoremap `cc ``<left>


" open previous buffer to the right
"
:nnoremap <leader>pr :execute "rightbelow :vsplit " . bufname("#")<CR>
"
" highlight trailing white space
:nnoremap <leader>ts :vimgrep /\v\s+$/ %<CR>:copen<CR>
" remove highlight trailing white space
:nnoremap <leader>W :match none<CR>
"
" grep the word under the cursor
" :nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<CR>:copen<CR>
" to go to the next grep match
:nnoremap ]m :cnext<CR>
" to go to the previous grep match
:nnoremap [m :cprevious<CR>
" Abrreviations
"
:iabbrev teh the
:iabbrev hte the
:iabbrev notificaiton notification
:iabbrev notificaitons notifications
:iabbrev retrun return

" vim folding {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker foldlevelstart=0
augroup END
" }}}

" Toggling things and options {{{

" ToggleRelativeNum <leader>trn {{{
function! ToggleRelativeNum ()
   " execute 'setlocal ' . 'rnu!' 
   setlocal relativenumber!
endfunction 

:nnoremap <leader>trn :call ToggleRelativeNum()<CR>
" }}}

" ToggleFoldColum <leader>tfc {{{
function! s:ToggleFoldColumn ()
  if &foldcolumn ==# 0
    setlocal foldcolumn=2
    return
  endif
  setlocal foldcolumn=0
endfunction

:nnoremap <leader>tfc :call <SID>ToggleFoldColumn()<CR>
" }}}

" ToggleQuickFic <leader>tqf {{{
let g:is_quick_fix_open = 0
function! s:ToggleQuickFix()
  if g:is_quick_fix_open
    cclose
    let g:is_quick_fix_open = 0
    " move back to previous window
    execute g:prev_win_num . "wincmd w"
    return
  endif
  " save the win number for where you're coming from before opening quickfix
  let g:prev_win_num = winnr()
  copen
  let g:is_quick_fix_open = 1
endfunction
:nnoremap <leader>tqf :call <SID>ToggleQuickFix()<CR>
"}}}

"}}}

" Auto commands {{{
" VimEnter Auto commands {{{
augroup nerd_tree
  :autocmd!
  " Open Nerd tree in Projects folder
  :autocmd VimEnter * :NERDTree Documents/Projects/ 
  " :autocmd TabEnter * :NERDTree Documents/Projects/ 
augroup END
" End VimEnter Auto commands }}}

" FileType Auto commands {{{
" Eatchar {{{
fun! Eatchar(pattern)
  let c = nr2char(getchar(0))
  return (c =~ a:pattern) ? '' : c
endfun
"}}}

" JavaScript and TypeScript Auto commands {{{
augroup filetype_js_ts
  :autocmd!
  " auto if 
  :autocmd FileType javascript*,typescript* :iabbrev <buffer> iff if ()<left><C-R>=Eatchar('\s')<cr>
  " auto fn
  :autocmd FileType javascript*,typescript* :iabbrev <buffer> fn function
  " change current func name
  :autocmd FileType javascript*,typescript* :onoremap fn :<c-u>execute "normal! ?function\r:nohlsearch\rwviw"<CR>
augroup END
" End JavaScript and TypeScript Auto commands }}}

" Python FileType Auto commands{{{
augroup filetype_py
  :autocmd!
  :autocmd FileType python* :setlocal shiftwidth=4 tabstop=4 
augroup END
" End Python FileType Auto commands}}}
" End FileType Auto commands}}}
" End Auto commands}}}

" TransferBufferToNewTab {{{
function! s:TransferBufferToNewTab()
  " store the current filename in variable to use in split
  let cur_filename = fnamemodify(expand('%'), ':p')
  " close the current buffer
  execute winnr() . 'wincmd q' 
  " open the filename in new tab
  execute "tab split " . cur_filename 
  NERDTree
  execute "2wincmd w"
endfunction

:nnoremap <leader>gt :call <SID>TransferBufferToNewTab()<CR>
"}}}

" QuitCurrentTab {{{
function! s:QuitCurrentTab()
  tabclose
endfunction 

:nnoremap <leader>qt :call <SID>QuitCurrentTab()<CR>
"}}}

if !exists('g:syntax_on')
	syntax enable
endif

call plug#begin()

	Plug 'scrooloose/nerdtree'
	Plug 'flazz/vim-colorschemes'
	Plug 'crusoexia/vim-monokai'
	Plug 'pangloss/vim-javascript'
	Plug 'crusoexia/vim-javascript-lib'
	Plug 'mxw/vim-jsx'
  Plug 'w0rp/ale'
	" Plug 'scrooloose/syntastic'
  Plug 'tomasr/molokai'
	Plug 'tpope/vim-surround'
  Plug 'valloric/youcompleteme'
  Plug 'tpope/vim-commentary'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'vim-utils/vim-line'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'iamcco/markdown-preview.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'lifepillar/vim-solarized8'
  Plug 'ekalinin/dockerfile.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'davidhalter/jedi-vim'

call plug#end()
let g:jedi#completions_enabled=1
" Configure ALE linter
let g:ale_lint_on_text_changed = 'never'

" ignore some html5 errors
" let syntastic_mode_map = { 'passive_filetypes': ['html'] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

:set colorcolumn=80
set encoding=utf-8
set guioptions=
set encoding=UTF-8
filetype plugin indent on
:set smartindent
set guifont=:h

set background=light
colorscheme monokai

let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeDirArrows=0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '📁'
let g:DevIconsDefaultFolderCloseSymbol = '📁'
let g:DevIconsDefaultFolderOpenSymbol = '📂'
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeSyntaxEnabledExtensions = ['py', 'jsx', 'js', 'scss',  'css', 'md']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
" let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
let g:vim_markdown_fenced_languages = ['javascript=js', 'python=py', 'html=html', 'css=css']
let g:vim_markdown_folding_level = 2
