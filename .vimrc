" ____   ____  _____  ____    ____                 
"|_  _| |_  _||_   _||_   \  /   _|                
"  \ \   / /    | |    |   \/   |   _ .--.  .---.  
"   \ \ / /     | |    | |\  /| |  [ `/'`\]/ /'`\] 
"    \ ' /     _| |_  _| |_\/_| |_  | |    | \__.  
"     \_/     |_____||_____||_____|[___]   '.___.' 
"
" Tarb's kino VIMrc file. Feel free to copy. 

" ============================================================
"  Plugins
" ============================================================
call plug#begin('~/.vim/plugged')
"Gruvbox Theme
	Plug 'https://github.com/morhetz/gruvbox'
"Distraction-Free Mode 
	Plug 'https://github.com/junegunn/goyo.vim'
"HTML Helper
	Plug 'https://github.com/mattn/emmet-vim'
" Writing wrapping and more 
	Plug 'https://github.com/preservim/vim-pencil'
"Status bar theme
	Plug 'https://github.com/vim-airline/vim-airline'
"VIM wiki
	Plug 'https://github.com/vimwiki/vimwiki'
"Limelight
	Plug 'https://github.com/junegunn/limelight.vim'
"Markdown
	Plug 'https://github.com/preservim/vim-markdown'
"Ultimate Syntax
	Plug 'https://github.com/sheerun/vim-polyglot'
"Pandoc
	Plug 'https://github.com/vim-pandoc/vim-pandoc'
	Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax'
"Code Autocomplete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
"NERDtree
	Plug 'https://github.com/preservim/nerdtree'
	Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
	Plug 'https://github.com/ryanoasis/vim-devicons'
	Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

" ============================================================
"  Visuals
" ============================================================
"Color scheme
	colorscheme gruvbox 
"Limelight color
	let g:limelight_conceal_ctermfg = 'gray'
	let g:limelight_conceal_ctermfg = 240
" ============================================================
"  General Configs
" ============================================================
"Set Leader Key
	let mapleader = "."
"Enable line numbers
	set number
"Relative line nagivation
	set number relativenumber
"Enable syntax 
	syntax on
"Encoding
	set encoding=utf-8
"TEXT Hidden
	set hidden
"Table size and removal
	set tabstop=4
	set softtabstop=4
"Indentation
	set autoindent
"Search highlighting
	set hlsearch
"Autocompletion
	set wildmode=longest,list,full
"Message Display Space
	set cmdheight=2
"Disable autocomment on new line
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"Proper screen splits
	set splitbelow splitright 
"Split Navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
"Copy and Paste
	vnoremap <C-c> "+y 
	map <C-a> ggVG"+y
"Cursor shape
	let &t_SI = "\e[6 q"
	let &t_EI = "\e[2 q"
"Cursor highlight
	set cursorcolumn
	set cursorline 
"Spellchecking
	set spell spelllang=en_us
" ============================================================
" Goyo Plugin Configs
" ============================================================
"Goyo activte
	map <F9> :Goyo <bar> <CR>
"Goyo and limelight
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
" ============================================================
" NERDTree Plugin Configs
" ============================================================
"Activate NERDTree on Start
	autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit NERDTree 
	nmap <C-f> :NERDTreeToggle<CR>
" NERDTree Window Size
	let g:NERDTreeWinSize=25
" ============================================================
"  VIMwiki Plugin Configs
" ============================================================
	set nocompatible
	filetype plugin on 	
" ============================================================
"  Code Autocomplete Plugin Configs
" ============================================================
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

