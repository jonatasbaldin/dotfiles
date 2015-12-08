" numbered lines
set number

" TAB got 4 spaces
" Python recommended PEP-0008
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

" esc to ii
imap ii <Esc>

" all md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" highlight code
syntax on
