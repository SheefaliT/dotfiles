call pathogen#runtime_append_all_bundles()

set nocompatible

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Case insensitive searches unless search contains capitals
set ignorecase
set smartcase

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

syntax on

" Use correct indentation
filetype plugin indent on



" GRB: highlighting search"
set hls

" GRB: clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

set autoindent
set smartindent
set nowrap
set number
set ruler
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set textwidth=80
set numberwidth=5

set autoread
set autowrite

set laststatus=2

" Note the trailing space.
" set wrap
set showbreak=↪\ 
set linebreak

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


" :W should do the same thing as :w
command! W :w

" http://vimcasts.org/episodes/show-invisibles/
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬


" Highlight anything over 80 characters
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
set colorcolumn=81

set winwidth=86
" GBH: We have to have a winheight bigger than we want to set winminheight.
" But if we set winheight to be huge before winminheight, the winminheight set
" will fail.
set winheight=5
set winminheight=5
set winheight=999

if has("gui_running")
  " Turn off the toolbar
  set guioptions-=T
  " Set font and size
  set guifont=Inconsolata:h18
endif

" Use a light background – use a real editor at some point
set t_Co=256
set background=light
colorscheme solarized

" Highlight unwanted whitespaces
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/


set cursorline

set scrolloff=3

set wildmode=longest
set wildmenu

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Please handle wrapped lines by default.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

augroup lastline
  au!

  " Jump to last cursor position unless it's invalid or in an event handler
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

augroup cursorline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Configure the command-t window height
let g:CommandTMinHeight=5
let g:CommandTMaxHeight=15

" Configure taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_WinHeight=40
let Tlist_Use_Horiz_Window=1
let Tlist_Close_On_Select=1
let Tlist_GainFocus_On_ToggleOpen=1

nnoremap ,t :TlistToggle<cr>
nnoremap ,r :TlistAddFilesRecursive .<cr>
