set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Scala plugin
Plugin 'derekwyatt/vim-scala'
" Ruby plugin
Plugin 'vim-ruby/vim-ruby'
" Airline for status bar
Plugin 'bling/vim-airline'
" Close brackets etc automatically
Plugin 'Raimondi/delimitMate'
" Change text surroundings with cs (old) (new)
Plugin 'tpope/vim-surround'
" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Moloki theme
Plugin 'tomasr/molokai'
" ag.vim
Plugin 'rking/ag.vim'
" Rainbow parentheses
Plugin 'luochen1990/rainbow'
" Coffeescript
Plugin 'kchmck/vim-coffee-script'
" Indent guides
Plugin 'nathanaelkane/vim-indent-guides'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

execute pathogen#infect()

syntax on
set encoding=utf-8
set number
set directory=/tmp
let mapleader = "\space"
:imap jj <Esc>

set tabstop=2

set shiftwidth=2

set softtabstop=2

set expandtab

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

set wildignore+=*/tmp/*,*/target/*,*.class,*/.git/*,*/target,*.pyc

" Formatter for scala code
au BufEnter *.scala setl formatprg=java\ -jar\ /usr/local/Cellar/scalariform/0.1.6/libexec/scalariform.jar\ -f\ -q\ +compactControlReadability\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +preserveSpaceBeforeArguments\ --stdin\ --stdout

" Maps gq to = if scala file
autocmd Filetype scala :nmap = gq

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

let g:netrw_localrmdir='rm -r'

" Unite custom commands

nnoremap <C-p> :Unite file_rec/async<cr>
let g:unite_source_history_yank_enable = 1

call unite#custom#profile('default', 'context', {
  \ 'start_insert': 1,
  \ 'winheight': 10,
  \ 'direction': 'botright',
  \ 'ignorecase': 1,
  \ })

call unite#custom_source('file,file_rec,file_rec/async,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.bundle/',
      \ 'target/',
      \ '\.lib/',
      \ '\.rubygems/',
      \ 'images/',
      \ 'fonts/',
      \ 'vendor/',
      \ ], '\|'))

if executable('ag')
  let g:unite_prompt = '> '
  let g:unite_data_directory="~/.vim/.cache/unite"
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
      \ '--line-numbers --column --nocolor --nogroup --hidden --ignore ' .
      \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore target/ -g ""'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --hidden --ignore .git --ignore .svn --ignore .hg --ignore .DS_STORE --ignore target/ -g ""'
end

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

inoremap {<CR> {<CR>}<C-o>O

set backspace=indent,eol,start

set laststatus=2

set showmode

set showcmd

set modeline

set title

set number

set cursorline

set nohlsearch

set incsearch

set ignorecase

set smartcase

set background=dark
let g:molokai_original = 0
let g:solarized_termcolors = 16
let g:rehash256 = 0
colorscheme molokai

let g:ag_working_path_mode="r"

let g:rainbow_active = 1

let g:indent_guides_enable_on_vim_startup = 1
set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

:au FocusLost * :wa
:set autowriteall

:set autoread
