call pathogen#infect()
call pathogen#runtime_append_all_bundles()

syntax enable
set background=dark
colorscheme solarized

filetype plugin on
filetype indent on

set number
set ruler

set splitright
set autoindent
set expandtab
set smarttab
set nosmartindent
set si
set wrap
set showmatch

set tabstop=2
set shiftwidth=2
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set title
set visualbell
set noerrorbells

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

au BufNewFile,BufRead *.html set syntax=htmljinja
au BufNewFile,BufRead *.hbs set syntax=htmljinja


" Strip whitespace in python files
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e


" Flake 8 on write
"autocmd BufWritePost *.py call Flake8()

nmap nt :NERDTreeToggle<CR>
nmap gd :GitGutterToggle<CR>

" Paste mode
set pastetoggle=<F5>

" Omnicompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

set completeopt-=preview

" If you forget sudo
cmap w!! w !sudo tee > /dev/null %

" SHITTY
autocmd FileType python set completeopt-=preview
autocmd FileType go set completeopt-=preview

set backspace=2 " make backspace work like most other apps
