" Following lines added by drush vimrc-install on Thu, 17 Jan 2013 10:01:02 +0000.
set nocompatible
call pathogen#infect('/usr/share/drush/commands/vimrc/bundle')
call pathogen#infect('/home/juampy/.vim/bundle')
" End of vimrc-install additions.
" source $VIMRUNTIME/vimrc_example.vim

set tabstop=2
set shiftwidth=2
set expandtab
set number
set list
set smartindent
set autoindent smarttab
set smartcase
set ttyfast
set ignorecase
set textwidth=0
set wrapmargin=0
set nowrap
set tw=0
set encoding=utf-8
set fileformat=unix " endline setted to \n
set incsearch       " find the next match as we type the search
set hlsearch        " highlight searches by default
set history=500     " store commands, search and marks between vim executions
if v:version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000  " maximum number of changes that can be undoed
  set undoreload=10000 " maximum number lines to save for undo on a buffer reload
endif
" basic ui options
"set visualbell t_vb=
set shm=atIWswxrnmlf " message formats
set ruler
set showcmd          " show us the command we're typing
set showmode
set mouse=a
set background=dark    " your eyes will thank you

" directories for .swp files
set directory=~/.vim/swp//,/tmp//
set tags+=tags;/ " search recursively upwards for the tags file
set wildignore=**/cache/**,**/build/**,**/logs/**

syntax on           " enable syntax highlight
filetype on
filetype indent on
filetype plugin on

" spelling options
set spelllang=es_es,en_us

" Key maps
" ========
" cycle between buffers
map <C-Left> <ESC>:bprev!<CR>
map <C-Right> <ESC>:bnext!<CR>
