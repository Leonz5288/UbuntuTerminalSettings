set nocompatible              " use Vim defaults instead of Vi defaults

" appearances
syntax enable
set number
" set relativenumber
set nowrap
set cursorline
set ruler
set showtabline=2             " always show buffer tabs
set noshowmode                " no --INSERT-- down below
set cmdheight=1
set laststatus=0
set termguicolors
set background=dark
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" whitespaces
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent

" searching
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

" preferences
set mouse=a
set noerrorbells
set shortmess+=c
set undodir=~/.vim/undodir      " cross section undo
set undofile
set scrolloff=8                 " min #lines above/below current screen"
set foldcolumn=0
" set foldmethod=syntax
" set clipboard=unnamedplus       " copy/paste with everything else

" nerd
set hidden
set nobackup                    " recommended by coc
set nowritebackup               " recommended by coc
set splitbelow
set splitright
set iskeyword+=-                " treat dash-word as a word object
set t_Co=256
set encoding=utf-8
set updatetime=300
filetype off                    " native-vim filetype detection; need to be off for vundle




" here goes plugins
let $MYVIMRC='$HOME/.vimrc'     " TODO: change vimdir, .vimrc path?

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()     " alternative: pass a path
Plugin 'VundleVim/Vundle.vim'

" Autocompletes
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'ajh17/VimCompletesMe'

" Colorscheme & syntax
Plugin 'nanotech/jellybeans.vim'                        " beautiful vim theme
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'                        " status line & other chunks
Plugin 'vim-airline/vim-airline-themes'                 " exotic themes
Plugin 'shmup/vim-sql-syntax'                           " sql syntax highlight
Plugin 'sheerun/vim-polyglot'                           " syntax highlight for py?
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
" Plugin 'flazz/vim-colorschemes'                         " collection of colorschemes
Plugin 'Gruvbox-community/gruvbox'                      " gruvbox

" Utilitarian
Plugin 'scrooloose/nerdcommenter'                       " comment with style
Plugin 'scrooloose/nerdtree'                            " a tree explorer
Plugin 'mbbill/undotree'
Plugin 'rking/ag.vim'                                   " text search
Plugin 'junegunn/fzf', {'do': { -> fzf#install()}}      " fuzzy find
Plugin 'junegunn/fzf.vim'                               " fuzzy find
Plugin 'jiangmiao/auto-pairs'                           " close ()[]{} for me
" Plugin 'yuttie/comfortable-motion.vim'                  " scrolling feels
" Plugin 'ThePrimeagen/vim-be-good'

" new puppies
Plugin 'iamcco/markdown-preview.nvim'                    " preview in browser
Plugin 'voldikss/vim-floaterm'
Plugin 'tpope/vim-surround'                             " change surrounds e.g.: ysiw[  ds'  cs[(
Plugin 'tpope/vim-fugitive'                             " vim git cmd
Plugin 'git://git.wincent.com/command-t.git'            " fast file navigation for VIM
Plugin 'wesQ3/vim-windowswap'                           " swap split panes by marking then swapping

" new js, react helpers
" Plugin 'styled-components/vim-styled-components', {'branch': 'main'}
" Plugin 'jparise/vim-graphql'
" Plugin 'pangloss/vim-javascript'
" Plugin 'leafgarland/typescript-vim'


call vundle#end()            " required
filetype plugin indent on    " required


" colorscheme settings
syntax on
set t_Co=256
colorscheme gruvbox
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" checks if terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" autocmd vimenter * hi Comment cterm=italic term=italic    " FIXME: not italic on startup
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    " autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    " autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
  augroup END
endif

" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_invert_selection=0

" let g:jellybeans_overrides = {'background': { 'guibg': '121212' }}
" let g:jellybeans_use_term_italics=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#tabline#show_tabs = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='onehalflight'

" Kite autocompleteness settings.
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set belloff+=ctrlg
let g:kite_tab_complete=1
let g:kite_supported_languages=['*']

" Nerd Commenter Settings
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }
let g:NERDTrimTrailingWhitespace = 1


" FZF
let g:fzf_layout = {'window': {'width':0.8, 'height':0.8}}
let $FZF_DEFAULT_OPTS='--reverse'

" windowsawp
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>


" rtp
let &rtp .= ',' . expand('<sfile>p:h')
filetype plugin indent on







" REMAP
let mapleader = "\<Space>"

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" split sizing
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>_ :resize -5<CR>
nnoremap <C-j> :resize -5<CR>                   " more resizing
nnoremap <C-k> :resize +5<CR>
nnoremap <C-h> :vertical resize -5<CR>
nnoremap <C-l> :vertical resize +5<CR>
nnoremap <C-Down> :resize -3<CR>
nnoremap <C-Up> :resize +3<CR>
nnoremap <C-Left> :vertical resize -3<CR>
nnoremap <C-Right> :vertical resize +3<CR>


" split navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Right> :wincmd l<CR>

" split rotation
nnoremap <leader>rv <C-w>t<C-w>L
nnoremap <leader>rh <C-w>t<C-w>H


" tabs navigation
nnoremap <C-n> :bn<CR>

" copy paste
noremap <leader>y "*y   " prime selection 
noremap <leader>p "*p   " prime selection

" folding
" nmap <silent> FF :foldclose<CR>
" nmap <silent> ff :foldopen<CR>

" rigidity
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" lazyness
"
nnoremap <leader>so :source ~/.vimrc<CR>
nnoremap <leader>n  :noh<CR>
nnoremap <leader>u  :set relativenumber!<CR>
nnoremap <leader>o  :browse oldfiles<CR>
nnoremap <leader>z  :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fb :Buffer<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fc :Blines<CR>
nnoremap <leader>tn :FloatermNew<CR>
nnoremap <leader>ut :UndotreeShow<CR>
nnoremap <leader>d  :NERDTree<CR> :vertical resize 30<CR>
nnoremap <leader>co 1z=
nnoremap <leader>sp :set spell!<CR>
nnoremap <leader>wr :set wrap!<CR>


" (no)hlsearch by pressing enter
let g:highlighting = 0
function! Highlighting()
    if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
        let g:highlighting = 0
        return ":silent nohlsearch\<CR>"
    endif
    let @/ = '\<'.expand('<cword>').'\>'
    let g:highlighting = 1
    return ":silent set hlsearch\<CR>"
endfunction
" nnoremap <silent> <expr> <CR> Highlighting()

" Highlight TODO, FIXME, NOTE, etc.
if has('autocmd') && v:version > 701
    augroup todo
        autocmd!
        autocmd Syntax * call matchadd(
                    \ 'Debug',
                    \ '\v\W\zs<(NOTE|INFO|IDEA|TODO|FIXME|CHANGED|XXX|BUG|HACK|TRICKY)>'
                    \ )
    augroup END
endif
