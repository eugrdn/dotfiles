" Variables {{{
let s:is_windows = has('win32') || has('win64')

" set a map leader for more key combos
let mapleader = ','

"}}}

" Setting up vim-plug as the package manager {{{
if !filereadable(expand("~/.vim/autoload/plug.vim"))
    echo "Installing vim-plug and plugins. Restart vim after finishing the process."
    silent call mkdir(expand("~/.vim/autoload", 1), 'p')
    execute "!curl -fLo ".expand("~/.vim/autoload/plug.vim", 1)." https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif

if s:is_windows
  set rtp+=~/.vim
endif

" Section General {{{

set history=1000

" }}}

" Section UserInterface {{{
syntax on
let &t_Co = 256
set guifont=DroidSansMonoPLNerd:h12

set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

set number
set laststatus=2

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:»,precedes:«
set showbreak=↪

" Tab control

" set tabstop=8               " the visible width of tabs
" set softtabstop=0           " edit as if the tabs are 4 characters wide
" set shiftwidth=4            " number of spaces to use for indent and unindent
" set expandtab
" set smarttab

" Tab control
set noexpandtab             " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim

" html / templates
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support

" JavaScript
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support

" TypeScript
Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install' } " extended typescript support - works as a client for TSServer
Plug 'clausreinke/typescript-tools.vim', { 'for': 'typescript' } " typescript tools
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support

" styles
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support

" language-specific plugins
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim

call plug#end()
" }}}

" Mappings {{{

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>


" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %

    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa
augroup END
" }}}

"Plugins Settings{{{
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = ''
let NERDTreeDirArrowCollapsible = ''

" Airline options
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = '␤'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.paste = 'ρ'

" Dev icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsx'] = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" }}}

" HARDMODE {{{
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No left for you!"<CR>
vnoremap <Right> :<C-u>echo "No left for you!"<CR>
inoremap <Right> <C-o>:echo "No left for you!"<CR>
nnoremap <Up> :echo "No left for you!"<CR>
vnoremap <Up> :<C-u>echo "No left for you!"<CR>
inoremap <Up> <C-o>:echo "No left for you!"<CR>
nnoremap <Down> :echo "No left for you!"<CR>
vnoremap <Down> :<C-u>echo "No left for you!"<CR>
inoremap <Down> <C-o>:echo "No left for you!"<CR>
" }}}
