" -----------------------------------------------------------------------------
" Ale Settings
" -----------------------------------------------------------------------------

let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linters = {
  \ 'go': ['golint','govet','golangci-lint'],
  \}

hi! ALEErrorSign guifg=#E06C75
hi! ALEWarningSign guifg=#E5C07B
