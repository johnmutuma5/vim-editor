:set backup                    " keep a backup file
:set backupdir=$HOME/.vim/_backups
:set directory=$HOME/.vim/_swp
:set number
:set cursorline
:set relativenumber " show existing tab with 2 spaces width
:set tabstop=2
:set foldmethod=syntax
:set foldlevel=15
:set wildignore=*/**/node_modules/*
"
"
" always show statusline
:set laststatus=2
:set nowrap " don't wrap 
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set hlsearch
set incsearch
" set ignorecase
set smartcase

" cursoline bold
:hi CursorLine cterm=bold
" 


let NERDTreeShowHidden=1

:let mapleader=","
:let localleader=",,"
" Initiate Pathogen
execute pathogen#infect() 
"
"
" Mappings
" put up - move a line up
:nnoremap <leader>mk yymakPmz`add`z
" Substitute in file
:nnoremap <leader>s :%s///g<left><left><left>
:nnoremap <leader>sc :%s///gc<left><left><left><left>
:nnoremap <leader>ar :args */**/*.
:nnoremap <leader>vg :vimg //g ##<left><left><left><left><left>
" put down - move a line down
:nnoremap <leader>mj ddp
" cut line - cut a line
:nnoremap <leader>xl dd
"
" Ctrl + n - Open nerdTree
function! s:OpenNerdTree()
  :execute ':NERDTree %'
endfunction
" :nnoremap <C-n> :NERDTree getcwd()<cr>
:nnoremap <C-n> :call<SID>OpenNerdTree()<cr>
:nnoremap <C-n>f :NERDTreeFind<cr>:call<SID>TransferBufferToNewTab()<CR>
" Open vimrc in a vertical split
:nnoremap <leader>ov :tabedit $MYVIMRC<cr>
" Source vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>
" Uppercase current word insert mode
:inoremap <c-u> <esc>magUiw`aa
" Open file in vertical split with under cursor name in same dir as current file
:nnoremap <leader>gf :vertical wincmd f<CR>
" go to the first character of the current line
" :noremap H ^
" go to the last character of the current line
" :noremap L $
" go into normal mode quickly
:inoremap jk <esc>
" add space and remain in normal mode
" highlight search off
:nnoremap <leader><CR> :nohlsearch<CR>:<CR>
" " use very magic when searching
" :nnoremap / /\v
" :nnoremap ? ?\v
" use: disregard wrap with j and k 
:nnoremap j gj
:nnoremap k gk
"
" closing windows fugitive style
:nnoremap gq <C-W>c
"
"
" File versions traversal - use 0Glog to create a quick list of file versions
" and  use the mappings below to traverse the file versions
" a commit older
:nnoremap ]v :cn<CR>
" oldest commit
:nnoremap ]]v :clast<CR>

" a commit newer
:nnoremap [v :cp<CR>
" latest commmit
:nnoremap [[v :cfirst<CR>

" use Ctrl + j to move windows
:nnoremap <c-h> ^ 
:nnoremap <c-l> $ 
" 
" :nnoremap <c-l> <c-w>l
" :nnoremap <c-c> <c-w>c
" :nnoremap <c-k> <c-w>k
" :nnoremap <c-h> <c-w>h
" :nnoremap <c-l> <c-w>l
"
" auto close { braces into block mode
:inoremap {<cr> {<cr>}<esc>O
" auto close [ brackets into block mode
:inoremap [<cr> [<cr>]<esc>O
" auto close ( brackets into block mode
:inoremap (<cr> (<cr>)<esc>O
"
" cbange inside []
" :inoremap cir ci[
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
" use terminal escape sequences
:inoremap <ESC>f <right>
" following escape sequence useful when iterm is mapped for Alt+l to move cursor right a char
:inoremap <ESC>[C <right> 
" move left with ctrl-h in insert mode
:inoremap <ESC>b <left>
" following escape sequence useful when iterm is mapped for Alt+l to move cursor left a char
:inoremap <ESC>[D <left>
" move up with ctrl-k in insert mode
:inoremap ˚ <up>
" move down with ctrl-j in insert mode
:inoremap ∆ <down>

" insert mode backspace with Ctrl+H
:inoremap <C-h> <left><delete>
" insert mode delete character under cursor with Ctrl+x
:inoremap <C-x> <delete>
" insert mode delete next character
:inoremap <C-l> <right><delete><left>

" disable arrow keys 
" :nnoremap <left> :<CR>
" :nnoremap <up> :<CR>
" :nnoremap <right> :<CR>
" :nnoremap <down> :<CR>
" :inoremap <left> <ESC>a
" :inoremap <up> <Esc>a
" :inoremap <right> <Esc>a
" :inoremap <down> <Esc>a

" higlight colors
:nnoremap <leader>hco :ColorHighlight<CR> 
:nnoremap <leader>hcc :ColorClear<CR>
"
" auto close " inline mode
:inoremap "cc ""<left>
" auto close ' inline mode
:inoremap 'cc ''<left>
" auto close ` inline mode
:inoremap `cc ``<left>
" 
" CtrlP
:nnoremap <C-p>f :CtrlP<cr>
:nnoremap <C-p>b :CtrlPMRUFiles<cr>

" open previous buffer to the right
"
:nnoremap <leader>pr :execute "rightbelow :vsplit " . bufname("#")<CR>:wincmd p<CR>
"
" highlight trailing white space
:nnoremap <leader>ts :vimgrep /\v\s+$/ %<CR>:copen<CR>
" remove highlight trailing white space
:nnoremap <leader>W :match none<CR>
:nnoremap <leader>I :PlugInstall<CR>
:nnoremap <leader>U :PlugUpdate<CR>
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

" vim folding {{{
augroup filetype_markdown
  autocmd!
  autocmd FileType markdown setlocal wrap linebreak
augroup END
" }}}
"
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

" TogglCursorLine <leader>tcl {{{
function! s:ToggleCursorLine ()
  setlocal cursorline!
  endfunction

:nnoremap <leader>tcl :call <SID>ToggleCursorLine()<CR>
"}}}

" ToggleCursorColumn <leader>tcc
function! s:ToggleCursorColumn ()
  setlocal cursorcolumn!
endfunction

:nnoremap <leader>tcc :call <SID>ToggleCursorColumn()<CR>


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

" BufEnter Auto commands {{{
augroup set_filetype
  :autocmd!
  " Open Nerd tree in Projects folder
  :autocmd BufEnter *.cmp,*.evt,*.design :set filetype=xhtml " Salesforce files
  :autocmd BufEnter *.js :set filetype=typescript
  :autocmd BufEnter *.tsx :set filetype=typescript
  " :autocmd TabEnter * :NERDTree Documents/Projects/ 
augroup END
" End BufEnter Auto commands }}}

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
  :autocmd FileType python*,html*,xml* :setlocal shiftwidth=4 tabstop=4 
augroup END
" End Python FileType Auto commands}}}
"
" apexcode FileType Auto commands{{{
augroup filetype_apexcode
  :autocmd!
  :autocmd FileType apexcode* :setlocal shiftwidth=2 tabstop=2 
augroup END
" End apex FileType Auto commands}}}

" Jupyter Notebooks Auto commands{{{
augroup jupyter_notebooks
  :autocmd!
  :autocmd Filetype ipynb nmap <silent><Leader>ib :VimpyterInsertPythonBlock<CR>
  :autocmd Filetype ipynb nmap <silent><Leader>sj :VimpyterStartJupyter<CR>
  " :autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>
augroup END
"}}}

" End FileType Auto commands}}}

" End Auto commands}}}

" TransferBufferToNewTab {{{
function! s:TransferBufferToNewTab()
  " store the current filename in variable to use in split
  let cur_filename = fnamemodify(expand('%'), ':p')
  let cur_line = line('.')
  let cur_col = col('.')
  " close the current buffer
  execute winnr() . 'wincmd q' 
  " open the filename in new tab
  execute "tab split " . cur_filename 
  execute "wincmd p"
  " go to cursor position
  execute "normal! " . cur_line . "G"
  execute "normal! " . cur_col . "|"
  " scroll current line to  middle of screen
  normal! zz 
endfunction

:nnoremap <leader>gt :call <SID>TransferBufferToNewTab()<CR>
"}}}

" QuitCurrentTab {{{
function! s:QuitCurrentTab()
  tabclose
endfunction 

:nnoremap <leader>qt :call <SID>QuitCurrentTab()<CR>
"}}}

:nnoremap <leader>ttb :TagbarToggle<CR>

if !exists('g:syntax_on')
	syntax enable
endif

call plug#begin()

	Plug 'scrooloose/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'flazz/vim-colorschemes'
	Plug 'crusoexia/vim-monokai'
	Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
	Plug 'crusoexia/vim-javascript-lib'
	Plug 'mxw/vim-jsx'
  Plug 'dense-analysis/ale'
  Plug 'tomasr/molokai'
	Plug 'tpope/vim-surround'
  Plug 'valloric/youcompleteme'
  Plug 'tpope/vim-commentary'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-utils/vim-line'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-abolish'
  Plug 'itchyny/lightline.vim'
  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'iamcco/markdown-preview.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'ekalinin/dockerfile.vim'
  Plug 'davidhalter/jedi-vim'
  Plug 'vim-python/python-syntax'
  Plug 'szymonmaszke/vimpyter'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'neowit/vim-force.com'
  Plug 'majutsushi/tagbar'
  Plug 'isRuslan/vim-es6'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-vinegar'
  Plug 'chrisbra/colorizer'
  Plug 'mattn/emmet-vim'
  Plug 'rakr/vim-one'
  Plug 'romainl/flattened'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'godlygeek/tabular'
  Plug 'gregsexton/MatchTag'
  Plug 'ludovicchabant/vim-gutentags'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-obsession'

call plug#end()


" FZF.vim now supports this command out of the box
:nnoremap <C-f>g :Rg -g '*.*'<space> ''<left>
:nnoremap <C-f>f :FZF<CR>
:nnoremap <C-f>b :Buffers<CR>
" so this code is no longer needed.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

let g:ale_pattern_options = {
\   '.*\.cmp$': {'ale_enabled': 0},
\   '.*\.evt$': {'ale_enabled': 0},
\   '.*\.html$': {'ale_enabled': 0}
\}
let g:ale_linters = {
      \ 'typescript': ['tslint'],
      \}
" let g:user_emmet_leader_key='<C-n>'
let g:jedi#completions_enabled=1
"
" minimum chars to trigger autocompletion to speed up the insert mode
let g:ycm_min_num_of_chars_for_completion=70
"
" Configure ALE linter
let g:ale_lint_on_text_changed = 'never'
let g:python_highlight_all = 1
" ignore some html5 errors
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%{FugitiveStatusline()}

:set colorcolumn=100
set encoding=utf-8
set guioptions=
set encoding=UTF-8
filetype plugin indent on
:set smartindent

set guifont=:h


let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeDirArrows=0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '🗂'
let g:DevIconsDefaultFolderCloseSymbol = '🗂'
let g:DevIconsDefaultFolderOpenSymbol = '📂'
let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
" let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['xml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cmp'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['evt'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cls'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['forceignore'] = ''

let g:NERDTreeSyntaxEnabledExtensions = ['py', 'jsx', 'tsx', 'js', 'scss',  'css', 'md', 'xml', 'apexcode', 'cls', 'json', 'svg']
let s:blue = "689FB6"
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let s:gold_color = 'FFD700'
let s:deepskyblue = '00BFFF'
let s:mediumseagreen = '3CB371'
let s:lawngreen = 'ADFF2F'
let s:stickynoteyellow = 'FFFACD'

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor[''] = s:stickynoteyellow
let g:NERDTreeExtensionHighlightColor['vim'] = s:lawngreen
let g:NERDTreeExtensionHighlightColor['js'] = s:gold_color
let g:NERDTreeExtensionHighlightColor['py'] = s:blue
let g:NERDTreeExtensionHighlightColor['scss'] = s:salmon
let g:NERDTreeExtensionHighlightColor['css'] = s:deepskyblue
let g:NERDTreeExtensionHighlightColor['jsx'] = s:aqua
let g:NERDTreeExtensionHighlightColor['tsx'] = s:aqua
let g:NERDTreeExtensionHighlightColor['json'] = s:lightPurple
let g:NERDTreeExtensionHighlightColor['md'] = s:mediumseagreen
let g:NERDTreeExtensionHighlightColor['yml'] = s:blue
let g:NERDTreeExtensionHighlightColor['yaml'] = s:blue
let g:NERDTreeExtensionHighlightColor['cls'] = s:blue
let g:NERDTreeExtensionHighlightColor['cmp'] = s:blue
let g:NERDTreeExtensionHighlightColor['evt'] = s:red
let g:NERDTreeExtensionHighlightColor['svg'] = s:aqua
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.+\.html\*?$'] = s:darkOrange
let g:NERDTreePatternMatchHighlightColor['^Dockerfile.*'] = s:blue
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.vimrc'] = s:lawngreen
let g:NERDTreeExactMatchHighlightColor['.gitignore*'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.forceignore*'] = s:aqua
let g:NERDTreeExactMatchHighlightColor['Dockerfile'] = s:blue
"
"
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
  \   'right': [],
  \ }
set showtabline=2  " Show tabline
" let s:palette = g:lightline#colorscheme#wombat#palette
" let s:palette.tabline.tabsel = [ [ s:aqua, s:blue, 252, 90, 'bold' ] ]
" unlet s:palette

set guioptions-=e  " Don't use GUI tabline

let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
let g:vim_markdown_fenced_languages = ['javascript=js', 'python=py', 'html=html', 'css=css']
let g:vim_markdown_folding_level = 2

" force.com
let g:apex_backup_folder="/Users/johnmutuma/Documents/force-workspace/backup/"
let g:apex_temp_folder="/tmp/apex/gvim-deployment"
let g:apex_tooling_force_dot_com_path="/Users/johnmutuma/Documents/force-workspace/tooling-force.com-0.4.4.0.jar"
let g:apex_properties_folder="/Users/johnmutuma/Documents/force-workspace/properties/"
