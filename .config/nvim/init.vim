" ---------------------------------------------------------------------------------------------------
"                                                  INIT.VIM
" ---------------------------------------------------------------------------------------------------


" #  PLUGINS
" ## from https://github.com/LukeSmithxyz/voidrice/blob/archi3/.config/nvim/init.vim
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'                                           " surround easily text with quotes, parentheses, etc.
Plug 'vim-airline/vim-airline'                                      " status bar & tab line
Plug 'vim-airline/vim-airline-themes'                               " themes for airline
Plug 'ryanoasis/vim-devicons'                                       " show icons on file types
Plug 'scrooloose/nerdtree'                                          " tree explorer
Plug 'airblade/vim-gitgutter'                                       " show git diff on the numbers column
Plug 'tpope/vim-fugitive'                                           " git wrapper
Plug 'jiangmiao/auto-pairs'                                         " auto pair quotes, parentheses, etc.
Plug 'scrooloose/nerdcommenter'                                     " comment lines easily
Plug 'ap/vim-css-color'                                             " color previews for CSS
Plug 'davidhalter/jedi-vim'                                         " autocomplete for python. need neovim module in python to work
Plug 'rudrab/vimf90'                                                " fotran ide-like
Plug 'SirVer/ultisnips'                                             " snippets in combination with vimf90
call plug#end()
filetype plugin indent on


" # GENERAL
language en_US.UTF-8
set encoding=UTF-8
set nocompatible                                                    " no need for vi
set clipboard+=unnamedplus                                          " yank goes to clipboard
set nowrap
set title
set mouse=a                                                         " able to use mouse

set ignorecase                                                      " searching with ignore case
set smartcase                                                       " smart search
set hlsearch                                                        " highlight matches
set incsearch
set fdm=marker
set magic                                                           " for regex 
set whichwrap+=<,>,h,l
set spell spl=en_us                                                 "  set Spell
set spelllang=en,es                                                 " spell checker
set spell
syntax enable
set omnifunc=syntaxcomplete#Complete


" # FORMATTING
set tabstop=3                                                       " tabs width
set shiftwidth=3                                                    " shift width for indents
set softtabstop=3
set shiftround
set expandtab                                                       " tab is actually space
set hidden                                                          " allow change buffers without saving

set autoindent                                                      " smart indent
set smartindent
set backspace=indent,eol,start                                      " delete with backspace


" # VISUAL STUFF
set number relativenumber                                           " show relative numbers to current location
set laststatus=2                                                    "  show status line.
set showcmd
set splitright

"set termguicolors                                                  " true colors on terminal
"set background=dark
"colorscheme neodark


" # MAPPINGS
let mapleader=","
nnoremap <leader>r :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>R :%s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <esc> :noh<return> <esc>                                   " remove highlighted word from register

nmap <silent> <C-q> :NERDTreeToggle<CR>
nnoremap <silent> <C-s> :NERDTreeFind<CR>

inoremap <c-j> <Esc>/<++><CR><Esc><cf>

"nmap <leader>j <Plug>AirlineSelectPrevTab
"nmap <leader>k <Plug>AirlineSelectNextTab


" # BUFFERS
map <leader>bd :bd<cr>                                              " close the current buffer
map <leader>te :badd <c-r>=expand("%:p:h")<cr>/

" ## return to last edit position (from: https://github.com/rudrab/vim-settings/blob/master/vimrc)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif


" # FORTRAN
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1
let fortran_have_tabs = 1

" VIMF90
"let fortran_leader = ""
let fortran_linter = 1
let fortran_dep_install = 3


" ULTISNIPPETS
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnipsSnippetsDir="PATH/TO/CUSTOM/SNIPPETS"
let g:UltiSnips = {}
let g:UltiSnipsalways_use_first_snippet = 1
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"


" # AIRLINE
let g:airline#extensions#tabline#enabled = 1                        " show open buffers/tabs
let g:airline#extensions#tabline#buffer_nr_show = 1                 " show number of buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'                    " show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#virtualenv#enabled = 0                     " don't show current virtualenv
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline_powerline_fonts = 1


" # NERDTREE
let g:NERDTreeChDirMode = 2                                         " change cwd to parent node
let g:NERDTreeMinimalUI = 1                                         " hide help text
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDSpaceDelims = 1                                           " add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                                       " use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'                                     " align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1                                     " allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1                                " enable trimming of trailing whitespace when uncommenting

" ## close nvim when only NerdTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ## ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$', '^venv$',
    \ '^tags$', 'node_modules', '\.o$'
    \]
