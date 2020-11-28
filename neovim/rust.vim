"
" vim-plug
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" *** tree ***
Plug 'scrooloose/nerdtree'
map <C-t> :NERDTreeToggle<CR>

" *** auto pairs ***
Plug 'jiangmiao/auto-pairs'

" *** status line ***
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

" *** git ***
Plug 'tpope/vim-fugitive'

" *** LanguageClient-neovim ***
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'zsh install.sh',
    \ }

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" The following two maps will slow [h]&[l] cursor move on mac, comment them
" nnoremap <silent> ho :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> lr :call LanguageClient#textDocument_references()<CR>
:command Rename :call LanguageClient#textDocument_rename()
:command Format :call LanguageClient#textDocument_formatting()
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gb <C-o>

" *** completion ***
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" rust completion source
Plug 'ncm2/ncm2-racer'

" *** fuzzy finder ***
Plug 'Yggdroot/LeaderF' , { 'do': './install.sh' }
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap fd :<C-U><C-R>=printf("Leaderf! rg -e \"%s\" ", expand("<cword>"))<CR>
" on the fly, grep all file contents
noremap <silent> fr :Leaderf rg<CR>
" on the fly, grep all file paths
noremap <silent> ff :Leaderf file<CR>

" *** tag viewer ***
Plug 'majutsushi/tagbar'
let g:tagbar_width=100
let g:tagbar_use_cache = 0 " required with snap ctags
nmap <silent> tb :TagbarToggle<CR>
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/snap/bin/ctags', " change this line to ctags path
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

" Initialize plugin system
call plug#end()

" switch windows
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

set number
syntax on
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4

" function fold
set foldmethod=indent
set foldlevelstart=99 " default not fold
