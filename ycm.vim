nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gr :YcmCompleter GoToReference<CR>

" turn off hover info
let g:ycm_auto_hover = ''

" K to toggle info
let s:lsp_ft_maps = 'gdscript,go,python'
augroup ycm_settings | au!
        exe printf('au FileType %s call Ycm_mappings()', s:lsp_ft_maps)
augroup end

func! Ycm_mappings() abort
        nmap <silent><buffer> K <plug>(YCMHover)
        nnoremap <silent><buffer> gd :YcmCompleter GoTo<CR>
endfunc

" turn of the ugly info
let g:ycm_confirm_extra_conf = 0

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_show_diagnostics_ui = 0
let g:syntastic_ignore_files=[".*\.py$"]

autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" change preview windows color
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_cache_omnifunc=0
let g:ycm_error_syymbol = '>>'
let g:ycm_warning_symbol= '>*'
let g:ycm_key_invoke_completion='<S-Space>'
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:SuperTabClosePreviewOnPopupClose = 1

" disable auto hover
let g:ycm_auto_hover=''
let s:lsp_ft_maps = 'python'
