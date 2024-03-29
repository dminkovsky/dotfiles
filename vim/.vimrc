map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" # Fun link
" ##########
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://jeffkreeftmeijer.com/2010/stumbling-into-vim/

set nocompatible
filetype off

" # Vundle, Vim package manager!! https://github.com/gmarik/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-surround'
Plugin 'yuezk/vim-js'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'alampros/vim-styled-jsx'
Plugin 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1 " Use prettier, so don't use indenting
call vundle#end()
filetype plugin indent on

" By default, JSX syntax highlighting and indenting will be enabled only for
" files with the .jsx extension. If you would like JSX in .js files, add
let g:jsx_ext_required = 0

" change the mapleader from \ to ,
let mapleader=","

" quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" clear search highlights
nnoremap <silent> <leader>/ :nohlsearch<CR>

" console list buffulers
nnoremap ~ :ls<CR>

set modeline                   " check files for set commands
set modelines=1                " the number of lines from top or bottom to look for a modeline
set statusline=(%F)(%n)(%c)    " path
set laststatus=2               " always display statusline
set ruler                      " show ruler
set hidden                     " hide buffers instead of closing them
set number                     " show line numbers
set nowrap                       " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent                 " indent automatically
set copyindent                 " copy previous indent for autoidenting
set tabstop=4                  " a tab is 2 spaces
set shiftwidth=4               " autoindent with 2 spaces
set expandtab                  " makes spaces from tabs insert mode
set vb t_vb=                   " no beep or visual bell
set showmatch                  " show matching parenthesis
set showmode                   " show mode
set incsearch                  " show search matches as you type
set nobackup                   " no backup file
set noswapfile                 " no smart file
nmap <F2> :close<CR>
set pastetoggle=<F3>
" http://stackoverflow.com/questions/5326686/indenting-javascript-in-vim-problems-with-lambda-functions-in-functions
" smart indent is using tabs... ?
" set nocindent smartindent

" faster access! 
nnoremap ; :

map <up> <C-w>k
map <down> <C-w>j
map <left> <C-w>h
map <right> <C-w>l

map <C-w><up> <C-w>K
map <C-w><down> <C-w>J
map <C-w><left> <C-w>H
map <C-w><right> <C-w>L

nnoremap ( :tabprevious<CR>
nnoremap ) :tabnext<CR>

" syntax coloring.
" requires the /mustang/ colors plugin and `TERM` set propertly to `screen-256colors`
if &t_Co >= 256 || has("gui_running")
  syntax enable
  colorscheme mustang
endif
if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" huh? this doesn't work. only eol:$ works when set list is on
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

set omnifunc=syntaxcomplete#Complete
function! CleverTab()
  if pumvisible()
    return "\<C-N>"
  endif
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-I>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

 
au BufNewFile * set noeol
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.test set filetype=php
au BufNewFile,BufRead *.less set filetype=less

" Ctrl-j/k deletes blank line below/above, and g-j/k inserts.
" http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines
:nnoremap <silent> <C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
:nnoremap <silent> <C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
:nnoremap <silent> gj :set paste<CR>m`o<Esc>``:set nopaste<CR>
:nnoremap <silent> gk :set paste<CR>m`O<Esc>``:set nopaste<CR>

" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
:nnoremap S diw"0P
" The S command is then not available – use the equivalent cc command instead.

:nnoremap K i<CR><Esc>

set foldmethod=indent
set foldenable
set foldlevel=1

map <C-L> 20zl " Scroll 20 characters to the right
map <C-H> 20zh " Scroll 20 characters to the left
map <C-k> <C-e>
map <C-j> <C-y>

set tw=60

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_completion_enabled = 1
nmap <silent> <leader><F3> <Plug>(ale_previous_wrap)
nmap <silent> <F3> <Plug>(ale_next_wrap)
nmap <silent> <F4> :ALEFix<CR>

set hlsearch
:nnoremap <Leader> /:nohlsearch<CR>

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|node_modules|Pods|capacitor|dist)',
    \ }
