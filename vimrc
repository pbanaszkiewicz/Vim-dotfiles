runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags() "perhaps ougth to be run only once


" ### BASIC
filetype on
set nocompatible " explicitly get out of vi-compatible mode
set noexrc 	     " don't use local version of .(g)vimrc, .exrc
set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor 
"             |||||||      between joined lines
"             |||||||+-- When a new match is created (showmatch) 
"             ||||||      pause for .5
"             ||||||+-- Set buffer options when entering the 
"             |||||      buffer
"             |||||+-- :write command updates current file name
"             ||||+-- Automatically add <CR> to the last line 
"             |||      when using :@r
"             |||+-- Searching continues at the end of the match 
"             ||      at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name

filetype plugin indent on      " load filetype plugins/indent settings
set autochdir                  " always switch to the current file directory
set backspace=indent,eol,start " make backspace a more flexible
set nobackup                   " not sure if it still works
set fileformat=unix
set hidden                     " you can change buffers without saving
set mouse=a                    " use mouse everywhere
set noerrorbells               " don't make noisy sounds
set wrap linebreak textwidth=79 " wrap lines at convenient points
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"             | | | | | | | | |
"             | | | | | | | | +-- "]" Insert and Replace
"             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
"             | | | | | +-- <Right> Normal and Visual
"             | | | | +-- <Left> Normal and Visual
"             | | | +-- "l" Normal and Visual (not recommended)
"             | | +-- "h" Normal and Visual (not recommended)
"             | +-- <Space> Normal and Visual
"             +-- <BS> Normal and Visual
set formatoptions=qrn1

" settings below make VIM similar to textmate
"set list
"set listchars=tab:▸\ 

set colorcolumn=80            " you see that fancy column on the right?
set wildmenu                  " turn on command line completion wild style
set wildignore=*.dll,*.o,*.obj,*.bak,*.pyc
set wildmode=list:longest     " turn on wild mode huge list
set lazyredraw                " Don't redraw screen during macros
set ttyfast                   " Improves redrawing for newer computers


" ### LANGUAGE, ENCODING
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set langmenu=en


" ### UI, GUI
"set cursorcolumn   " highlight current column
set cursorline     " highlight current line
set incsearch      " incremental search
" let's get good regex syntax working
" now you don't have to use \v in regex search anymore
"nnoremap / /\v
"vnoremap / /\v
set ignorecase      " insensitive case search 
set smartcase       " insensitive case search 
set gdefault        " on search-replace, don't need to specify '/g'
set laststatus=2    " always show the status line
set nohlsearch      " do not highlight searched for phrases
set nostartofline   " leave my cursor where it was
set novisualbell    " don't blink
set report=0        " tell us when anything changed via :…
set ruler           " always show current positions along the bottom
set scrolloff=4     " keep 10 lines (top/bottom) for scope
                    " 8 for top+bottom, 2 for status and input
set shortmess=aOstT " shortens messages to avoid 'press a key'
set showcmd         " show the command being typed
set history=1000    " save lots of command line history
set showmode        " show vim's mode (insert, visual, etc)
set showmatch       " show matching brackets
set statusline=%F%m%r%h%w[%LL]%y%=%{fugitive#statusline()}[%p%%][%l,%v]
"              | | | | |  |   |   |                        |     |  |
"              | | | | |  |   |   |                        |     |  +-- current column
"              | | | | |  |   |   |                        |     +-- current line
"              | | | | |  |   |   |                        +-- current % of the file
"              | | | | |  |   |   +-- Fugitive GIT branch
"              | | | | |  |   +-- current syntax in square brackets
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer
set guioptions-=T " no toolbar in GVIM
set guioptions-=r " no scrollbars in GVIM
set guioptions-=R " no scrollbars in GVIM
set guioptions-=l " no scrollbars in GVIM
set guioptions-=L " no scrollbars in GVIM
set guioptions-=b " no scrollbars in GVIM


" ### OMNI COMPLETION - disabled, because for Python ropevim works the best
"set completeopt=longest,menuone,preview
"set iskeyword+=.
"set completeopt=longest,menuone
"let g:SuperTabDefaultCompletionType="context"
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType html set ft=htmldjango " syntax highlight for HTML files
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" ### LESS CSS files
au BufNewFile,BufRead *.less set filetype=less


" ### PYTHON PEP8 settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
let python_highlight_all=1
let python_highlight_numbers=1
let python_highlight_exceptions=1
" PEP8 plugin file validation
" by default: \8
let g:pep8_map='<leader>8'


" ### SPELLING
ia teh the
ia htis this
ia tihs this
ia thsi this
ia slef self
ia sefl self
ia funciton function
ia funtion function
ia fucntion function
ia retunr return
ia reutrn return


" ### DESIGN, APPEARANCE, SCHEMES
syntax on
set guifont=Monaco\ 9
set number
set background=dark
colorscheme wombat
"colorscheme darkblue2
"colorscheme darkerdesert


" ### LAST CURSOR POSITION
" When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


" ### FOLDING
set foldmethod=indent   " fold based on indent
set foldnestmax=5       " deepest fold is 5 levels
set nofoldenable        " don't fold by default
" folding shortcuts:


" ### KEYBOARD MAPPING
" TODO: watch out for 'autoclose' plugin
" disable arrows
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
" you'll move easier in long, wrapped lines
nnoremap j gj
nnoremap k gk
" make F1 working as ESCAPE (guess it's important on laptops)
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>
" quickly reselect pasted text
nnoremap <leader>v V`]
" CTRL+{h,j,k,l} for switching between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" semicolon is faster to press than colon
nnoremap ; :


" ### ADDONS
"     ### NERDTREE
"     <F3> to activate
nnoremap <silent> <F3> :NERDTreeToggle<CR>
let NERDTreeWinSize=37


"     ### TAGLIST
"     <F4> to activate
let Tlist_Compact_Format=1 " show small menu
let Tlist_Ctags_Cmd='ctags' " location of ctags
let Tlist_Enable_Fold_Column=0 " do show folding tree
let Tlist_Exist_OnlyWindow=1 " if you're the last, kill yourself
let Tlist_File_Fold_Auto_Close=0 " fold closed other trees
let Tlist_Sort_Type='name' " order by
let Tlist_Use_Right_Window=1 " split to the right side of the screen
let Tlist_WinWidth=37 " 37 cols wide
nnoremap <silent> <F4> :TlistToggle<CR>


"     ### LATEX
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"


"     ### TASKLIST
"     \td to activate
map <leader>td <Plug>TaskList


"     ### GUNDO
"     \g to activate
map <leader>g :GundoToggle<CR>


"     ### PYFLAKES
"     active by default
let g:pyflakes_use_quickfix=0


"     ### ROPE
"     \j   jump to definition
"     \r   rename (simple refactoring)
"     <C-o>  intelisense / completion
let ropevim_vim_completion=1
let ropevim_extended_complete=1
let ropevim_goto_def_newwin=1     " go to definition in new buffer
noremap <leader>j :RopeGotoDefinition<CR>
noremap <leader>r :RopeRename<CR>
inoremap <C-o> <C-R>=RopeCodeAssistInsertMode()<CR>


"     ### ACK
"     \a to activate
nmap <leader>a <Esc>:Ack!<CR>


"     ### MAKEGREEN
"     \dt to activate
"     Django testing (default, ie. no nose-tests)
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>


"     ### SNIPMATE
"     soooo powerful. See video below:
"     http://vimeo.com/3535418


"     ### SURROUND
"     this HARMFULLY POWERFULLY AWESOME plugin is a total MUST-HAVE
"     and MUST-LEARN-HOW-TO-USE
"     https://github.com/tpope/vim-surround


"     ### COMMAND-T
"     \t to activate


"     ### PYDOC
"     e.g.
"     :Pydoc math
"     :PydocSearch permutations


"     ### PYTEST.VIM
"     simply write
"     :Pytest <TAB>
"     and you'll see all the possible actions

"     ### CLOSETAG
au BufNewFile,BufRead *.html let g:closetag_html_style=1
