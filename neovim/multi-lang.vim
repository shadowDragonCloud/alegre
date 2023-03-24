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
set autowrite

" <Leader> 
let mapleader="," 

" paste with system clipboard
vmap <Leader>c "+y
nmap <Leader>c "+yy
nmap <Leader>v "+p

" switch windows
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
inoremap <c-h> <C-\><C-N><C-w>h
inoremap <c-j> <C-\><C-N><C-w>j
inoremap <c-k> <C-\><C-N><C-w>k
inoremap <c-l> <C-\><C-N><C-w>l
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
autocmd InsertLeave *.go,*.sh,*.py write

" quickfix list
nnoremap qn :cnext<CR>
nnoremap qp :cprev<CR>
nnoremap qc :cclose<CR>
nnoremap qo :copen<CR>

" window location list
nnoremap zn :lnext<CR>
nnoremap zp :lprev<CR>
nnoremap zc :lclose<CR>
nnoremap zo :lopen<CR>

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

" terminal
Plug 'skywind3000/vim-terminal-help'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" auto pairs
Plug 'jiangmiao/auto-pairs'

" tag viewer 
Plug 'preservim/tagbar' " should install Universal Ctags or other ctags compatible bin first

" completion
Plug 'Valloric/YouCompleteMe'
Plug 'ncm2/float-preview.nvim'

" multi-lang comment
Plug 'scrooloose/nerdcommenter'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" python
Plug 'tmhedberg/SimpylFold'
Plug 'davidhalter/jedi-vim'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'

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
nnoremap tf :NERDTreeFind<CR> <bar> :wincmd p<CR>
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

" terminal
let g:terminal_key = '<Leader>t'
let g:terminal_height = 15
tnoremap <c-h> <C-\><C-N><C-w>h
tnoremap <c-j> <C-\><C-N><C-w>j
tnoremap <c-k> <C-\><C-N><C-w>k
tnoremap <c-l> <C-\><C-N><C-w>l

" git
" turn on line number highlighting for hunks
let g:gitgutter_highlight_linenrs = 1
" toggle line highlighting for hunks
nnoremap <leader>hl ::GitGutterLineHighlightsToggle<CR>
" jump between hunks
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hb <Plug>(GitGutterPrevHunk)
" to preview a hunk: <Leader>hp

" fuzzy finder
" enable popup mode
" let g:Lf_WindowPosition = 'popup'
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap fd :<C-U><C-R>=printf("Leaderf! rg -e \"%s\" ", expand("<cword>"))<CR>
" on the fly, grep all file contents
noremap <silent> fr :Leaderf rg<CR>
" on the fly, grep all file paths
noremap <silent> ff :Leaderf --popup file<CR>

" pairs
" use '%' in normal mode, to jump between paired-bracket

" tag viewer
nmap <silent> tb :TagbarToggle<CR>
let g:tagbar_width = min([100, winwidth(0) / 7 * 3])
" Only needed if it is not in one of the directories in your $PATH environment variable.
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
"" let g:tagbar_use_cache = 0 " required when use snap ctags
"let g:tagbar_type_go = {
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [
"        \ 'p:package',
"        \ 'i:imports:1',
"        \ 'c:constants',
"        \ 'v:variables',
"        \ 't:types',
"        \ 'n:interfaces',
"        \ 'w:fields',
"        \ 'e:embedded',
"        \ 'm:methods',
"        \ 'r:constructor',
"        \ 'f:functions'
"    \ ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : {
"        \ 't' : 'ctype',
"        \ 'n' : 'ntype'
"    \ },
"    \ 'scope2kind' : {
"        \ 'ctype' : 't',
"        \ 'ntype' : 'n'
"    \ },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"\ }

" markdown
map <silent> <F5> <Plug>MarkdownPreview
map <silent> <F6> <Plug>StopMarkdownPreview

" vim-go
" hightling
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
" go to def
let g:go_def_mode = 'gopls'
let g:go_def_mapping_enabled = 0
autocmd FileType go nmap gd <Plug>(go-def-tab)
autocmd FileType go nmap gw <Plug>(go-def)
" autocmd FileType go nmap gds <Plug>(go-def-split)
" autocmd FileType go nmap gdv <Plug>(go-def-vertical)
autocmd FileType go nmap gt <Plug>(go-def-type-tab)
" format
let g:go_fmt_command = "goimports"
" let g:go_fmt_command="gopls"
" gofumpt is not support by go1.16
" let g:go_gopls_gofumpt=1
" lint
" default is staticcheck
"let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'revive', 'errcheck']
"let g:go_metalinter_deadline = 5s
let g:go_list_type = "quickfix"
" debug
" tips: if encounter file not found error, can check if path contains symlink
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 50vnew',
      \ 'stack':      'rightbelow 10new',
      \ }
" other config
let g:go_version_warning = 1
let g:go_auto_type_info = 1

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)

" completion
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" enrich identifier completer content
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_gopls_binary_path = "gopls"
" use gopls daemon server
let g:ycm_gopls_args = ["-remote=auto"]
" complete menu
set completeopt=menuone
let g:float_preview#docked=0
" snippets
let g:ultisnipsexpandtrigger = "<tab>"

"
" python
"
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
"autocmd FileType python let g:jedi#goto_command = "gd"
let g:jedi#goto_command = "gd"
" open the go-to function in split, not another buffer
"let g:jedi#use_splits_not_buffers = "right"
let g:jedi#use_tabs_not_buffers = 1

" format python code when save buffer
autocmd BufWritePre *.py undojoin | Neoformat

" python linters
let g:neomake_python_enabled_makers = ['pylint']
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
autocmd FileType python call neomake#configure#automake('nrwi', 500)
"let g:neomake_open_list = 2
