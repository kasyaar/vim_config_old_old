set nocompatible 
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
au BufRead,BufNewFile *.phps    set filetype=php
au BufRead,BufNewFile *.zsh    set filetype=zsh
au BufRead,BufNewFile *.conf    set filetype=apache
au BufRead,BufNewFile *.htaccess    set filetype=apache

"mapping for vcs plugin
nmap <c-c>c :VCSCommit<cr>
nmap <c-c>a :VCSAdd<cr>
nmap <c-c>l :VCSLog<cr>
nmap <c-c>u :VCSUpdate<cr>
nmap <c-c>r :VCSRevert<cr>
nmap <c-c>d :VCSVimDiff<cr>
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

nmap <c-c>; :%s/\<<c-r>=expand("<cword>")<cr>\>/

set pastetoggle=<Leader>v


fu! RebuildTags()
    let out = system("find . -name '*.php' > ./cscope.files && cscope -b")
    cs reset
endf
fu! LoginTwitter()
    let a:user=input("Your twitter login: ")
    let a:pswd=inputsecret(a:user."'s password: ")
    let g:twitvim_login=a:user.':'.a:pswd
    echo "Credentials are saved"
endf
command! Twil :call LoginTwitter()
nmap <Leader>r :call RebuildTags()<cr>
color  torte
"установки для плагина снипетов
imap <unique> <C-j> <Plug>Jumper
"twittervim mappings
nmap <c-t>p :PosttoTwitter<cr>
nmap <c-t>f :FriendsTwitter<cr>
nmap <c-t>l :Twil<cr>
