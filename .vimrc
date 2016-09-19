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
Plugin 'davidhalter/jedi-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'FooSoft/vim-argwrap'
Plugin 'honza/vim-snippets' " Snippets separated from the engine
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'SirVer/ultisnips' " Snippets engine
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-expand-region'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'


" -----------------------------------------------------------------------------
" Identations
" -----------------------------------------------------------------------------
" Python PEP8
autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
" Python for plugins
autocmd FileType py set autoindent
autocmd FileType py set smartindent
" Another languages with 2 spaces
autocmd Filetype html,javascript,ruby,yaml setlocal ts=2 sw=2 sts=2 expandtab
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


" -----------------------------------------------------------------------------
" Usability and visual
" -----------------------------------------------------------------------------
" Show line numbers
set number
" Show relative line numbers
set relativenumber
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
" Desert colorscheme <3
colorscheme desert
" Backspace always delete, even if not typed during the insert session
set backspace=indent,eol,start
" Vim clipboard goes to operating system clipboard
set clipboard=unnamed
" Autoload tags file
set tags=./tags;/


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
" Plugin specifc
" -----------------------------------------------------------------------------
" -----------------------------------------------------------------------------
" NERDTree
" -----------------------------------------------------------------------------
" Toglle NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
" Closes vim even if NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NERDTree on vim startup 
autocmd vimenter * NERDTree
" Focus on the file instead of NERDTree on file open
autocmd vimenter * wincmd p
" Exclude files/dirs from NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']


" -----------------------------------------------------------------------------
" Syntastic
" -----------------------------------------------------------------------------
" Enable Syntastic when opening file
let g:syntastic_check_on_open = 1
" Syntastic flake8 excludes (need flake8)
let g:syntastic_python_flake8_post_args='--ignore=F823'
" Syntastic YAML (npm install js-yaml -g)
let g:loaded_syntastic_yaml_yamllint_checker = 1
" Syntastic HTML (apt-get install tidy)
let g:syntastic_html_tidy_exec = '/usr/bin/tidy'
" Syntastic JS (requires npm install jshint -g)
let g:syntastic_javascript_checkers = ['jshint']
" Toggle Syntastic execution
map <silent> <F3> :SyntasticToggleMode<CR>


" -----------------------------------------------------------------------------
" YouCompleteMe
" -----------------------------------------------------------------------------
" After running :PluginInstall, run these commands:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py
" And run :PluginInstall again
" Close preview windows after the text was completed
let g:ycm_autoclose_preview_window_after_insertion = 1


" -----------------------------------------------------------------------------
" ArgWrap
" -----------------------------------------------------------------------------
" Map to execute ArgWrap
nnoremap <silent> <leader>a :ArgWrap<CR>


" -----------------------------------------------------------------------------
" UltiSnips
" -----------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" Expand snippet
let g:UltiSnipsExpandTrigger="<c-x>"
" Jump to next snippet statment
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" Jump to previous snippet statment
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" -----------------------------------------------------------------------------
" Airline
" -----------------------------------------------------------------------------
" Airline color with tmux
set t_Co=256
" Airline theme
let g:airline_theme='bubblegum'


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


" -----------------------------------------------------------------------------
" Tagbar
" -----------------------------------------------------------------------------
" Shortcut to open Tagbar
nmap <F8> :TagbarToggle<CR>


" -----------------------------------------------------------------------------
" Vundle end
" -----------------------------------------------------------------------------
" More Vundle
call vundle#end()            " required
filetype plugin on    " required
