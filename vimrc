syntax enable
set background=dark
colorscheme Monokai
let g:molokai_original = 1
set tabstop=4
set shiftwidth=4
filetype off
set expandtab
set autoindent
set smartindent
set smartcase

set incsearch
set showmatch
set visualbell
set noerrorbells
set nobackup
set noswapfile
set pastetoggle=<F2>

set number
set guioptions-=T
set guioptions-=e
set guioptions-=r

:set scrolloff=10

set hlsearch
hi Search guibg=LightBlue

"Ignores
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.meta,*.mat,*.prefab,*.yml,*.tga,*.txt,*.shader,*.anim,*.dll,*.xml*
"set wildignore=*,!*.cs

"Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/Command-T'
Plugin 'scrooloose/nerdtree.git'
Plugin 'thinca/vim-localrc'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elzr/vim-json'

"Need this after vundle
call vundle#end()
filetype plugin indent on

"NERDTree
let NERDTreeChDirMode=2
nmap  <leader>n :NERDTree .<CR>
nnoremap <leader>n :NERDTree .<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.meta$']
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1

" Spell checker
nmap <silent> <leader>s :set spell!<CR>

" Tagbar
nmap <leader>c :TagbarToggle<CR>

" Quick refresh for CommandT
nmap <leader>r :CommandTFlush<CR>

" Reset font size
nnoremap <D-0> :set guifont=Meslo\ LG\ M\ DZ:h10<CR>

" CTags
set tags=./tags,tags;$HOME
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Unite stuff
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite Ag:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

execute pathogen#infect()
map <S-Enter> O<Esc>
map <CR> o<Esc>

"Cursor highlighting
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Natural splits
set splitbelow
set splitright

" Tab switching made easy
map g1 :tabnext 1<CR>
map g2 :tabnext 2<CR>
map g3 :tabnext 3<CR>
map g4 :tabnext 4<CR>
map g5 :tabnext 5<CR>
map g6 :tabnext 6<CR>
map g7 :tabnext 7<CR>
map g8 :tabnext 8<CR>
map g9 :tabnext 9<CR>

"Centering
nmap <space> zz
nmap n nzz
nmap N Nzz

"And from SO
set nocompatible
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>

"Powerline stuff
set rtp+=/var/folders/sx/6s4pvyw91z3845j3pztqprgr0000gn/T/pip-6qutcE-build/powerline/bindings/vim
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'

"SCVim
let g:sclangTerm = "open -a iTerm.app"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! DelTagOfFile(file)
    let fullpath = a:file
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let f = substitute(fullpath, cwd . "/", "", "")
    let f = escape(f, './')
    let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
    let resp = system(cmd)
endfunction

function! UpdateTags()
    let f = expand("%:p")
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
    call DelTagOfFile(f)
    let resp = system(cmd)
    "execute CommandTFlush - can't recognise this
endfunction
autocmd BufWritePost *.cpp,*.h,*.c,*.cs,*.js,*.py call UpdateTags()

func! WordProcessorMode() 
    setlocal formatoptions=1 
    setlocal noexpandtab 
    map j gj 
    map k gk
    setlocal spell spelllang=en_us 
    set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
    set complete+=s
    set formatprg=par
    setlocal wrap 
    setlocal linebreak 
endfu 
com! WP call WordProcessorMode()
