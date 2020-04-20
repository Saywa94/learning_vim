"  ____ ____ _________ ____ ____ ____ ____ ____ 
"  ||M |||Y |||       |||V |||I |||M |||R |||C ||
"  ||__|||__|||_______|||__|||__|||__|||__|||__||
"  |/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|
" Config file for vim

" To automate vimplug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins using vim-plug manager
call plug#begin('~/.vim/plugged')
" Delcare the list of plugins here.
Plug 'junegunn/goyo.vim'
"""Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
"""Plug 'mcmartelle/vim-monokai-bold'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
call plug#end()

" vim-markdown plugin settings:
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1


" The Basics
let mapleader = ','
set langmenu=en_US.UTF-8
language en
set encoding=utf-8
set pastetoggle=<F2>
set nocompatible
set ruler
set number
set mouse=a
set visualbell
set nobackup
set scrolloff=50

" Make it pretty
syntax enable
filetype plugin indent on
color darkblue 

" settings to make coc-vim better
set updatetime=300
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Activate all the handy windows key-bindings
source $VIMRUNTIME/mswin.vim
behave mswin

" Configuration de l'affichage de la date et de la position dans le fichier
"""set rulerformat=%27(%{strftime('%a\ %e\ %b\ %I:%M\ %p')}\ %2l,%-2(%c%V%)\ %P%)i

" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally

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
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10


" ### Searching ###
" Ignore case when searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Show matching brackets when text indicator is over them
set showmatch 
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Ajoute les nouvelles fenêtres en dessous ou à droite
set splitbelow
set splitright

" ## Tabs
" Raccourcis claviers pour les Tabs
map <C-t>  :tabnew <CR>
nmap <C-Right> :tabnext <CR>
nmap <C-Left>  :tabprevious <CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-g> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open the NERDTree on the path of the file in the current buffer.
nnoremap t :NERDTree %:p:h

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
" show hidden files in NERDTree
""let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
