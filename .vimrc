" Semir Tursunovic 
" L78 - Uncomment to write spaces instead of tab
" Vimplug {{{
augroup vimrc
  autocmd!
augroup END
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimrc VimEnter * PlugInstall
endif
" }}}
" Plugins  {{{
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/Conque-GDB'
Plug 'tpope/vim-sensible'
Plug 'sjl/gundo.vim'
" Plug 'lyuts/vim-rtags'
"Plug Shougo/neocomplete.vim
"Plug Shougo/neosnippet.vim
"Plug Shougo/neosnippet-snippets
"Plug Shougo/vimshell.vim
"Plug Shougo/vimproc.vim
"Plug 'kana/vim-smartinput'
Plug 'Valloric/YouCompleteMe'
Plug 'blerins/flattown'
Plug 'bling/vim-airline'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kien/ctrlp.vim'
" Plug 'marijnh/tern_for_vim', { 'for': ['javascript'] }
" Plug 'mattn/emmet-vim', { 'for': [ 'html', 'css', 'sass', 'less' ] }
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'osyo-manga/vim-over'
Plug 'jiangmiao/auto-pairs'
Plug 'schickling/vim-bufonly'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'Wolfy87/vim-enmasse'
Plug 'Yggdroot/indentLine'
Plug 'epeli/slimux'
Plug 'tpope/vim-dispatch'
Plug 'EricR86/vim-firefox-autorefresh'
Plug 'tpope/vim-rails'
Plug 'honza/dockerfile.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'gorodinskiy/vim-coloresque'
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/vim-clang-format'
Plug 'terryma/vim-multiple-cursors'
Plug 'dahu/vim-asciidoc'
Plug 'dahu/vimple'
Plug 'dahu/Asif'
Plug 'vim-scripts/SyntaxRange'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'richq/vim-cmake-completion'
Plug 'dyng/ctrlsf.vim'
"Plug 'bbchung/clighter'
Plug g:plug_home.'/eclim'
call plug#end()
" }}}
" Basics {{{
syntax on
runtime! ftplugin/man.vim
filetype plugin indent on
let mapleader=" "       " leader is space 
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set modeline
set rnu              " show line numbers
set modelines=1
" set commentstring=//\ %s
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
" ,, is escape
inoremap ,, <esc>
:map <F5> :setlocal spell! spelllang=en_us<CR>
" hide buffer
nnoremap <leader>h :hide<cr>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>rW mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" cd to change to open directory.
map <leader>cd :cd %:p:h<cr>
no / /\v
set mouse=a
set lazyredraw
set synmaxcol=180
" }}}
" Colors {{{
" colorscheme badwolf         " awesome colorscheme
colorscheme flattown " awesome colorscheme
set t_Co=256
" }}}
" Window movement {{{
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <leader>- <c-w>_ " Max height
nnoremap <leader>\ <c-w><bar> " Max width leader+|
nnoremap <leader>= <c-w>= " Fair defaults
nnoremap <silent> <Leader>whi :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>whd :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>wwi :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>wwd :exe "vertical resize " . (winheight(0) * 2/3)<CR>

" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=0   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=syntax   " fold based on indent level
" space open/closes folds
nnoremap <leader>of za
" }}}
" Clipboard {{{
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" }}}
" Search and highlight {{{
" turn off search highlight
set hlsearch
nnoremap <leader>nh :nohlsearch<CR>
" highlight last inserted text
nnoremap gV `[v`]
" }}}
" Misc {{{
" toggle gundo
nnoremap <leader>tU :GundoToggle<CR>
nnoremap <leader>tN :call ToggleNumber()<CR>
nnoremap <leader>rR :Dispatch! "rdm"<CR>
" edit vimrc/bashrc and load vimrc bindings
nnoremap <leader>eV :vsp $MYVIMRC<CR>
nnoremap <leader>eB :vsp ~/.bashrc<CR>
nnoremap <leader>sV :source $MYVIMRC<CR>
set mouse=a
set completeopt=longest,menuone
" }}}
"Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Persistent Undo {{{
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of set changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufWritePost *.html :silent exec "!MYWINDOW=$(xdotool getactivewindow);xdotool search 'Navigator' windowactivate key 'ctrl+r' &> /dev/null;xdotool search --onlyvisible --class 'Chrome' windowfocus key 'ctrl+r' &> /dev/null;xdotool windowfocus --sync ${MYWINDOW};xdotool windowactivate --sync ${MYWINDOW}"
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.asciidoc setlocal spelllang=hr,en_us
    autocmd BufEnter *.asciidoc setlocal spell
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh,*.rb setlocal tabstop=2
    autocmd BufEnter *.sh,*.rb setlocal shiftwidth=2
    autocmd BufEnter *.sh,*.rb setlocal softtabstop=2
    au BufNewFile,BufRead *.gradle set filetype=groovy

    autocmd BufEnter *gitconfig setf gitconfig
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    autocmd BufEnter *.json setl filetype=javascript
    autocmd BufEnter *.less setl filetype=less
    autocmd InsertLeave * set nopaste
    autocmd VimResized * :wincmd =
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
    autocmd FocusLost,BufLeave,WinLeave * call feedkeys("\<C-\>\<C-n>")
    autocmd FocusLost * let g:oldmouse=&mouse | set mouse=
    autocmd FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
    autocmd FileType javascript setlocal omnifunc=tern#Complete
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END
" }}}
" Custom Functions {{{

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! RefreshBrowserWindow()
  execute "!xdotool search 'Navigator' windowactivate key 'ctrl+r'"
endfunction


" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
"" Tmux {{{
if exists('$TMUX') " allows cursor change in tmux mode
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"" }}}
"Tabs
nnoremap <Left> :tabp<CR>
nnoremap <Right> :tabn<CR>
nnoremap <Up> :tabfirst<CR>
nnoremap <Down> :tablast<CR>
nnoremap tn :tabe<space>
" Plugins Gonfiguration
" Ultisnips {{{
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger="<c-j>"
" }}}
" YCM {{{
"let g:ycm_key_list_previous_completion = []
"let g:ycm_key_list_select_completion = []
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
" }}}
" Neocomplete {{{
if exists('g:neocomplete') 
  "let g:neocomplete#enable_omni_fallback = 1
  "let g:neocomplete#fallback_mappings =  ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 2
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplete#enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplete#enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  " Enable heavy omni completion.
  " if !exists('g:neocomplete#sources#omni#input_patterns')
  "   let g:neocomplete#sources#omni#input_patterns = {}
  " endif
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#force_omni_input_patterns.cpp= '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:neocomplete#force_omni_input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
  let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.java = '\%(\h\w*\|)\)\.\w*'
  let g:neocomplete#force_omni_input_patterns.java = '\%(\h\w*\|)\)\.\w*'
endif
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" }}}
" NeoSnippet {{{ 
" Plugin key-mappings.
if exists('g:neosnippet')
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
endif
" }}}
" NERDTree {{{
let g:NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr','\.class','\.o']
map <C-n> :NERDTreeToggle <CR>
" }}}
" Clang Format {{{
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
" map to <Leader>cf in C++ code
let g:clang_format#command="clang-format-3.4"
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" }}}
" CtrlP {{{
let g:ctrlp_extensions = ['tag']
nnoremap <Leader>lf :CtrlP<CR>
nnoremap <Leader>lb :CtrlPBuffer<CR>
nnoremap <Leader>lq :CtrlPTag<CR>
let g:ctrlp_working_path_mode = 0
" }}}
" Airline {{{
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
" }}}
" Indentline {{{
let g:indentLine_char = '│'
let g:indentLine_color_term = 16
" }}}
" Syntastic {{{
"let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_echo_current_error = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_signs = 1
let g:syntastic_cpp_compiler_options = '-std=c++11 '
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_cpp_check_header = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚑"
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }
nnoremap <C-w>E :SyntasticCheck<CR>
"let g:syntastic_error_symbol = 'E'
"let g:syntastic_style_error_symbol = 'E'
"let g:syntastic_style_warning_symbol = 'W'
"let g:syntastic_warning_symbol = 'W'
" }}}
" Signify {{{
let g:signify_vcs_list = ['git']
let g:signify_sign_add = '⨁'
let g:signify_sign_delete = '⨴'
let g:signify_sign_delete_first_line = '⨂'
let g:signify_sign_change = '⨸'
let g:signify_sign_changedelete = '⨂'
" }}}
" Vimshell {{{
if exists('g:vimshell_prompt')
  nmap <Space>vs <Plug>(vimshell_split_switch)
  nmap <space>vS <Plug>(vimshell_split_switch)<Plug>(vimshell_hide)
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  let g:vimshell_prompt =  '$ '
  let g:vimshell_split_command = 'split'
endif
" }}}
" Multiple cursors {{{
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
" }}}
" ACK {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}
" ClangComplete {{{
if exists('g:clang_auto_select')
  let g:clang_complete_auto = 0
  let g:clang_auto_select = 0
  let g:clang_use_library=1
  let g:clang_library_path='/usr/lib/llvm-3.4/lib/'
  let g:clang_complete_auto = 0
  let g:clang_conceal_snippets=1
  let g:clang_complete_copen=1
  let g:clang_user_options='-std=c++11'
  let g:clang_complete_hl_errors=0
  let g:clang_complete_macros=1
endif
" }}}
" Eclim {{{
let g:EclimCompletionMethod = 'omnifunc'
autocmd FileType java :nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
autocmd FileType java :nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
autocmd FileType java :nnoremap <silent> <buffer> <leader>rj :JavaSearchContext<cr>
autocmd FileType java :nnoremap <silent> <buffer> <leader>c :JavaCorrect<cr>
autocmd FileType java :nnoremap <silent> <buffer> <leader>v :Validate<cr>
let g:EclimBrowser = 'firefox'
let g:EclimJavaSearchSingleResult = 'edit'
" }}}
" Tern {{{
let g:tern#command = ["nodejs", expand('<sfile>:h') . '/../node_modules/tern/bin/tern', '--no-port-file']
" }}}
" Multiple Cursors {{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-i>'
let g:multi_cursor_quit_key='<Esc>'
" }}} vim: foldmethod=marker: foldlevel=0: 
"
" Switch case indention
:set cinoptions ==0
" autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
