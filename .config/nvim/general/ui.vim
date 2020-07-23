" -----------------------------------------------------------------------------
" Theme / Color Settings
" -----------------------------------------------------------------------------

" Set background and support 256 colors
set background=light
set t_Co=256

" Enable termguicolors if set
if (has('termguicolors'))
	set termguicolors
endif

" Color Scheme configuration
let g:nord_uniform_status_lines=0

" Set Color Scheme
colorscheme nord

" Enable syntax highlighting
syntax on
filetype plugin indent on

" -----------------------------------------------------------------------------
" Airline
" -----------------------------------------------------------------------------

" Status line
let g:airline_skip_empty_sections = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline_detect_iminsert = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1

" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0

" Linting using ale
let g:airline#extensions#ale#enabled = 1

" -----------------------------------------------------------------------------
" Indent Highlighting
" -----------------------------------------------------------------------------

let g:indentLine_enabled = 1
let g:indentLine_color_term = 8
let g:indentLine_char = '⤷'
let g:indentLine_fileTypeExclude = [
  \ 'help',
  \ 'coc-explorer'
  \ ]
