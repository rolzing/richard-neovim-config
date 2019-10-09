call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"atom theme
Plug 'sainnhe/edge'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Automatic completion of parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
let g:delimitMate_expand_cr=1
call plug#end()

syntax on

set relativenumber
set termguicolors
" for dark version
set background=dark
colorscheme edge
set nowrap

"one theme for status bar
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

syntax sync fromstart
set redrawtime=10000

"NERDTree Configuration <<<<

"Closing automatically
"My favorite vim configs are the ones that save you keystrokes and reduce the noise in your workflow by automatically doing the things you need to do anyways. This is one of them: automatically close NerdTree when you open a file:
let NERDTreeQuitOnOpen = 1

"Deleting files
"Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


"F3 will open NERDTree panel and highlight current file. And when you're in the NERDTree panel,
"F3 will open file under cursor. So, I can use one button to jump between buffer and NERDTree.
"(And F4 for preview because it's next to F3)
silent! nmap <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

"FZF Configuration
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

"gitgutter Configuration
nmap ghp <Plug>(GitGutterPreviewHunk)
