:set backup                    " keep a backup file
:set backupdir=$HOME/.vim/_backups
:set directory=$HOME/.vim/_swp
:set number
:set cursorline
:set relativenumber " show existing tab with 2 spaces width
:set tabstop=2
:set foldmethod=syntax
:set foldlevel=0
:set foldlevelstart=0
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

:let $NVIM_COC_LOG_LEVEL='debug'

let NERDTreeShowHidden=1

:let mapleader=","
:let localleader=",,"
" Initiate Pathogen
" execute pathogen#infect() 
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

" Tabularize Object literals after full colon
:nnoremap <leader>tbiB viB:Tabu /:\zs<CR>
"
" Ctrl + n - Open nerdTree
function! s:OpenNerdTree()
  :execute ':NERDTreeToggle %'
endfunction
" :nnoremap <C-n> :NERDTree getcwd()<cr>
:nnoremap <C-n> :call<SID>OpenNerdTree()<cr>
" :nnoremap <C-n>f :NERDTreeFind<cr>:call<SID>TransferBufferToNewTab()<CR>
" Open vimrc in a vertical split
:nnoremap <leader>ov :tabedit $MYVIMRC<cr>
" Source vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>
" Uppercase current word insert mode
:inoremap <c-u> <esc>magUiw`aa
" Open file in vertical split with under cursor name in same dir as current file
:nnoremap <leader>gf :vertical wincmd f<CR>
" :nnoremap <leader>, , 
" the mapping above will help avoid the delay with the default behaviour of ','  
"
" go to the first character of the current line
" :noremap H ^
" go to the last character of the current line
" :noremap L $
" go into normal mode quickly
:inoremap jk <esc>
:"
" remove in favour of shift esc
" :inoremap <S-...><space> <esc>  
" the above may not be necessary when terminal app is configured to send ESC signal upon Shift-Space e.g. iterm

" add space and remain in normal mode
" highlight search off
:nnoremap <leader><CR> :nohlsearch<CR>:<CR>
" " use very magic when searching
" :nnoremap / /\v
" :nnoremap ? ?\v
" use: disregard wrap with j and k 
:nnoremap j gj
:nnoremap k gk
:nnoremap <leader>ww :noa w<cr>
" set current tab as only
:noremap <C-T>o :tabonly<CR>
" closing windows fugitive style
:nnoremap gq <C-W>c

" resizing windows
:nnoremap <C-W><up> <C-W>5+
:nnoremap <C-W><down> <C-W>5-
:nnoremap <C-W><left> <C-W>5<
:nnoremap <C-W><right> <C-W>5>
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
" :inoremap {<cr> {<cr>}<esc>O
" auto close [ brackets into block mode
" :inoremap [<cr> [<cr>]<esc>O
" auto close ( brackets into block mode
" :inoremap (<cr> (<cr>)<esc>O
"
" cbange inside []
" :inoremap cir ci[
"
" auto close ( inline mode
" :inoremap (cc ()<left>
" auto close ( inline mode and add sorrounding spaces
" :inoremap (cs (<space><space>)<left><left>
"
" auto close { inline mode
" :inoremap {cc {}<left>
" auto close { inline mode and add sorrounding spaces
" :inoremap {cs {<space><space>}<left><left>
"
"
" auto close [ inline mode
" :inoremap [cc []<left>
" auto close [ inline mode and add sorrounding spaces
" :inoremap [cs [<space><space>]<left><left>
" auto close self closing tags e.g. <img /> inline mode
" :inoremap <cc <<space>/><left><left><left>
" move right with ctrl-l in insert mode
" use terminal escape sequences
:inoremap <ESC>f <right>
" following escape sequence useful when iterm is mapped for Alt+l to move cursor right a char
:inoremap <ESC>[C <right> 
" move left with ctrl-h in insert mode
:inoremap <ESC>b <left>
" following escape sequence useful when iterm is mapped for Alt+l to move cursor left a char
:inoremap <ESC>[D <left>
" move up with ctrl-k in insert mode. This will overwrite :digraphs command
" which I rarely use
:inoremap <C-k> <up>
" move down with ctrl-j in insert mode.
:inoremap <C-j> <down>
" move up with ctrl-b in insert mode
:inoremap <C-b> <left>
" move up with ctrl-f in insert mode
:inoremap <C-f> <right>

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
" :inoremap "cc ""<left>
" auto close ' inline mode
" :inoremap 'cc ''<left>
" auto close ` inline mode
" :inoremap `cc ``<left>
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
:nnoremap <leader>C :PlugClean<CR>
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
  :autocmd BufEnter *.cmp,*.evt,*.design,*.page :set filetype=html " Salesforce files
  :autocmd BufEnter *.apex :set filetype=apexcode " Salesforce files
  :autocmd BufEnter *.tsx :set filetype=typescript.tsx
  :autocmd BufEnter *.jsx :set filetype=javascript.jsx
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
  " vim commenter syntax for typescript
  :autocmd FileType typescript* setlocal commentstring=//\ %s
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
  :autocmd FileType apexcode* :setlocal shiftwidth=4 tabstop=4 foldmethod=indent foldlevel=0 foldlevelstart=0
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
command! -nargs=0 Prettier :CocCommand prettier.formatFile
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

call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'flazz/vim-colorschemes'
  Plug 'crusoexia/vim-monokai'
  Plug 'sheerun/vim-polyglot' " on demandsyntax, indent, ftplugin etc
  Plug 'vim-scripts/SyntaxComplete'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'crusoexia/vim-javascript-lib'
  Plug 'tomasr/molokai'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-abolish'
  Plug 'itchyny/lightline.vim'
  Plug 'iamcco/mathjax-support-for-mkdp'
  " Plug 'iamcco/markdown-preview.nvim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'plasticboy/vim-markdown'
  Plug 'ekalinin/dockerfile.vim'
  Plug 'davidhalter/jedi-vim'
  Plug 'szymonmaszke/vimpyter'
  Plug 'neowit/vim-force.com'
  Plug 'majutsushi/tagbar'
  Plug 'isRuslan/vim-es6'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-vinegar'
  Plug 'chrisbra/colorizer'
  Plug 'mattn/emmet-vim'
  Plug 'rakr/vim-one'
  Plug 'romainl/flattened'
  Plug 'godlygeek/tabular'
  Plug 'gregsexton/MatchTag'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'tpope/vim-obsession'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'antoinemadec/coc-fzf'
  Plug 'jiangmiao/auto-pairs'
  Plug 'unblevable/quick-scope' " quick horizontal movements
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'JamshedVesuna/vim-markdown-preview'
  Plug 'vim-scripts/pmd.vim'
  Plug 'dense-analysis/ale'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'machakann/vim-highlightedyank'
  Plug 'junegunn/vim-peekaboo'
  Plug 'jparise/vim-graphql'

call plug#end()


" unblevable/quick-scope 
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T', '/', '?']

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let g:highlightedyank_highlight_duration = 300
"

" let g:ale_linters = {
" \   'apexcode': ['pmd'],
" \}


" FZF.vim now supports this command out of the box
:nnoremap <C-f>g :Rg -g '*.*'<space> ''<left>
" :nnoremap <C-f>g :CocCommand fzf-preview.ProjectGrep 
" :nnoremap <C-f>f :FZF<CR>
:nnoremap <C-f>f :CocCommand fzf-preview.ProjectFiles<CR>
" :nnoremap <C-f>b :Buffers<CR>
:nnoremap <C-f>b :CocCommand fzf-preview.Buffers<CR>
" :nnoremap <C-f>b :Buffers<CR>
:nnoremap <C-f>c :CocCommand fzf-preview.GitBranches<CR>

"
" so this code is no longer needed.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" coc.nvim config start
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" nnoremap <silent> <space>c  :<C-u>CocFzfListCommands<cr>
nnoremap <silent> <space>a  :CocDiagnostics<CR>
nnoremap <silent> <space>f  :CocFix<CR>
nnoremap <silent> <space>e  :CocExtensions<CR>
nnoremap <silent> <space>l  :CocLocation<CR>
nnoremap <silent> <space>o  :CocFzfListOutline<CR>
nnoremap <silent> <space>p  :CocListResume<CR>
nnoremap <silent> <space>s  :CocList symbols<CR>
nnoremap <silent> <space>S  :CocList services<CR>
nnoremap <silent> <space>rs :CocRestart<CR>
" coc.nvim config end

set colorcolumn=118
set encoding=utf8
set guioptions=
" set encoding=UTF-8
filetype plugin indent on
:set smartindent

set guifont=Hack\ Nerd\ Font:15
"

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
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
" let s:palette = g:lightline#colorscheme#PaperColor#palette
" let s:palette.tabline.tabsel = [ [ '#d0d0d0', '#5f8787', 252, 66, 'bold' ] ]
" unlet s:palette

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
let g:vim_markdown_fenced_languages = ['javascript=js', 'python=py', 'html=html', 'css=css']
let g:vim_markdown_folding_level = 2

" force.com
" let g:apex_backup_folder="/Users/johnmutuma/Documents/force-workspace/backup/"
" let g:apex_temp_folder="/tmp/apex/gvim-deployment"
" let g:apex_tooling_force_dot_com_path="/Users/johnmutuma/Documents/force-workspace/tooling-force.com-0.4.4.0.jar"
" let g:apex_properties_folder="/Users/johnmutuma/Documents/force-workspace/properties/"
