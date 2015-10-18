set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end() 
filetype plugin indent on

syntax enable
set number

set term=screen-256color
let g:solarized_termcolors=256
set background=dark
colorscheme solarized 

let mapleader = ","
map <leader>h :CtrlP<cr>
map <leader>p "*p

set backspace=indent,eol,start
set history=500
set ruler
set autoindent

let g:airline_powerline_fonts = 1
set laststatus=2
