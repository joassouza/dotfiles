" Plug {{{
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" I have to check it'!
Plug '/usr/local/opt/fzf'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json'
Plug 'embear/vim-localvimrc'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale', { 'commit': 'd837169f1d10f0fee605cc17564c68563db94601' }
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" }}}

" Colors {{{
syntax enable
colorscheme base16-ia-dark
set termguicolors
" }}}

" Spaces & Tabs {{{
set shiftwidth=2
set expandtab
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Set specific config
set modeline
set modelines=5

filetype indent on
" }}}

" Searching{{{
set incsearch " search as characters are entered
set hlsearch " highlight all matches
" }}}

" Leader Shortcuts{{{
let mapleader=" "

" seach not case-sensitive
nnoremap <leader>g /\c

" fast saving
nmap <leader>w :w!<cr>

nmap <leader>f :Ag <cr>
nmap <leader>s :BLines <cr>

" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" show buffers
nnoremap <silent> <expr> <leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"

" show github files
nnoremap <leader>e :GFiles?<CR>

" git status
nnoremap <leader>gs :Gstatus<CR>

" git diff
nnoremap <Leader>gd :Gvdiff<CR>

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" moving around buffers
nnoremap <leader>t :bnext<CR>
nnoremap <leader>r :bprevious<CR>

" close current buffer
nnoremap <leader>q :bd<CR>

" moving around quickfix list
nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprevious<CR>

" }}}

" Ctrl Shortcuts{{{
" close current buffer
nmap <C-x> :bd<cr>
nmap <C-p> :Files<cr>

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
" }}}

" Shift Shortcuts{{{
nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
" }}}

" Folding{{{
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
" }}}

" Backup{{{
set noswapfile
" NOTE: Fix for inotify / webpack detection.
set backupcopy=yes
set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backup//

" }}}

" No Sound{{{
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set noeb vb t_vb=
" }}}

" Autocmd{{{
" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" auto save
autocmd CursorHold,CursorHoldI * update

" save when lose focus
:au FocusLost * :wq<cr>
" }}}

" Misc{{{
" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" lower update time make git gutter better
set updatetime=300

" share the clipboard with OS
set clipboard=unnamed

" force to show the upper status bar - used to show the buffers
set showtabline=2

" necessary to make gf (go to file on js files)
" TODO: we should provide custom for file
set suffixesadd+=.js

" auto reload file when changed outside
" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime
" }}}

" UI Layout {{{
set relativenumber
set number
set showcmd
set cursorline
set wildmenu
set showmatch

" keep the highlight on the line where it was triggered
nmap gd gd``
" }}}

" Plugins - settings{{{

" LightLine {{{"
set laststatus=2
let g:lightline = {
  \   'colorscheme': 'powerline',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': '%3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '|', 'right': '|'
  \}
let g:lightline.subseparator = {
	\   'left': '<', 'right': '>'
  \}

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#unnamed      = '[No Name]'

" let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#filename_modifier = ':t'

let g:lightline#bufferline#number_map = {
\ 0: '0 ', 1: '1 ', 2: '2 ', 3: '3 ', 4: '4 ',
\ 5: '5 ', 6: '6 ', 7: '7 ', 8: '8 ', 9: '9 '}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
" not show 'INSERT' e.g. because we already show in the lightline bar
set noshowmode

" }}}

" Mundo{{{
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo
" }}}

" YouCompleteMe {{{

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 5
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_filetype_blacklist = { 'html': 1 }

" Test
let g:ycm_filepath_blacklist = {
      \ 'html': 1,
      \ 'xml': 1,
      \}
" }}}

" NERDTree {{{
"
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeShowLineNumbers=1
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
" }}}

" UtilSnips{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-c>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/UltiSnips']
" }}}

" Localvimrc {{{
let g:localvimrc_whitelist=[
      \ '/Users/joassouza/etherpad-docker/',
      \ '/Users/joassouza/web/'
      \]
" }}}

" GitGutter {{{
nmap <leader>c <Plug>GitGutterNextHunk zz
nmap <leader>v <Plug>GitGutterPrevHunk zz
" }}}

" Ale {{{

let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F
let g:ale_sign_error = '✖'
nmap <leader>d <Plug>(ale_fix)
" }}}

" Comfortable Motion{{{
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(5)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-5)<CR>
" }}}

" Indent lines{{{
let g:indentLine_enabled = 1
let g:indentLine_color_term = 150
" }}}

" Visual Align{{{
xmap ga <Plug>(EasyAlign)
" }}}

" FZF{{{
set rtp+=/usr/local/opt/fzf
" }}}
" }}}

" Custom Functions Commands{{{
" set branch for gitgutter
command! -nargs=* Sb :call Test(<f-args>)
" }}}

" Custom Function{{{

" run macro over visual lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! Test(stuff)
  let g:gitgutter_diff_base = a:stuff
  GitGutter
  echom "funfa!"
endfunction
" }}}

" Custom Commands{{{
command Bd %bd|e#
" }}}

" set up config for this specific file
" vim:foldmethod=marker:foldlevel=0:foldenable
"
