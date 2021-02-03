" enable modern Vim features not compatible with Vi spec
set nocompatible

let mapleader=","       " leader is comma

" Plugins installed by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'rafi/awesome-vim-colorschemes'

Plugin 'justinmk/vim-sneak'

" All of your Plugins must be added before the following line
call vundle#end()       " required

" fzf plugins install by vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
call plug#end()

" map fzf's Files command to Ctrl + p
nnoremap <c-p> :Files

" Fixes scheme doesn't work in tmux
set background=dark
set t_Co=256

colorscheme gruvbox

filetype plugin indent on
syntax on

" customize binding
inoremap jk <Esc>
nnoremap Y y$
inoremap <Esc> <Nop>    " force to make esc do nothing

" move vertically by visual line
nnoremap j gj
nnoremap k gk

set tabstop=2          " number of visual spaces per TAB
set softtabstop=2      " number of spaces in tab when editing
set expandtab          " tabs are spaces
set showcmd            " show command in bottom bar
set cursorline         " highlight current line
set wildmenu           " visual autocomplete  for coammdn menu
set lazyredraw         " redraw only when necessary
set showmatch          " hight matching [{()}]
set incsearch          " search as characters are entered
set hlsearch           " hight matches
set ignorecase         " case insensitivity pattern matching
set smartcase          " overrides ignorecase if pattern contains upcase
set number relativenumber " turn on relative number

" keep search searchs at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" hightlight last inserted text
nnoremap gV `[v`]

" select all texts
nnoremap vA ggVG

" switch between tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" easily create a new tab
nnoremap <leader>tN :tabnew<CR>

" easily close a new tab
nnoremap <leader>tc :tabclose<CR>

" easily move a new tab
nnoremap <leader>tm :tabmove<CR>

" easily go to next tab
nnoremap <leader>tn :tabnext<CR>

" easily go to previous tab
nnoremap <leader>tp :tabprevious<CR>

" quickly open .vimrc in new tab
nnoremap <leader>v :tabedit ~/.vimrc<CR>

" allow cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" sneak configs
let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" remap so I can use , and ; with f and t
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" Cool prompts
" let g:sneak#prompt = '🕵'
let g:sneak#prompt = '🔎'

" I like quickscope better for this since it keeps me in the scope of a single line
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T

" when entering insert mode, turn off relative line number and leave absolute
" on
augroup numbertoggler
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" toogle paste with ,p
function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction

map <leader>p :call TogglePaste()<cr>
