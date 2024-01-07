set number
syntax on
inoremap jk <Esc>
set expandtab
set shiftwidth=2
set tabstop=2

" vim plug
call plug#begin()

Plug 'lambdalisue/fern.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" fern.vim
" Ctrl+n to display/hide file tree
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

" fzf.vim
" Ctrl+p to open search files by file names
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<CR>

" Ctrl+g to open search files by words
" <S-?> to display/hide preview
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <C-g> :Rg<CR>
