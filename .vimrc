
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'


let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \|set softtabstop=4
    \|set shiftwidth=4
    \|set textwidth=79
    \|set expandtab
    \|set autoindent
    \|set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \|set tabstop=2
    \|set softtabstop=2
    \|set shiftwidth=2


Plugin 'vim-scripts/indentpython.vim'

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"Bundle 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF


Plugin 'vim-syntastic/syntastic'


Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  "colorscheme zenburn
"  colorscheme solarized
"endif

"call togglebg#map("<F5>")

"Plugin 'kien/ctrlp.vim'

set nu

Plugin 'tpope/vim-fugitive'

"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

set clipboard=unnamed


" Tweaks for browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Snippets:

" Read an empy html template and move cursor to title
nnoremap ,html :-1read $HOME/todo/skeleton.html<CR>3jwf>a

"set makeprg=env/bin/python\ -mpytest\ tests.py

nmap <leader>r :make <CR>
"nmap <leader>r :!ls <CR>
nmap <leader>v :source ~/.vimrc<CR>

"set makeprg=pytest\ --tb=short\ -vv\ $*
"set makeprg=env/bin/python\ -mpytest\ --tb=short\ -vv\ $*
"set makeprg=env/bin/python\ -mpytest\ --tb=short\ -vv\ %
set makeprg=env/bin/python\ -mpytest\ --vim-quickfix\ %

set errorformat=
      \%EE\ \ \ \ \ File\ \"%f\"\\,\ line\ %l,
      \%CE\ \ \ %p^,
      \%ZE\ \ \ %[%^\ ]%\\@=%m,
      \%Afile\ %f\\,\ line\ %l,
      \%+ZE\ %mnot\ found,
      \%CE\ %.%#,
      \%-G_%\\+\ ERROR%.%#\ _%\\+,
      \%A_%\\+\ %o\ _%\\+,
      \%C%f:%l:\ in\ %o,
      \%ZE\ %\\{3}%m,
      \%EImportError%.%#\'%f\'\.,
      \%C%.%#,
      \%+G%[=]%\\+\ %*\\d\ passed%.%#,
      \%-G%[%^E]%.%#,
      \%-G
