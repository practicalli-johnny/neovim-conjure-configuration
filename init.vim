" Set leader key
let maplocalleader = ","

" Remap keys
" Use Esc to exit terminal state (used by vim-jack-in)
:tnoremap <Esc> <C-\><C-n>

" Use fd as escape, Spacemacs style
:inoremap fd <esc>

" Current line number and Relative line numbers
set number
set relativenumber

" Full color theme support for neovim
set termguicolors


"""""""""""""""""""""""""""""""""""""""""
" vim-plug - manage plugins
"""""""""""""""""""""""""""""""""""""""""
" Saves plugins to ~/.local/share/nvim/plugged
call plug#begin(stdpath('data') . '/plugged')

" Starup page
Plug 'mhinz/vim-startify'

"" Version control plugins
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" File management
" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" Navigation
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" Searching in projects - ripgrep
Plug 'liuchengxu/vim-clap'

" Conjure
Plug 'Olical/conjure', {'tag': 'v4.3.1'}


"""""""""
" Conjure support - jack-in with nrepl dependencies

" Start a REPL from within Vim
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'

" Structural editing for lisp languages
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Auto-close parens
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }

" Completion support
Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'

" Linting with clj-kondo
Plug 'dense-analysis/ale'

"""""""""
" Themes

" Gruvbox theme
" https://github.com/morhetz/gruvbox/
Plug 'morhetz/gruvbox'

" Solarized8
" Plug 'lifepillar/vim-solarized8'

" Spaceline.vim - Status line themes
Plug 'hardcoreplayers/spaceline.vim'
Plug 'ryanoasis/vim-devicons'


call plug#end()

"""""""""""""""""""""""""""""""""""""""""
" The end of plugins for vim-plug
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""

" Enable startify startup screen
let g:webdevicons_enable_startify = 1


" Search in project configuration
let g:clap_provider_grep_delay = 50
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'

nnoremap <leader>*  :Clap grep ++query=<cword><cr>
nnoremap <leader>fg :Clap grep<cr>
nnoremap <leader>ff :Clap files --hidden<cr>
nnoremap <leader>fb :Clap buffers<cr>
nnoremap <leader>fw :Clap windows<cr>
nnoremap <leader>fr :Clap history<cr>
nnoremap <leader>fh :Clap command_history<cr>
nnoremap <leader>fj :Clap jumps<cr>
nnoremap <leader>fl :Clap blines<cr>
nnoremap <leader>fL :Clap lines<cr>
nnoremap <leader>ft :Clap filetypes<cr>
nnoremap <leader>fm :Clap marks<cr>


" Completion configuration
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
set completeopt-=preview

let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

" Lint configuration - clj-kondo
" clj-kondo should be installed on operating system path
let g:ale_linters = {
      \ 'clojure': ['clj-kondo']
      \}


" Set Gruvbox theme
set background=light
autocmd vimenter * colorscheme gruvbox

" Set airline solarized theme to light
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='light'
" Use customized powerline fonts
" let g:airline_powerline_fonts = 1
" show tabs
" let g:airline#extensions#tabline#enabled = 1

" airline: doom-one
" let g:airline_theme='one'
" let g:airline#extensions#tabline#enabled = 1
" colorscheme one
" set background=light

" Solarized8 theme configuration
" https://github.com/lifepillar/vim-solarized8
" set background=light
" colorscheme solarized8

" Spaceline.vim configuration
let g:spaceline_colorscheme = 'one'


" Alternative themes - not used

" https://github.com/vim-airline/vim-airline
" Plug 'vim-airline/vim-airline'

" https://github.com/vim-airline/vim-airline-themes
" Plug 'vim-airline/vim-airline-themes'
