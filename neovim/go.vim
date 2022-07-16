"
" when used on a new machine:
" 0. for terminal, recommend to use solarized pallete
" 1. change tagbar_ctags_bin
" 2. change $TRRM env variable to your terminal type
"
" --- config begin ---
"
" vim native configs
"
set nocompatible

" set cursorline
" set cursorcolumn 
set number
set showmatch " show brackets match
set autoindent
" tab
set tabstop=4
set expandtab
set shiftwidth=4
" function fold
set foldmethod=indent
set foldlevelstart=99 " default not fold
set incsearch
syntax enable
filetype plugin indent on
set mouse=a

" <Leader> 
let mapleader="," 

" paste with system clipboard
vmap <Leader>c "+y
nmap <Leader>c "+yy
nmap <Leader>v "+p

" switch windows
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
nnoremap <silent> gb <C-o>

" switch tab
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 8gt
nnoremap <Leader>0 :tablast<CR>

" aoto write buffer
autocmd InsertLeave *.go,*.sh write

"
" vim-plug
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" vim color scheme
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'crusoexia/vim-monokai'
" Plug 'acarapetis/vim-colors-github'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" file system explorer
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fuzzy finder
Plug 'Yggdroot/LeaderF' , { 'do': './install.sh' }

" auto pairs
Plug 'jiangmiao/auto-pairs'

" tag viewer 
Plug 'majutsushi/tagbar'

" markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" completion
Plug 'Valloric/YouCompleteMe'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" debugger
Plug 'sebdah/vim-delve'

" Initialize plugin system
call plug#end()

" color scheme
let $TERM="iterm2"
"
" color scheme one config, begin
"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  "if (has("nvim"))
  "  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  "  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:one_allow_italics = 1 " enable italics
colorscheme one
set background=dark
"" color scheme one config, end
""
"" color scheme solarized config, begin
""
"set notermguicolors
"colorscheme solarized
"set background=dark
"" color scheme solarized config, end
""
"" color scheme solarized8 config, begin
""
"set termguicolors
"colorscheme solarized8
"set background=dark
"" color scheme solarized config, end

"status line
" enalbe to display all buffers on the top when there is only one tab
let g:airline#extensions#tabline#enabled = 1
" enable powerline font symbols
let g:airline_powerline_fonts = 1
" set airline theme
let g:airline_theme='one'

" file system explorer
nnoremap <c-t> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=0
" let NERDTreeWinSize=31
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeShowBookmarks=1

let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeGitStatusShowIgnored = 1

" fuzzy finder
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap fd :<C-U><C-R>=printf("Leaderf! rg -e \"%s\" ", expand("<cword>"))<CR>
" on the fly, grep all file contents
noremap <silent> fr :Leaderf rg<CR>
" on the fly, grep all file paths
noremap <silent> ff :Leaderf file<CR>

" tag viewer
let g:tagbar_width=100
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
"" let g:tagbar_use_cache = 0 " required with snap ctags
nmap <silent> tb :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" markdown
map <silent> <F5> <Plug>MarkdownPreview
map <silent> <F6> <Plug>StopMarkdownPreview

" vim-go
set autowrite
"let g:go_fmt_command = "goimports"
let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1
" let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
" let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
"let g:go_metalinter_deadline = 5s

" go def
let g:go_def_mode = 'gopls'
let g:go_def_mapping_enabled = 0
autocmd FileType go nmap gd <Plug>(go-def-tab)
autocmd FileType go nmap gdd <Plug>(go-def)
autocmd FileType go nmap gds <Plug>(go-def-split)
autocmd FileType go nmap gdv <Plug>(go-def-vertical)
autocmd FileType go nmap gt <Plug>(go-def-type-tab)

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" ycm
let g:ycm_key_list_select_completion = ['<C-n>', '<space>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
set completeopt=menuone

" snippets
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
