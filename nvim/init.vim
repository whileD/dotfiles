set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " TOML:
  let s:toml_dir = '~/.config/nvim/toml'
  call dein#load_toml(s:toml_dir.'/general.toml', { 'lazy':0 })
  call dein#load_toml(s:toml_dir.'/langi.toml', { 'lazy':0 })
  call dein#load_toml(s:toml_dir.'/lang.toml', { 'lazy':1 })

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
set updatetime=100
set cursorline
set ambiwidth=double
set signcolumn=yes

set clipboard+=unnamedplus

set sh=zsh

" Colorscheme
set background=dark
colorscheme gruvbox

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

" filetype --------------------
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
" autocmd FileType vue syntax sync fromstart

" Keybind --------------------
" Window
nnoremap <Space>h <C-w>h
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
nnoremap <Space>r <C-w>r
nnoremap <Space>o <C-w>o
" nnoremap <C-S-h> <C-w><
" nnoremap <C-S-j> <C-w>-
" nnoremap <C-S-k> <C-w>+
" nnoremap <C-S-l> <C-w>>
tnoremap <silent> <ESC> <C-\><C-n>

" Tab
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sb gT
for i in range(1, 9)
  execute 'nnoremap s'.i.' '.i.'gt'
endfor
