syntax enable
set background=dark
colorscheme Monokai
set tabstop=4
set shiftwidth=4
filetype indent on
set expandtab
set autoindent
set smartindent
set number
set guioptions-=T
set guioptions-=e
set guioptions-=r

set hlsearch
hi Search guibg=LightBlue

set autochdir
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>

execute pathogen#infect()
map <S-Enter> O<Esc>
map <CR> o<Esc>

"Cursor highlighting
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
