set hidden
set visualbell
set wildmenu
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autowrite
set clipboard=unnamed
set laststatus=2
set noshowmode
set nu
set list
set listchars=tab:▸\ ,eol:¬
set noswapfile
set hlsearch 
set splitright
set completeopt-=preview
"se mouse+=a
"
"set cmdheight=2
set updatetime=300
set shortmess+=c

set rtp+=$GOROOT/misc/vim
filetype off
filetype plugin indent on
syntax on

vmap y y`]

xnoremap p "_dP

autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType c set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType go set tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab

autocmd FileType go nnoremap map <f3> :GoDef<CR>
autocmd FileType go nnoremap map <f2> :GoDoc<CR>
autocmd FileType go nnoremap map <f4> :GoDecls<CR>
autocmd FileType go nnoremap map <f5> :GoRun<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>c  <Plug>(go-coverage)

" coc binds
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <leader>rn <Plug>(coc-rename)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"nnoremap <silent> <C-p> :FZF<CR>
nnoremap <leader>f gqip

:tnoremap <Esc> <C-\><C-n>

"nnoremap <Tab> :bnext<CR> nnoremap <S-Tab> :bprevious<CR> nnoremap <C-X> :bdelete<CR>

autocmd FileType python nnoremap <buffer> <F5> :exec '!clear; python' shellescape(@%, 1)<cr>


" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mtth/scratch.vim'
Plug 'quabug/vim-gdscript'
Plug 'calviken/vim-gdscript3'
Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'danro/rename.vim'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'qpkorr/vim-bufkill'
Plug 'dunstontc/vim-vscode-theme'
Plug 'w0rp/ale'
Plug 'xolox/vim-notes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'unblevable/quick-scope'

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

Plug 'neomake/neomake'
Plug 'vim-scripts/indentpython.vim'
Plug 'hashivim/vim-terraform'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 0
let g:loaded_youcompleteme = 1


set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

Plug 'posva/vim-vue'

autocmd FileType vue syntax sync fromstart

Plug 'othree/html5.vim'

Plug 'xolox/vim-misc'

let g:easytags_async=1

nnoremap <leader>p :CtrlPTag<CR>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\}

let g:echodoc_enable_at_startup = 1
let g:echodoc_type = 'echo'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
Plug 'davidhalter/jedi-vim'
"Plug 'ap/vim-buftabline'
Plug 'pangloss/vim-javascript'
Plug '~/.fzf'

" Initialize plugin system
call plug#end()

let g:gruvbox_contrast_dark = "soft"
set t_Co=256
set background=dark
colorscheme codedark

let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

" Python PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"MOVE LINES
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv


"SAVE BUFFERS
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
