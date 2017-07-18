" -----------------------------------------------------------------------------
" Vundle start
" -----------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" -----------------------------------------------------------------------------
" Plugin list
" -----------------------------------------------------------------------------
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FooSoft/vim-argwrap'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'auto-pairs'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'kylef/apiblueprint.vim'
Plugin 'fatih/vim-go'
Plugin 'dracula/vim'

" -----------------------------------------------------------------------------
" Identations
" -----------------------------------------------------------------------------
" Python PEP8
autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
" Python for plugins
autocmd FileType py set autoindent
autocmd FileType py set smartindent
" Another languages with 2 spaces
autocmd Filetype html,javascript,ruby,yaml,markdown setlocal ts=2 sw=2 sts=2 expandtab
" Treat .md files as markdown type
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Treat .md files as markdown type
autocmd BufNewFile,BufReadPost *.apib set filetype=apiblueprint
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
" Enable file save with CRTL+S
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
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
" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
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
" Esc mapping
inoremap ii <ESC>


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
" Backspace always delete, even if not typed during the insert session
set backspace=indent,eol,start
" Vim clipboard goes to operating system clipboard
" set clipboard=unnamed
" Autoload tags file
set tags=./tags;/
" Toggle paste mode with F2
set pastetoggle=<F6>
" Show the status line all the time
set laststatus=2
" Set terminal color
set t_Co=256
" Set theme
color dracula



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
set updatetime=250
" Use \d on top of a word to look it up in Dictionary.app
nmap <silent> <Leader>d :!open dict://<cword><CR><CR>
" Set spell check on markdown files
autocmd Filetype markdown setlocal spell spelllang=en_us


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
let g:ctrlp_custom_ignore = '\v[\/](__pycache__)|(\.(swp|git|pyc))$'
" Map CtrlPTag <3
nnoremap <leader>. :CtrlPTag<cr>


" Vundle end
" -----------------------------------------------------------------------------
" More Vundle
call vundle#end()            " required
filetype plugin on    " required
