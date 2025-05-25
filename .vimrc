" Enable line numbers
set number

" Highlight the current line
set cursorline

" Enable syntax highlighting
syntax on

" Show matching parentheses and brackets
set showmatch

" Enable mouse support
set mouse=a

" Enable clipboard to use system clipboard for copy/paste
set clipboard=unnamedplus

" Set tabs and indentation
set tabstop=4        " Number of spaces that a tab counts for
set shiftwidth=4     " Number of spaces to use for auto-indent
set expandtab        " Use spaces instead of tabs

" Enable smart indentation
set smartindent

" Set relative line numbers for easier navigation
set relativenumber

" Enable incremental search (shows results as you type)
set incsearch

" Highlight search results
set hlsearch

" Disable audible bell (no beeping sound)
set noerrorbells

" Set case-insensitive search, except when using capital letters
set ignorecase
set smartcase

" Show partial commands in the last line of the screen
set showcmd

" Show file status in the bottom
set laststatus=2

" Enable auto-completion for file names and words
set wildmenu

" Set command-line height for displaying messages
set cmdheight=1

" Faster scrolling
set ttyfast

" Enable folding (based on indentation)
set foldmethod=indent
set foldlevel=99 " Start unfolded

" Set color scheme (optional: requires an installed theme)
colorscheme desert

" Auto-reload file when it changes on disk
set autoread

