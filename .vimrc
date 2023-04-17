syntax enable  " enable syntax processing
set tabstop=4  " for viewing
set softtabstop=2  " for editing
set shiftwidth=2
set expandtab  "tabs are spaces

set number " show line number
set cursorline " show line cursor is on
set wildmenu " show menu for auto complete commands
set showmatch " Highlight matching parenthesis

" use visual mouse mode (to copy, select text, press y, place cursor, press p)
" to paste text from outside, select it, enter inset mode and hold shift while
" pressing the two mouse keys
set mouse=a

" turn off search highlight with space (leader is \)
nnoremap <leader><space> :nohlsearch<CR>


" Automatically switch to paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

set autoindent "keep indentation level

" Get rid of auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" change title so that it shows the current file being edited
autocmd BufEnter * let &titlestring = $USER . "@" . hostname() . ': ' . expand("%:t")             
set title

" Copy to system clipboard
set clipboard=unnamedplus

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set nocp
filetype plugin on

augroup python_ft
  au!
  autocmd BufNewFile,BufRead *.py   set colorcolumn=80
augroup END

" syntax highlighting for rat-pac files
autocmd BufNewFile,BufRead *.geo,*.ratdb,*.inline set syntax=cpp

autocmd BufNewFile,BufRead *.tsx,*.ts set syntax=javascript
