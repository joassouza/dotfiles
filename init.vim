call plug#begin(stdpath('data') . '/plugged')
" Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'senran101604/neotrix.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json'
Plug 'chemzqm/vim-jsx-improve'
Plug 'embear/vim-localvimrc'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'ntk148v/vim-horizon'
Plug 'hashivim/vim-terraform'
Plug 'yuezk/vim-js'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jnurmine/Zenburn'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" Colors {{{
syntax on
set t_Co=256
" dark default
colorscheme dracula

" light
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

" Smart Removal{{{
set inccommand=split
" }}}

" Leader Shortcuts{{{
let mapleader=" "

" auto indent on paste
nnoremap p p=`]

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

" gd is kept on the line was called
nmap gd gd``
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

" Diff{{{
set diffopt+=internal,algorithm:patience
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

" using a plugin now
" auto save
" let g:auto_save = 1  " enable AutoSave on Vim startup
" augroup tf
"   au!
"   au FileType tf let b:auto_save = 0
" augroup END
" autocmd CursorHold,CursorHoldI * update

" Misc{{{
" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" lower update time make git gutter better
set updatetime=600

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
" }}}
"

" Plugins - settings{{{

" LightLine {{{"
set laststatus=2
let g:lightline = {
  \   'colorscheme': 'horizon',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified', 'lineinfo' ]
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
" let g:ycm_min_num_of_chars_for_completion = 5
" let g:ycm_min_num_identifier_candidate_chars = 4
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" " Don't show YCM's preview window [ I find it really annoying ]
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_filetype_blacklist = { 'html': 1 }

" " Test
" let g:ycm_filepath_blacklist = {
"       \ 'html': 1,
"       \ 'xml': 1,
"       \}
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
nmap <leader>c <Plug>(GitGutterNextHunk) zz
nmap <leader>v <Plug>(GitGutterPrevHunk) zz
" }}}

" Ale {{{

let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F
let g:ale_sign_error = '✖'
let g:ale_ruby_rubocop_executable = 'bundle'
" let g:ale_completion_enabled = 1
let g:ale_fixers = {
      \    '*': ['remove_trailing_lines', 'trim_whitespace'],
      \    'javascript': ['eslint', 'prettier'],
      \    'ruby': ['rubocop'],
      \}
let g:ale_linters = {
 \ 'javascript': ['eslint'],
 \ 'ruby': ['rubocop']
 \}

" let g:ale_ruby_rubocop_executable = '/Users/joas/.rvm/gems/ruby-2.7.2/gems/rubocop-1.11.0/exe/rubocop'
nmap <leader>, <Plug>(ale_fix)
" }}}

" Comfortable Motion{{{
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(5)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-5)<CR>
" }}}

" Indent lines{{{
let g:indentLine_enabled = 1
let g:indentLine_color_term = 150
let g:indentLine_setConceal = 0
let g:vim_json_syntax_conceal = 0
" }}}

" Visual Align{{{
xmap ga <Plug>(EasyAlign)
" }}}

" FZF{{{
set rtp+=/usr/local/opt/fzf
" }}}

" easy-motion{{{
let g:EasyMotion_do_mapping = 0 " Disable default mapping
nmap <leader>g <Plug>(easymotion-overwin-f)
" }}}

" }}}

" Custom Functions Commands{{{
" set branch for gitgutter
command! -nargs=* Sb :call SetBranch(<f-args>)
" }}}
"
" let g:terraform_align=1
" let g:terraform_fold_sections=1
" let g:terraform_fmt_on_save=0

" Custom Function{{{

" run macro over visual lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! SetBranch(branch_base)
  let g:gitgutter_diff_base = a:branch_base
  GitGutter
  echo "branch base is " . a:branch_base "!"
endfunction
" }}}

" Custom Commands{{{
command! Bd %bd|e#

" Save stuff!
au FocusLost * :wa
set autowriteall
  " command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" }}}

" set up config for this specific file
" vim:foldmethod=marker:foldlevel=0:foldenable

" Testing{{{
" shortcut to delete in the black hole register
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" shortcut to paste but keeping the current register
vnoremap <leader>p "_dP
" }}}
"
" Coc{{{
nmap <silent> gD <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
