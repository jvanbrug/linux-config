" Requires Pathogen (Vim package manager):
"   https://github.com/tpope/vim-pathogen
execute pathogen#infect()

filetype plugin indent on
syntax on

" Show existing tab with 4 spaces width
set tabstop=4
" When indenting with `>`, use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set relativenumber
set number

set ruler

imap jj <Esc>
