" dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=/Users/michael.findlater/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/michael.findlater/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/michael.findlater/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('wsdjeg/dein-ui.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('scrooloose/nerdtree')
call dein#add('tmhedberg/SimpylFold')
call dein#add('itchyny/lightline.vim')
call dein#add('fatih/vim-go')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('jjo/vim-cue')

" Themes
call dein#add('joshdick/onedark.vim')


" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" End dein Scripts-------------------------

" Visual
set background=dark
colorscheme onedark

" Formatting
set softtabstop=0 noexpandtab  " default
set tabstop=2
set shiftwidth=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set autoindent
set fileformat=unix
set expandtab
set textwidth=790
au BufNewFile,BufRead *.py set tabstop=4
      \|set softtabstop=4
      \|set shiftwidth=4

au BufNewFile,BufRead *.cue,*.sh set tabstop=4
      \|set autoindent
      \|set noexpandtab
      \|set tabstop=4
      \|set shiftwidth=4

" Misc
set clipboard=unnamed
set number
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" go
map <F9> :GoBuild<CR>
map <F10> :GoRun<CR>

let NERDTreeShowHidden=1
autocmd WinEnter * if exists('b:NERDTree') | execute 'normal R' | endif
" P.S: Better to include it into an augroup

" SimplyFold
let g:SimpylFold_docstring_preview=1

" Lightline
call dein#add('itchyny/lightline.vim')
