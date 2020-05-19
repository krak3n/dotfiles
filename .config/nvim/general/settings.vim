" -----------------------------------------------------------------------------
" General Settings
" -----------------------------------------------------------------------------

set nocompatible                " Disable vi compatability

set autoread                    " Refresh file on external changes
set exrc                        " Allow loading of local rc files
set secure                      " Disallow :autocmd, shell and write commands in local rc files
set encoding=utf-8              " Explicitly set encoding to utf-8
set fileencoding=utf-8          " The encoding written to file
set mouse=nv                    " Disable mouse in command-line mode
set modeline                    " automatically setting options from modelines
set report=0                    " Don't report on line changes
set visualbell                  " Use visual bell instead of beeping
set hidden                      " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac    " Use Unix as the standard file type
set magic                       " For regular expressions turn magic on
set path=.,**                   " Directories to search when using gf
set virtualedit=block           " Position cursor anywhere in visual block
set synmaxcol=1000              " Don't syntax highlight long lines
set formatoptions+=1            " Don't break lines after a one-letter word
set formatoptions-=t            " Don't auto-wrap text
set formatoptions-=cro          " Stop newline continution of comments
set updatetime=300              " Smaller updatetime for CursorHold & CursorHoldI
set timeoutlen=500              " By default timeoutlen is 1000 ms
set signcolumn=yes              " always show signcolumns
set t_vb=                       " Prevent screen flashing

" Backup Directories
" Recomended by coc not to backup
set nobackup
set nowritebackup
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Tabs and Indents

set textwidth=100               " Text width maximum chars before wrapping
set noexpandtab                 " Don't expand tabs to spaces.
set tabstop=4                   " The number of spaces a tab is
set softtabstop=4               " While performing editing operations
set shiftwidth=4                " Number of spaces to use in auto(indent)
set smarttab                    " Tab insert blanks according to 'shiftwidth'
set autoindent                  " Use same indenting on new lines
set smartindent                 " Smart autoindenting on new lines
set shiftround                  " Round indent to multiple of 'shiftwidth'

" Searching

set ignorecase                  " Search ignoring case
set smartcase                   " Keep case when searching with *
set infercase                   " Adjust case in insert completion mode
set incsearch                   " Incremental search
set hlsearch                    " Highlight search results
set wrapscan                    " Searches wrap around the end of the file
set showmatch                   " Jump to matching bracket
set matchpairs+=<:>             " Add HTML brackets to pair matching
set matchtime=1                 " Tenths of a second to show the matching paren
set cpoptions-=m                " showmatch will wait 0.5s or until a char is typed

" Behavior

set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set complete=.                  " No wins, buffs, tags, include scanning
set iskeyword+=-                " Treat dash separated words as a word text object"
set completeopt=menuone         " Show menu even for one item
set completeopt+=noselect       " Do not select a match in the menu
set conceallevel=0              " Text is shown normally

" Editor UI Appearance

set noshowmode                  " Don't show mode in cmd window
set shortmess=aoOTI             " Shorten messages and don't show intro
set scrolloff=2                 " Keep at least 2 lines above/below
set sidescrolloff=5             " Keep at least 5 lines left/right
set number                      " Show line numbers
set relativenumber              " Relative line numbers
set ruler                       " Disable default status ruler
set list                        " Show hidden characters
set cursorline                  " Enable highlighting of the current line

set showtabline=2               " Always show the tabs line
set winwidth=30                 " Minimum width for active window
set winheight=1                 " Minimum height for active window
set pumheight=10                " Pop-up menu's line height
set helpheight=12               " Minimum help window height
set previewheight=12            " Completion preview height

set noshowcmd                   " Don't show command in status line
set cmdheight=2                 " Height of the command line
set cmdwinheight=5              " Command-line lines
set noequalalways               " Don't resize windows on split or close
set laststatus=0                " Always show a status line
set colorcolumn=120             " Highlight the 120th character limit
set display=lastline

" Characters shown for breaks, tabs, spaces etc
set showbreak=↪\
set listchars=tab:⤷\ ,eol:⤶,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %

" Force write
cmap w!! w !sudo tee %

" Use the system clipboard for yank / delete / paste operations
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" Delete trailing whitespace on write
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
