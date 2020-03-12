
" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall                                                                                                      
endif                                                                                                                                 

call plug#begin('~/.config/nvim/plugged')
" Google
Plug 'google/vim-jsonnet'

" plugins
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'

" Theme
Plug 'felixhummel/setcolors.vim'
Plug 'joshdick/onedark.vim'

" Python
Plug 'vim-scripts/indentpython.vim'
" Plug 'nvie/vim-flake8'
Plug 'integralist/vim-mypy'

" React/JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
" for ale
Plug 'skywind3000/asyncrun.vim'

" Vue.js
Plug 'posva/vim-vue'

" CSS
Plug 'ap/vim-css-color'


"deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()

" deoplete req
let g:python3_host_prog  = '/usr/local/bin/python3'

" JavaScript
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:xml_syntax_folding = 1


" ale config
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let b:ale_linters = ['flake8', 'pylint']
" run eslint/prettier asynchronously
autocmd BufWritePost *.js,*.jsx AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
autocmd BufWritePost *.vue AsyncRun -post=checktime ./node_modules/.bin/eslint --ext js,vue --fix %

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd WinEnter * if exists('b:NERDTree') | execute 'normal R' | endif
" P.S: Better to include it into an augroup

" pretty code
let python_highlight_all=1
syntax on
set background=dark
set t_Co=256
"set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme onedark 
let g:onedark_termcolors=256
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" various
set nu
"highlight LineNr ctermfg=magenta ctermbg=black
set clipboard=unnamed
" searching
set hlsearch!
nnoremap <C-h> :set hlsearch!<CR>

let g:SimpylFold_docstring_preview=1
let g:deoplete#enable_at_startup = 1
filetype plugin indent on

"let g:pymcd_powerline="py3"
set rtp+=/home/bbtroot/.local/lib/python2.7/site-packages/powerline

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py,*.sh set tabstop=4 
      \|set softtabstop=4 
      \|set shiftwidth=4  
      \|set textwidth=790  
      \|set expandtab  
      \|set autoindent  
      \|set fileformat=unix

au BufNewFile,BufRead *.js,*.jsx,*.html,*.css,*.rb,*.vue,*.jbuilder,*.erb,*.yml,*.yaml set tabstop=2
      \|set expandtab
      \|set softtabstop=2
      \|set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" vimux 
" Prompt for a command to run
map rp :PromptVimTmuxCommand

" Run last command executed by RunVimTmuxCommand
map rl :RunLastVimTmuxCommand

" Inspect runner pane
map ri :InspectVimTmuxRunner

" Close all other tmux panes in current window
map rx :CloseVimTmuxPanes

" Interrupt any command running in the runner pane
map rs :InterruptVimTmuxRunner

" leader remap
let mapleader = ","

set mouse=a
" and
set mouse=
