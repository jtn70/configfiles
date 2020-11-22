""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My custom .vimrc file, copy it to
" Linux: ~/.vimrc
" Windows: $USERPROFILE\.vimrc
" 
" The file is customized from https://github.com/amix/vimrc
" Thanks to Amir Salihefendic - @amix3k for the research and 
" the original version.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GENERAL
set history=500     	" How many lines of history for vim to remember

filetype plugin on  	" Enable filetype plugins
filetype indent on

" Set to autoread when a file is changed outisde of vim.
set autoread		
au FocusGained,BufEnter * checktime

" :W sudo saves the file (useful for handling permission-denied error)
command! W execute 'w !sudo tee & > /dev/null' <bar> edit!	" :W sudo saves the file


" VIM USER INTERFACE
set so=7 	    " 7 lines to the cursor when moving vertically with j/k
set wildmenu	" command line completion (use TAB)
set cursorline  " highlight current cursorline
set lazyredraw  " redraw only when needed


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif	

set ruler	" Show ruler in the bottom right.
set hid		" Buffer becomes hidden when it is abandoned
set backspace=eol,start,indent	" Configure backspace to work properly
set whichwrap+=<,>,h,l
set ignorecase			" Ignore case when searching
set smartcase			" Try to be smart with cases when searching
set incsearch			" Highlight search term when typing search string
set hlsearch			" Highlight search results
set magic			" Turn on magic for regular expressions
set showmatch			" Show matching bracket when cursor is on a bracket
set mat=5			" 5/10 second blink when matching bracket
set belloff=all			" Turn off all sound

" COLORS/FONTS
syntax enable			" Enable Syntax Highlighting
set termguicolors		" Upgrade number of colors shown
colorscheme molokai	
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"	" Hack to display correctly in some terminals
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set encoding=utf8			" Set UTF-8 as standard file encoding

"FILES,BACKUPS,UNDO
set nobackup			" Turn of backup
set nowb
set noswapfile


" TEXT,TAB,INDENTS
set shiftwidth=4    " 1 TAB = 4 SPACE
set tabstop=4
set softtabstop=4
set expandtab       " Use spaces instead of tabs
set smarttab
set lbr             " Set linbreak on 500 char
set tw=500          
set ai              " Autoindent
set si              " Smartindent
set wrap            " Wrap lines


