syntax enable
set background=dark
colorscheme Monokai
set tabstop=4
set shiftwidth=4
filetype off
set expandtab
set autoindent
set smartindent
set number
set guioptions-=T
set guioptions-=e
set guioptions-=r

set hlsearch
hi Search guibg=LightBlue

"Ignores
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.meta

"Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Need this after vundle
filetype plugin indent on

"NERDTree
let NERDTreeChDirMode=2
" nnoremap <leader>n :NERDTreeTabsOpen .<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.meta$']
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1

" Spell checker
nmap <silent> <leader>s :set spell!<CR>

" Tagbar
nmap <leader>c :TagbarToggle<CR>

" CTags
set tags=./tags,tags;$HOME
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

execute pathogen#infect()
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"Cursor highlighting
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"Window highlighting - this doesn't work (screws up colour palates)
"au WinLeave * set background=dark
"au WinEnter * set background=light

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

"And from SO
set nocompatible
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>

"Powerline stuff
set rtp+=/var/folders/sx/6s4pvyw91z3845j3pztqprgr0000gn/T/pip-6qutcE-build/powerline/bindings/vim
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'

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
