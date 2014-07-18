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

" Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

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

"Dash
:nmap <silent> <leader>m <Plug>DashGlobalSearch

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


" Searches Dash for the word under your cursor in vim, using the keyword
" operator, based on file type. E.g. for JavaScript files, I have it
" configured to search j:term, which immediately brings up the JS doc
" for that keyword. Might need some customisation for your own keywords!
 
function! SearchDash()
    " Some setup
    let s:browser = "/usr/bin/open"
    let s:wordUnderCursor = expand("<cword>")
     
    " Get the filetype (everything after the first ., for special cases
    " such as index.html.haml or abc.css.scss.erb)
    let s:fileType = substitute(expand("%"),"^[^.]*\.","",1)
     
    " Alternative ways of getting filetype, aborted
    " let s:fileType = expand("%:e")
    " let s:searchType = b:current_syntax.":"
     
    " Match it and set the searchType -- make sure these are the right shortcuts
    " in Dash! Sort by priority in the match list below if necessary, because
    " Tilt-enabled projects may have endings like .scss.erb.
    if match(s:fileType, "js") != -1
        let s:searchType = "js:" " can assign this to jQuery, too
    elseif match(s:fileType, "css") != -1
        let s:searchType = "css:"
    elseif match(s:fileType, "html") != -1
        let s:searchType = "html:"
    elseif match(s:fileType, "rb") != -1
        let s:searchType = "rb:" " can assign this to Rails, too
    elseif match(s:fileType, "php") != -1
        let s:searchType = "php:"
    elseif match(s:fileType, "py") != -1
        let s:searchType = "python:"
    else
        let s:searchType = ""
    endif
     
    " Run it
    let s:url = "dash://".s:searchType.s:wordUnderCursor
    let s:cmd ="silent ! " . s:browser . " " . s:url
    execute s:cmd
    redraw!
endfunction
map <leader>d :call SearchDash()<CR>
