" -----------------------------------------------------------------------------
" Plugins (via vim-plug)
" -----------------------------------------------------------------------------

" Vim / Neovim support
let plugdir = "~/.vim/plugged"
if has('nvim')
  let plugdir = "~/.config/nvim/autoload/plugged"
endif

" Auto Install
if empty(glob(plugdir))
  silent "!curl -fLo " . plugdir . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Start vim-plug
call plug#begin(plugdir)

" Theme
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense
Plug 'w0rp/ale'                                 " Linting
Plug 'Yggdroot/indentLine'                      " Indentation Highlighting
Plug 'sgur/vim-editorconfig'                    " Language specific syntax configuration  (e.g tabs vs spaces)
Plug 'tmux-plugins/vim-tmux-focus-events'       " Add support for tnmux focus events
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}   " Buffer deletion
Plug 'vim-airline/vim-airline'                  " Status / Tabline
Plug 'vim-airline/vim-airline-themes'           " Themes for airline

" Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Languages
Plug 'fatih/vim-go'           " Go
Plug 'hashivim/vim-terraform' " Terraform
Plug 'jparise/vim-graphql'       " GraphQL

" End vim-plug
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \ | PlugInstall --sync | q
  \ | endif
