"Не совместимый с vi
set nocompatible 
"Подсвечивать найденный фрагменты
set hlsearch
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nu
set bg=dark
set foldmethod=indent
set autoindent
set smartindent
" Не выгружать буферы при переключении
set hidden
syntax on
"set spell
set spelllang=ru,en

set termencoding=utf8
set fileencodings=utf8,cp1251
set encoding=utf8
set incsearch

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb= 

" Поддержка мыши
set mouse=a
set mousemodel=popup
" Папка для swp файлов(дабы не захламлять working dir)
set backupdir=~/.vim/backup
set directory=~/.vim/backup
" Опции сесссий
set sessionoptions=curdir,buffers,tabpages
" Слова откуда будем завершать
 set complete=""
 " Из текущего буфера
 set complete+=.
 " Из словаря
 set complete+=k
 " Из других открытых буферов
 set complete+=b
 " из тегов 
 set complete+=t

" Включаем filetype indent
filetype indent on
" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd FileType html source ~/.vim/plugin/sparkup.vim
    autocmd FileType xml source ~/.vim/plugin/sparkup.vim
endif


set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

set autoread

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}


"mapping for vcs plugin
nmap <c-c>c :VCSCommit<cr>
nmap <c-c>a :VCSAdd<cr>
nmap <c-c>l :VCSLog<cr>
nmap <c-c>u :VCSUpdate<cr>
nmap <c-c>r :VCSRevert<cr>
nmap <c-c>d :VCSVimDiff<cr>
nmap <c-c>t :VCSAnnotate<cr>
"mappings for BufExplorer
map <c-c>p :bp<cr>
vmap <c-c>p <esc>:bp<cr>i
imap <c-c>p <esc>:bp<cr>i

map <c-c>n :bn<cr>
vmap <c-c>n <esc>:bn<cr>i
imap <c-c>n <esc>:bn<cr>i
"mappings for
"saving

"shell
map <c-c>s :shell<cr>

"keyboard shortcuts
nmap <Leader>p :NERDTreeToggle<cr>
vmap <Leader>p <esc>:NERDTreeToggle<cr>i
imap <Leader>p <esc>:NERDTreeToggle<cr>i

"debugger shortcuts
nmap <c-d>b :Bp<cr>
vmap <c-d> <esc>:Bp<cr>i
imap <c-d> <esc>:Bp<cr>i


nmap <c-c>; :%s/\<<c-r>=expand("<cword>")<cr>\>/

set pastetoggle=<Leader>v



fu! RebuildCSTags()
    let out = system("find . -name '*.*' > ./cscope.files && cscope -b")
    cs reset
endf
fu! RebuildTags()
    :!ctags -R -a
endf
nmap <Leader>rc :call RebuildTags()<cr>
nmap <Leader>r :call RebuildCSTags()<cr>
nmap <Leader>sm :call ReloadAllSnippets()<cr>
color  torte

let Tlist_Ctags_Cmd = "ctags"
let Tlist_WinWidth = 50
nmap <leader>l :TlistToggle<cr>
nmap <leader>lo :TlistOpen<cr>
set bs=2
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
