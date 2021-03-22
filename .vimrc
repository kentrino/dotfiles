" vim-plug settings ========================================================
call plug#begin('~/.vim/plugged')

" Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'

" vim lsp setting
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" customize status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" setting status bar =======================================================
let g:airline_theme='wombat'

" color scheme =============================================================
syntax enable
colorscheme OceanicNext

" share clipboad with Mac ==================================================
set clipboard+=unnamed

" tab settings =============================================================
" tab size
set tabstop=2 

" replace tab with spaces
set expandtab

" auto-indent size
set shiftwidth=2

" show line number =========================================================
set number
highlight LineNr ctermbg=234 ctermfg=242

" Emacs like keybindings ===================================================
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

inoremap <C-n> <Down>
inoremap <C-p> <UP>

inoremap <C-h> <BS>
inoremap <C-d> <delete>

inoremap <C-k> <C-r>=<SID>kill_line()<CR>

function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! s:split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.') - 2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction
