" Load plugins
lua require('plugins')

" Load config
lua require('set')
lua require('let')
lua require('mappings')

colorscheme gruvbox

" <--------------------->
" @      Mappings       @
" <--------------------->

" Esc
imap fd <ESC>

" Movement
nmap j gj
nmap k gk

" Window
nnoremap <leader>w <C-w>

" Vimrc
nnoremap <leader>ev :vsp $MYVIMRC <CR>
nnoremap <leader>sv :source $MYVIMRC <CR>

" Buffer
nnoremap <leader>bn :bn <CR>
nnoremap <leader>bp :bp <CR>
nnoremap <leader>bd :bd <CR>
nnoremap <leader>ba :ba <CR>
nnoremap <leader>ls :ls <CR>

" Netrw
nnoremap - :call <SID>opendir('edit')<CR>

function! s:opendir(cmd) abort
  if &filetype ==# 'netrw' && len(s:netrw_up)
    let basename = fnamemodify(b:netrw_curdir, ':t')
    execute s:netrw_up
    call s:seek(basename)
  elseif expand('%') =~# '^$\|^term:[\/][\/]'
    execute a:cmd '.'
  else
    execute a:cmd '%:h' . (expand('%:p') =~# '^\a\a\+:' ? s:slash() : '')
    call s:seek(expand('#:t'))
  endif
endfunction

function! s:seek(file) abort
  if get(b:, 'netrw_liststyle') == 2
    let pattern = '\%(^\|\s\+\)\zs'.escape(a:file, '.*[]~\').'[/*|@=]\=\%($\|\s\+\)'
  else
    let pattern = '^\%(| \)*'.escape(a:file, '.*[]~\').'[/*|@=]\=\%($\|\t\)'
  endif
  call search(pattern, 'wc')
  return pattern
endfunction
