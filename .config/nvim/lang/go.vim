" -----------------------------------------------------------------------------
" Golang Settings
" -----------------------------------------------------------------------------

" Orgnaise imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" -----------------------------------------------------------------------------
" vim-go settings
" -----------------------------------------------------------------------------

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
let g:go_fmt_command = "goimports"

" Mappings
map <leader>gi :GoInstall<cr>
map <leader>gb :GoBuild -i<cr>
map <leader>gr :GoRun<cr>
