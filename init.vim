" -----------------------------------------------------------------------------
" Plug start
" -----------------------------------------------------------------------------
 call plug#begin('~/.local/share/nvim/plugged')


" -----------------------------------------------------------------------------
" Plugin list
" -----------------------------------------------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'


" -----------------------------------------------------------------------------
" Identations
" -----------------------------------------------------------------------------
" Languages with 4 spaces
autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
" Languages with 2 spaces
autocmd Filetype html,javascript,ruby,yaml,markdown setlocal ts=2 sw=2 sts=2 expandtab

" Treat .md files as markdown type
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on


" -----------------------------------------------------------------------------
" Default Identation
" -----------------------------------------------------------------------------
" Four spaces, with expanded tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------
" Leader key to comma
let mapleader=","
" Easy to movement between split windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
imap <c-j> <Esc><c-w>j
imap <c-j> <Esc><c-w>k
imap <c-l> <Esc><c-w>l
imap <c-h> <Esc><c-w>h
" Open splits more naturally
set splitbelow
set splitright
" Disable keyboard arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
" Reload .vimrc
map <Leader>v :so $MYVIMRC<cr>


" -----------------------------------------------------------------------------
" Usability and visual
" -----------------------------------------------------------------------------
" Show line numbers
set number
" Better autocomplete menu
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Enable syntax highlighting
syntax on
" Set default slipt lines
set winheight=30
" Folding on identing level
set foldmethod=indent
" Always load files with opened folds
set foldlevel=99
" Toggle fold
nnoremap <space> za
" Autoload tags file
set tags=./.tags;/
" Show the status line all the time
set laststatus=2
" Set terminal color
set t_Co=256
" Set theme
color gruvbox
" 
set background=dark
"
set termguicolors
" Remove extra line below status line
set cmdheight=1
"
hi Normal ctermbg=NONE guibg=NONE
"
:set nocursorcolumn
:set nocursorline
:set norelativenumber
:syntax sync minlines=256



" -----------------------------------------------------------------------------
" Search features
" -----------------------------------------------------------------------------
" Incremental Search
set incsearch
" Case insensitive search
set ignorecase
" Highlight search
set hls
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


" -----------------------------------------------------------------------------
" Miscellaneous
" -----------------------------------------------------------------------------
" Set swap files directory
set backupdir=/tmp//
set directory=/tmp//
" Nice updatetime
set updatetime=100


" -----------------------------------------------------------------------------
" Automatically toggle psate on Insert mode when pasting
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
" -----------------------------------------------------------------------------
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


" -----------------------------------------------------------------------------
" Plugin specifc
" -----------------------------------------------------------------------------
" -----------------------------------------------------------------------------
" ArgWrap
" -----------------------------------------------------------------------------
" Map to execute ArgWrap
nnoremap <silent> <leader>a :ArgWrap<CR>
" Add tail comma
let g:argwrap_tail_comma = 1


" -----------------------------------------------------------------------------
" CtrlP
" -----------------------------------------------------------------------------
" Shortcut to open the fuzzer
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Custom file listing
let g:ctrlp_user_command = 'find %s -type f'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Ignore dirs and files
let g:ctrlp_custom_ignore = '\v[\/](__pycache__)|(node_modules)|(\.(swp|git|pyc))$'


" -----------------------------------------------------------------------------
" NerdTRee
" -----------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
map <leader>m :NERDTreeFocus<CR>
let NERDTreeIgnore = ['\.pyc$', '\.*dist-info$', '__pycache__']


" -----------------------------------------------------------------------------
" vim-multiple-cursor
" -----------------------------------------------------------------------------
nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>


" -----------------------------------------------------------------------------
" ale
" -----------------------------------------------------------------------------
" Just use the explicit linters below
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['flake8'],
\}
" List of fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" Custom error message
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'



" -----------------------------------------------------------------------------
" vim-go
" -----------------------------------------------------------------------------
let g:go_fmt_command = "goimports"


" Plug end
call plug#end()
