" ## Plugins

" ## vim-plug installation, from https://github.com/LukeSmithxyz/voidrice/blob/archi3/.config/nvim/init.vim
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'  " Surround easily text with quotes, parentheses, etc.
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'vim-airline/vim-airline-themes'  " Themes for airline
Plug 'ryanoasis/vim-devicons'  " Show icons on filetypes
Plug 'scrooloose/nerdtree'  " Tree explorer
Plug 'airblade/vim-gitgutter'  " Show git diff on the numbers column
Plug 'tpope/vim-fugitive'  " Git wrapper
Plug 'lambdalisue/gina.vim'  " Asynchronously Git wrapper
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'scrooloose/nerdcommenter'  " Comment lines easily
Plug 'ap/vim-css-color'  " Color previews for CSS
call plug#end()

" ## Mappings
let g:mapleader = ","

" ## GUI
set encoding=UTF-8
set title
set mouse=a

" ## Lines
set number relativenumber
set nowrap

" ## Indentation
set tabstop=3
set shiftwidth=3
set softtabstop=3
set shiftround
set expandtab

" Delete with backspace
set backspace=indent,eol,start

" ## Stuff copied inside vim stored in clipboard
"set clipboard^=unnamed
set clipboard+=unnamedplus

" ## Theme & colorscheme
"set termguicolors  " true colors on terminal
"set background=dark
"colorscheme neodark

" ## Buffers
set hidden  " Allow change buffers without saving

" ## Spellchecker
set spelllang=en,es

" ## Fortran free format
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1

" ## MESA syntax highliting
"source ~/.config/nvim/plugged/MESAstro-vim/syntax/inlist.vim
filetype indent plugin on

" ## Airline
" Mappings to change buffer
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#virtualenv#enabled = 0  " Don't show current virtualenv
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline_powerline_fonts = 1

" ## NerdTree
let g:NERDTreeChDirMode = 2  " Change cwd to parent node

" Close nvim when only NerdTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$', '^venv$',
    \ '^tags$', 'node_modules', '\.o$'
    \]

let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR><Paste>


" remove highlighted work from register
nnoremap @ :noh<return>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
