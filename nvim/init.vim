if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " TOML:
  let s:toml_dir = '~/.config/nvim/toml'
  call dein#load_toml(s:toml_dir.'/main.toml', { 'lazy':0 })

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

set number
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set updatetime=500
set cursorline
colorscheme onedark
