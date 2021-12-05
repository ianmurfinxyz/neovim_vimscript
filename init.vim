"-------------------------------------------------------------------------------
"   __  __ ______ _____  _      _____ _   _           
"  |  \/  |  ____|  __ \| |    |_   _| \ | |          
"  | \  / | |__  | |__) | |      | | |  \| |  
"  | |\/| |  __| |  _  /| |      | | | . ` |  
"  | |  | | |____| | \ \| |____ _| |_| |\  |  
"  |_|  |_|______|_|  \_\______|_____|_| \_|  
" 
"  Ian Murfin (https://www.github.com/ianmurfinxyz)
" 
"  NVIM init.vim configuration.
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" PLUGINS
"-------------------------------------------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

" paq manages itself
Plug 'savq/paq-nvim',

" nerdtree stuff
Plug 'preservim/nerdtree',
Plug 'tiagofumo/vim-nerdtree-syntax-highlight',
Plug 'Xuyuanp/nerdtree-git-plugin',
Plug 'ryanoasis/vim-devicons',

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" fzf dependencies
Plug 'junegunn/fzf.vim',
Plug 'tpope/vim-fugitive',
Plug 'sharkdp/bat',
Plug 'dandavison/delta',
Plug 'BurntSushi/ripgrep',

" Normal mode commands to 'surround' text with anything!
Plug 'tpope/vim-surround',

call plug#end()

"-------------------------------------------------------------------------------
" DEFAULT EDITOR OPTIONS
"-------------------------------------------------------------------------------

set expandtab            " use spaces instead of tabs
set tabstop=2            " num spaces to substitute an existing tab for
set softtabstop=2        " num spaces to substitute newly inserted tabs for
set shiftwidth=2         " num spaces for each step of autoindent
set smarttab        
 
set cursorline           " draw a horizontal line under your cursor?
set colorcolumn=81       " draw a vertical line at column number
set number               " draw line numbers?
set sidescroll=5         " horizontal scroll distance
 
set nowrap               " wrap display lines that overflow the window?
set textwidth=0          " wrap buffer lines that overflow the window? 
 
set ignorecase           " ignore case when searching
set smartcase            " override ignorecase if pattern contains uppercase
set hlsearch             " highlight search result
set incsearch            " live update search results
 
set incsearch            " live update search results
set incsearch            " live update search results

highlight colorcolumn ctermbg=DarkGray
highlight cursorline cterm=bold ctermbg=DarkGray

" enabled mouse mode for terminals
set mouse=a

"-------------------------------------------------------------------------------
" EDITOR THEME
"-------------------------------------------------------------------------------

set guifont=FiraCode\ NF:h18

"-------------------------------------------------------------------------------
" MOVEMENT MAPPINGS
"-------------------------------------------------------------------------------

" leader prefix used for custom commands
:let mapleader='`'   

" faster scrolling/movement commands
nnoremap <S-h> 10h   
nnoremap <S-j> 10j   
nnoremap <S-k> 10k   
nnoremap <S-l> 10l   

" easier window navigatioc
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l

"-------------------------------------------------------------------------------
" GENERAL MAPPINGS
"-------------------------------------------------------------------------------

" edit this rc file
nnoremap <leader>erc :edit $MYVIMRC<cr>

" reload this rc file
nnoremap <leader>rrc :so $MYVIMRC<cr>

" toggle relative numbers
nnoremap <leader>rn :set relativenumber!<cr>

" Paste from clipboard
nnoremap <leader>p "+p'

"-------------------------------------------------------------------------------
" NERDTREE PLUGIN MAPPINGS
"-------------------------------------------------------------------------------

" see :help NERDTree

" Toggle NERDTree window open/closed
nnoremap <Tab> :NERDTreeToggle<cr>

"-------------------------------------------------------------------------------
" NERDTREE PLUGIN OPTIONS
"-------------------------------------------------------------------------------

" Character width of NERDTree window.
let g:NERDTreeWinSize=25

"-------------------------------------------------------------------------------
" NERDTREE SYNTAX HIGHLIGHT PLUGIN
"-------------------------------------------------------------------------------

" see: https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

" Disabled highlights for uncommon file types to improve plugin
" performance. The following extensions will still be highlighted:
" .bmp, .c, .coffee, .cpp, .cs, .css, .erb, .go, .hs, .html, .java, .jpg, 
" .js, .json, .jsx, .less, .lua, .markdown, .md, .php, .png, .pl, .py, .rb, 
" .rs, .scala, .scss, .sh, .sql, .vim
let g:NERDTreeLimitedSyntax=1

" Sets the string that is displayed between the NERDTree file icons and 
" the file name.
let g:WebDevIconsNerdTreeAfterGlyphPadding=" "

" Highlight the full name and not just the icon
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1

" Set colors of highlights for each filetype
let g:NERDTreeExtensionHighlightColor = {} " required to avoid error
let g:NERDTreeExtensionHighlightColor['cpp']='FF0066'

"-------------------------------------------------------------------------------
" NERDTREE GIT PLUGIN
"-------------------------------------------------------------------------------

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"-------------------------------------------------------------------------------
" FUZZY FILE FINDER
"-------------------------------------------------------------------------------

" Search for new file in CWD to open
nnoremap <leader>f <esc><esc>:Files!<cr>

" Search for new file in CWD to open (only shows git tracked files)
nnoremap <leader>gf <esc><esc>:Files!<cr>

" Show a list of open buffers
nnoremap <leader>b <esc><esc>:Buffers!<cr>

" Search for lines while
nnoremap <leader>g <esc><esc>:BLines!<cr>

" Browse git history of current file
nnoremap <leader>c <esc><esc>:BCommits!<cr>

" Run ripgrep  
nnoremap <leader>r <esc><esc>:Rg!<cr>
