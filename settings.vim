"########################################
" vim init settings
" author: yunfan
"########################################
syntax on
filetype plugin indent on

"########################################
"" Settings
"########################################
hi cursorline cterm=none term=none
hi cursorlinenr ctermfg=yellow term=none cterm=none
" set line number to dark grey
hi LineNr ctermfg=DarkGrey

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
    fun! ReloadVimrc()
        let save_cursor = getcurpos()
        source $MYVIMRC
        call setpos('.', save_cursor)
    endfun
endif
" auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC call ReloadVimrc()

" access system clipboard
vmap '' :w !pbcopy<CR><CR>

" change cursor in insert and normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

au BufNewFile,BufRead *.js, *.html, *.css
    \set tabstop=2
    \set softtabstop=2
    \set shiftwidth=2

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,WinEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,WinLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Minimal Config
" display a tab as ">----"
" set listchars=tab:>-,trail:-,nbsp:_
set listchars=tab:\ \ ,trail:-,nbsp:_
set list
set smartindent
" Consistency
set backspace=indent,eol,start          " improving backspace
set nocompatible
set hls
set encoding=utf8
set incsearch
set ic
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              	                " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0                      " So that I can see `` in markdown files
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard+=unnamedplus              " Copy paste between vim and everything else
set t_Co=256
set textwidth=79
" set colorcolumn=+1                      " highlight column after textwidth

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:rainbow_active=1

" disable auto insert commenter
au BufEnter * set fo-=c fo-=r fo-=o fo-=t
" auto remove training space
autocmd BufWritePre * %s/\s\+$//e
" Allows directory/project specific vimrc
set exrc
set secure
set foldmethod=indent
set nofoldenable

syntax on
colorscheme monokai
