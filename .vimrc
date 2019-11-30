" Config file for vim

" Plugins using vim-plug manager
call plug#begin('~/.vim/plugged')
" Delcare the list of plugins here.
Plug 'junegunn/goyo.vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
call plug#end()



set encoding=utf-8

set nocompatible
set number

" syntax highlight
syntax enable
filetype plugin indent on

" Activate all the handy windows key-bindings
source $VIMRUNTIME/mswin.vim
behave mswin

" Display line and column number in the bottom ruler
set ruler

" Set theme
color darkblue 

" Turn sounds off
set visualbell

" Set visual completion
set wildmenu
set wildmode=full

" Set linebreak and line wrapping + line break on 500 chrtrs
set wrap
set linebreak
set tw=500

" Set tabs to 4 characters
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" Enabled folding on indent level. That way it works on any code & html, xml, etc. 
" Setting foldlevelstart ensures that for newly opened files folds are open
" unless they are 10 levels deep.
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10

" Open the NERDTree on the path of the file in the current buffer.
nnoremap t :NERDTree %:p:h

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" to avoid backup files
set nobackup

