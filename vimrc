set nocompatible
filetype off
"mapping keys

"F8   toggle the syntax under different backgrounds
"F11  full screen using by gnome-terminal
"F1   help using by gnome-terminal
"F7   tag list



"load vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
" required!!!
Plugin 'gmarik/vundle'

"git plugins
Plugin 'tpope/vim-fugitive'

"easy moition
Plugin 'Lokaltog/vim-easymotion'

"powerline
Plugin 'Lokaltog/vim-powerline'
"Plugin 'Lokaltog/powerline'

"
Plugin 'scrooloose/nerdtree.git'

"color scheme
Plugin 'noahfrederick/vim-hemisu'

"minibuf explor
Plugin 'fholgado/minibufexpl.vim'

"jedi
Plugin 'davidhalter/jedi-vim'


"latexsuite
"Plugin 'vim-latex/vim-latex'


call vundle#end()            "required

" required for vundle!
filetype plugin indent on     

"reset map leader here
let mapleader=";"

"set wrap linebreak textwidth=0
set nowrap
set textwidth=120
let g:leave_my_textwidth_alone=1

"set helplang=cn
set encoding=utf-8

" paste mode
set paste

" can we automaticlly set the background 
set completeopt=longest,menu
set background=dark

function! ReverseBackground()
  let Mysyn=&syntax
  if &bg=="light"
     se bg=dark
  else
     se bg=light
  endif
  syn on
  exe "set syntax=" . Mysyn
": echo "now syntax is "&syntax
endfunction
command! Invbg call ReverseBackground()
noremap <F8> :Invbg<CR>

" default is light one, so run once to change to dark
"colorscheme hemisu
Invbg

"for programming
syntax on
syntax enable

" allow the 256 colors
set t_Co=256

"ncl part will add later

"fortran

set paste
set ruler
"
"highlight search result
set hlsearch
"
" Taglist
  let Tlist_Ctags_Cmd='/usr/bin/ctags'
  let Tlist_Auto_Open=0
  let Tlist_Show_One_File=1
  let Tlist_Exit_OnlyWindow=1
  nnoremap <silent> <F7> :TlistToggle<CR>
"

"for minibuf explor
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplMapWindowNavArrows = 1
  let g:miniBufExplMapCTabSwitchBufs = 1
  let g:miniBufExplModSelTarget = 1



"set status line
"set statusline
"if has('statusline')
"  if version >= 700
"    " Fancy status line.
"    set statusline =
"    set statusline+=%#User1#                       " highlighting
"    set statusline+=%n                             " buffer number
"    set statusline+=%{'/'.bufnr('$')}\             " buffer count
"    set statusline+=%#User2#                       " highlighting
"    set statusline+=%f                             " file name
"    set statusline+=%#User1#                       " highlighting
"    set statusline+=%h%m%r%w\                      " flags
"    set statusline+=%{(&key==\"\"?\"\":\"encr,\")} " encrypted?
"    set statusline+=%{strlen(&ft)?&ft:'none'},     " file type
"    set statusline+=%{(&fenc==\"\"?&enc:&fenc)},   " encoding
"    set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
"    set statusline+=%{&fileformat},                " file format
"    set statusline+=%{&spelllang},                 " spell language
"    set statusline+=%(%{Tlist_Get_Tagname_By_Line()}%), " Function name
"    set statusline+=%=                             " indent right
"    set statusline+=%#User2#                       " highlighting
"    set statusline+=%#User1#                       " highlighting
"    set statusline+=U+%04B\                        " Unicode char under cursor
"    set statusline+=%-6.(%l/%{line('$')},%c%V%)\ %<%P           " position
"
"    " Use different colors for statusline in current and non-current window.
"    let g:Active_statusline=&g:statusline
"    let g:NCstatusline=substitute(
"      \                substitute(g:Active_statusline,
"      \                'User1', 'User3', 'g'),
"      \                'User2', 'User4', 'g')
"  endif
"endif
""even one file show statusline

set laststatus=2
"powereline
let g:Powerline_symbols='unicode'
let g:Powerline_symbols='fancy'


"some mapping
"NerdTree
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=30
"..NERDTree.....
let NERDTreeWinPos="right"

"search in project
nnoremap <Leader>sp :Grep<CR>
"goto split windows
nnoremap <Leader>gs <C-W><C-W>

"latexsuite settings
"let g:Tex_DefaultTargetFormat = 'ps'
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_MultipleCompileFormats = 'ps'
let g:Tex_ComplieRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_ComplieRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_ComplieRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_FormatDependency_ps = 'dvi,ps'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_ViewRule_pdf = 'evince'


if has('gui_running')
   set guifont=Inconsolata\ for\ Powerline\ Medium\ 11
   "set guifont=Droid\ Sans\ Mono\ Powerline
   set wrap
   set spell
endif
