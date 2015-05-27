set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" colors
set t_Co=256
syntax on
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme desert

" indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent

" line number
set number

" hilight current line
set cursorline

" Plugins
Plugin 'chriskempson/base16-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'einars/js-beautify'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-haml'
Plugin 'wookiehangover/jshint.vim'
Plugin 'moll/vim-bbye'
Plugin 'tomtom/tcomment_vim'
Plugin 'moll/vim-node'
Plugin 'othree/javascript-libraries-syntax.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

" Backspace fix
set backspace=2

" nerdtree open
map <C-n> :NERDTreeToggle<CR>

" js-beautify shortcut
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Bbye
:nnoremap <Leader>q :Bdelete<CR>

" jsformatter
nnoremap <silent> <leader>e :call JSFormat()<cr>
 
function! JSFormat()
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')
  let fileWorkingDirectory = expand('%:p:h')
  let currentWorkingDirectory = getcwd()
  execute ':lcd' . fileWorkingDirectory
  execute ':silent' . '%!esformatter'
  if v:shell_error
    undo
    "echo "esformatter error, using builtin vim formatter"
    " use internal formatting command
    execute ":silent normal! gg=G<cr>"
  endif
  " Clean up: restore previous search history, and cursor position
  execute ':lcd' . currentWorkingDirectory
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction
