"   __    __                     __     __  __
"  |  \  |  \                   |  \   |  \|  \
"  | $$\ | $$  ______    ______ | $$   | $$ \$$ ______ ____
"  | $$$\| $$ /      \  /      \| $$   | $$|  \|      \    \
"  | $$$$\ $$|  $$$$$$\|  $$$$$$\\$$\ /  $$| $$| $$$$$$\$$$$\
"  | $$\$$ $$| $$    $$| $$  | $$ \$$\  $$ | $$| $$ | $$ | $$
"  | $$ \$$$$| $$$$$$$$| $$__/ $$  \$$ $$  | $$| $$ | $$ | $$
"  | $$  \$$$ \$$     \ \$$    $$   \$$$   | $$| $$ | $$ | $$
"   \$$   \$$  \$$$$$$$  \$$$$$$     \$     \$$ \$$  \$$  \$$

set nocompatible

"     ___  __          _
"    / _ \/ /_ _____ _(_)__  ___
"   / ___/ / // / _ `/ / _ \(_-<
"  /_/  /_/\_,_/\_, /_/_//_/___/
"              /___/

" Vim / Neovim support
let autoloaddir = '~/.vim/autoload'
let plugdir     = '~/.vim/plugged'
let cocextdir   = '~/.config/coc/extensions/node_modules'
if has('nvim')
	let autoloaddir = '~/.config/nvim/autoload'
	let plugdir     = autoloaddir . '/plugged'
endif

" Auto Install vim-plug
if !filereadable(autoloaddir . '/plug.vim')
	silent execute '!curl -fLo ' . autoloaddir . '/plug.vim  --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
endif

" Start vim-plug
call plug#begin(plugdir)

"
" IDE
"

Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }                          " Buffer deletion
Plug 'tmux-plugins/vim-tmux-focus-events'                                " Add support for tnmux focus events
Plug 'neoclide/coc.nvim', {'branch': 'release'}                          " Intellisense code engine, auto-completion, linting, code fixing
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}           " Search
Plug 'junegunn/fzf.vim'                                                  " Preview window
Plug 'airblade/vim-rooter'                                               " Change vim root directory

"
" UI
"

Plug 'joshdick/onedark.vim'                                              " Theme
Plug 'Yggdroot/indentLine'                                               " Indent Hilighting
Plug 'vim-airline/vim-airline'                                           " Status / Tabline
Plug 'ryanoasis/vim-devicons'                                            " File icons

"
" Language Support
"

" Language specific syntax configuration  (e.g tabs vs spaces)
Plug 'sgur/vim-editorconfig'

"Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" End vim-plug
call plug#end()

"   ________
"  /_  __/ /  ___ __ _  ___
"   / / / _ \/ -_)  ' \/ -_)
"  /_/ /_//_/\__/_/_/_/\__/

" Set 256 colors
set t_Co=256

" Enable termguicolors if set
if (has('termguicolors'))
	set termguicolors
endif

" Enable Syntax Hilighting
syntax on
filetype plugin indent on

if isdirectory(expand(plugdir . "/onedark.vim"))

  " Enable italics
  let onedark_terminal_italic = 1

  " Hide end of buffer filler lines (~)
  let onedark_hide_endofbuffer = 1

  " Set theme to onedark
  colorscheme onedark

endif

"     ____    __  __  _
"    / __/__ / /_/ /_(_)__  ___ ____
"   _\ \/ -_) __/ __/ / _ \/ _ `(_-<
"  /___/\__/\__/\__/_/_//_/\_, /___/
"                         /___/

" General Behaviour

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

" Backups

set nobackup                    " Recomended by coc.nvim not to backup - see #649
set nowritebackup
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Indents

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

" Behaviour

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

" UI

set noshowmode                  " Don't show mode in cmd window
set shortmess=aoOTIc            " Shorten messages, don't show intro and don't pass messages to |ins-completion-menu|.
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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  set signcolumn=number " Recently vim can merge signcolumn and number column into one
else
  set signcolumn=yes
endif

" Characters shown for breaks, tabs, spaces etc
set showbreak=↳\
set listchars=tab:↳\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

"     __ __           ___  _         ___
"    / //_/__ __ __  / _ )(_)__  ___/ (_)__  ___ ____
"   / ,< / -_) // / / _  / / _ \/ _  / / _ \/ _ `(_-<
"  /_/|_|\__/\_, / /____/_/_//_/\_,_/_/_//_/\_, /___/
"           /___/                          /___/

" Set leader key to , unlike \ this key is in the same place across keyboard layouts (win/mac)
let mapleader = ","

" Disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Use ctrl + hjkl to navigate windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-h>  :vertical resize -2<CR>
nnoremap <M-j>  :resize -2<CR>
nnoremap <M-k>  :resize +2<CR>
nnoremap <M-l>  :vertical resize +2<CR>

" Use <Tab> / <S-Tab> in normal mode to move between buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

"     ___   _     ___
"    / _ | (_)___/ (_)__  ___
"   / __ |/ / __/ / / _ \/ -_)
"  /_/ |_/_/_/ /_/_/_//_/\__/
"

if isdirectory(expand(plugdir . "/vim-airline"))

  " Status Line
  let g:airline_skip_empty_sections = 0
  let g:airline#extensions#syntastic#enabled = 0
  let g:airline_detect_iminsert = 0
  let g:airline#extensions#tmuxline#enabled = 0
  let g:airline#extensions#wordcount#enabled = 0
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tagbar#enabled = 1

  " Tab Line
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tabs = 0
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_close_button = 1
  let g:airline#extensions#tabline#buffer_nr_show = 0
  let g:airline#extensions#tabline#fnamemod = ':.'
  let g:airline#extensions#tabline#fnamecollapse = 0

endif

"    _____     _____
"   / ___/__  / ___/
"  / /__/ _ \/ /__
"  \___/\___/\___/

" See coc-settings.json for further configuration.
if isdirectory(expand(plugdir . "/coc.nvim"))

  " Extensions
  let g:coc_global_extensions = [
        \ 'coc-explorer',
        \ 'coc-git',
        \ 'coc-go',
        \ 'coc-json',
        \ 'coc-pairs',
        \ 'coc-toml',
        \ 'coc-snippets',
        \ 'coc-xml',
        \ 'coc-yaml',
        \ ]

  " Colors used for error, warning and info signs in gutters
  hi! CocErrorSign guifg=#E06C75
  hi! CocWarningSign guifg=#E5C07B
  hi! CocInfoSign guifg=#61AFEF

  " Use <Tab> / <S-Tab> to trigger completion with characters ahead and navigate.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
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

" Code Navigation (coc.nvim)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction


  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif

"   _____     _____    ____           __
"  / ___/__  / ___/___/ __/_ __ ___  / /__  _______ ____
" / /__/ _ \/ /__/___/ _/ \ \ // _ \/ / _ \/ __/ -_) __/
" \___/\___/\___/   /___//_\_\/ .__/_/\___/_/  \__/_/
"                            /_/

" See coc-settings.json for further configuration.
if isdirectory(expand(cocextdir . "/coc-explorer"))

  " Set ctrl+e to open coc-explorer
  nmap <leader>e :CocCommand explorer<CR>
  "
  " Set ctrl+E to open coc-explorer in floating mode
  nmap <leader>E :CocCommand explorer --preset floating<CR>

endif

"   _____     _____    ___       _
"  / ___/__  / ___/___/ _ \___ _(_)______
" / /__/ _ \/ /__/___/ ___/ _ `/ / __(_-<
" \___/\___/\___/   /_/   \_,_/_/_/ /___/
"

if isdirectory(expand(cocextdir . "/coc-explorer"))

  autocmd FileType markdown let b:coc_pairs_disabled = ['`']

endif

"   _____     _____    ____     _               __
"  / ___/__  / ___/___/ __/__  (_)__  ___  ___ / /____
" / /__/ _ \/ /__/___/\ \/ _ \/ / _ \/ _ \/ -_) __(_-<
" \___/\___/\___/   /___/_//_/_/ .__/ .__/\__/\__/___/
"                             /_/  /_/

" See coc-settings.json for further configuration.
if isdirectory(expand(cocextdir . "/coc-snippets"))

  " User <TAB> for snippet completion
  let g:coc_snippet_next = '<tab>'

endif

"    ____    ____
"   / __/__ / __/
"  / _//_ // _/
" /_/  /__/_/
"

if isdirectory(expand(plugdir . "/fzf.vim"))

  " Default options
  let $FZF_DEFAULT_OPTS    = '--layout=reverse --info=inline'
  let $FZF_DEFAULT_COMMAND = "rg --files --hidden"

  " :Files command
  command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

  " :Rg command
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)
  "
  " Advanced :RG command
  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

  " Key Bindings
  map <C-f> :Files<CR>
  map <leader>b :Buffers<CR>
  nnoremap <leader>g :Rg<CR>
  nnoremap <leader>t :Tags<CR>
  nnoremap <leader>m :Marks<CR>

  " Extra default bindings
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'
  \ }

  " Enable per command history
  " Use <C-n> for next and <C-p> for previous.
  let g:fzf_history_dir = '~/.local/share/fzf-history'

  " Use ctags
  let g:fzf_tags_command = 'ctags -R'

  " Pane layout
  let g:fzf_layout = {
        \ 'up':'~90%',
        \ 'window': {
          \ 'width':   0.8,
          \ 'height':  0.8,
          \ 'yoffset': 0.5,
          \ 'xoffset': 0.5,
          \ 'highlight': 'Todo',
          \ 'border': 'sharp'
        \ }
      \ }

  " Match theme
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment']
  \ }

endif

"    _____     __
"   / ___/__  / /__ ____  ___ _
"  / (_ / _ \/ / _ `/ _ \/ _ `/
"  \___/\___/_/\_,_/_//_/\_, /
"                       /___/

if isdirectory(expand(plugdir . "/vim-go"))
  " Disable features handled by coc or other plugins like ale
  let g:go_gopls_enabled = 0
  let g:go_code_completion_enabled = 0
  let g:go_def_mapping_enabled = 0
  let g:go_metalinter_enabled = 0
  let g:go_metalinter_autosave_enabled = 0
  let g:go_diagnostics_enabled = 0

  " Syntax highlighting settings
  let g:go_highlight_types = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_generate_tags = 1
  let g:go_highlight_variable_declarations = 1

  " Formatting
  let g:go_fmt_command = "gofumpt"

  " Mappings
  map <leader>gi :GoInstall<cr>
  map <leader>gb :GoBuild -i<cr>
  map <leader>gr :GoRun<cr>
endif

" Orgnaise imports on save
if isdirectory(expand(plugdir . "/coc-go"))
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
endif

"     ____        __         __  ___
"    /  _/__  ___/ /__ ___  / /_/ (_)__  ___
"   _/ // _ \/ _  / -_) _ \/ __/ / / _ \/ -_)
"  /___/_//_/\_,_/\__/_//_/\__/_/_/_//_/\__/

if isdirectory(expand(plugdir . "/indentLine"))

  let g:indentLine_enabled = 1
  let g:indentLine_color_term = 8
  let g:indentLine_char = '↳'
  let g:indentLine_fileTypeExclude = [
    \ 'help',
    \ 'coc-explorer'
    \ ]

endif

"     ____
"    / __/__ ___ _____  ___  ___ ________ _
"   _\ \/ _ `/ // / _ \/ _ \/ _ `/ __/ _ `/
"  /___/\_,_/\_, /\___/_//_/\_,_/_/  \_,_/
"           /___/

if isdirectory(expand(plugdir . "/vim-sayonara"))

  " Set ctrl+x / ctrl+X to close buffers
  nnoremap <C-x> :Sayonara<CR>
  nnoremap <C-X> :Sayonara!<CR>

endif
