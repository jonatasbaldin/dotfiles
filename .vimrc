" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'sheerun/vim-polyglot'

" numbered lines
set number

" Soft spaces
" Python recommended PEP-0008
autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
" HTML, 2 spaces
autocmd Filetype html,javascript,ruby,yaml setlocal ts=2 sw=2 sts=2 expandtab

" width of TAB is set to 4
set tabstop=4
" indents will have a width of 4
set shiftwidth=4
" number of collumns for a TAB
set softtabstop=4
" expand TABs to spaces
set expandtab


" Search features
" Incremental Search
set incsearch
" Case insensitive search
set ignorecase
" Highlight search
set hls

" shows info about current command
set showcmd 

" spell check for english
"set spell spelllang=en_us

" Maps
" save with CTRL-S
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" movement spli windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
imap <c-j> <Esc><c-w>j
imap <c-j> <Esc><c-w>k
imap <c-l> <Esc><c-w>l
imap <c-h> <Esc><c-w>h

" Remove all trailing whitespace by pressing F5
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Simple_commands_to_remove_unwanted_whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" esc to ii
imap ii <Esc>

" all md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" highlight code
syntax on

" swapfiles
set backupdir=/tmp//
set directory=/tmp//

" HARDCORE MODE
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Disable automatic comment
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Split resize
" Winsize
set winheight=30
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
" closes vim even if NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntastic on open file
let g:syntastic_check_on_open = 1

" synatstic python ignores
" E510 - more than 80 columns
" F823 - local variable ... referenced before assignment
let g:syntastic_python_flake8_post_args='--ignore=E501,F823'

" syntastic yaml (requires npm js-yaml)
let g:loaded_syntastic_yaml_yamllint_checker = 1

" toggle syntastic
map <silent> <F3> :SyntasticToggleMode<CR>

" YouCompleteMe Instruction after :PluginInstall (https://github.com/Valloric/YouCompleteMe)
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py
" and run :PluginInstall again
let g:ycm_autoclose_preview_window_after_insertion = 1

" More Vundle
call vundle#end()            " required
filetype plugin on    " required
