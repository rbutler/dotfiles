" set nocompatible
" syntax on
" filetype off


" New Dein.vim shit
if &compatible
    set nocompatible
endif

"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"set rtp+=/usr/local/opt/fzf



"set runtimepath+=$HOME/dein.vim/repos/github.com/Shougo/dein.vim
  Plug('wincent/Command-T')
  "Plug('thoughtbot/vim-rspec')

  " My bundles here:
  " original repos on GitHub
  "Plug('Shougo/vimproc.vim', {'build' : 'make'})
  "NeoBundle 'eagletmt/ghcmod-vim'

  Plug('majutsushi/tagbar')
  Plug('altercation/vim-colors-solarized')
  "Plug('eagletmt/neco-ghc')
  Plug('Shougo/neocomplete.vim')
  Plug('pbrisbin/vim-syntax-shakespeare')
  Plug('vitalk/vim-simple-todo')
  Plug('fatih/vim-go')
  Plug('tpope/vim-fugitive')
  Plug('junegunn/fzf')
  Plug('junegunn/fzf.vim')
  " Plug('adaszko/intero.vim')
  "Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
  "Plug('SirVer/ultisnips')
  " Haskell
  " Plug('neovimhaskell/haskell-vim')
  "Plug('eagletmt/ghcmod-vim')
  " Plug('Lokaltog/vim-easymotion')
  " Plug('gberenfield/cljfold.vim')
  "NeoBundle 'ShowMarks7'
  "NeoBundle 'vim-scripts/php.vim--Hodge'
  Plug('vim-scripts/vimwiki')
  Plug('octol/vim-cpp-enhanced-highlight')
  " Ruby!
  Plug('vim-ruby/vim-ruby')
  Plug('tpope/vim-rails')
  Plug('mileszs/ack.vim')
  "Plug('jceb/vim-orgmode')
  "Plugin 'scrooloose/syntastic'
  "Plugin 'vim-scripts/AutoFold.vim'
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  "Plugin 'tpope/vim-rails.git'
  " vim-scripts repos
  " Plugin 'L9'
  " Plugin 'FuzzyFinder'
  " Plugin 'Valloric/YouCompleteMe'
  " non-GitHub repos
  Plug('scrooloose/nerdtree')
  "Trying ctrlp
  "Plug('ctrlpvim/ctrlp.vim')
  Plug('pangloss/vim-javascript')

" Initialize plugin system
call plug#end()

"TODO - verify that rspec from vim works
"map <Leader>rt :call RunCurrentSpecFile()<CR>
"map <Leader>rs :call RunNearestSpec()<CR>
"map <Leader>rl :call RunLastSpec()<CR>
"map <Leader>ra :call RunAllSpecs()<CR>
"let g:rspec_command = "!bundle exec rspec {spec}"
"let g:rspec_runner = "os_x_iterm"

nnoremap <silent> <Leader>b :TagbarToggle<CR>

"TODO - improve on commandt (using tags yo)
map <Leader>e :CommandTTag<CR>



filetype plugin indent on
syntax enable



"" END plugin setup

"" Ryan is adding now
nmap <C-h> :GhcModType<CR>
let g:acp_enableAtStartup = 0
" Use neocomplete.
" I disabled this one
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_auto_select = 0
let g:neocomplcache_auto_completion_start_length=2

" sytastic checkers
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_php_checkers = ['php']
let g:vimwiki_list = [{'path': '~/vimwiki/','path_html': '~/vimwiki_html'}]

" set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?
"
" colorscheme Tomorrow-Night

"au BufWinLeave * mkview
"au BufWinEnter * silent loadview 
au FileType php setl foldmethod=syntax
au FileType clj setl foldmethod=syntax
" au FileType go setl foldmethod=syntax
" au FileType go setl foldnestmax=1
" to hopefully not save folds in go
let g:go_fmt_experimental = 1
let g:go_list_type = "quickfix"
let g:go_list_autoclose = 1

set scrolloff=3
set smartindent
"set et
"set shiftwidth=2
"set viminfo='20,\"50
"set smarttab
set history=100
set ruler
set nocompatible
set wrap
set nu
set hls
set ts=4
set shiftwidth=4
set expandtab

:set laststatus=2
"set statusline=%F%m%r%h%w\ [%Y\]\ [%l/%L\ (%p%%)]

set wildmenu
set wildmode=list:longest,full

"autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeShowHidden=1

" python
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set expandtab
autocmd BufRead *.py set sw=2
autocmd BufRead *.py set ts=2
autocmd BufRead *.py set sts=2

nnoremap <SPACE> <Nop>
"let mapleader = "\<Space>" 
"map <Space> <Leader>
let mapleader = ","
let g:UltiSnipsExpandTrigger="<leader>t"
"let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
"let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
"let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
"let g:ycm_complete_in_comments = 1 " Completion in comments
"let g:ycm_complete_in_strings = 1 " Completion in string

" Here's the vimclojure stuff. You'll need to adjust the NailgunClient
" setting if you're on windows or have other problems.
" let vimclojure#FuzzyIndent=1
" let vimclojure#HighlightBuiltins=1
" let vimclojure#HighlightContrib=1
" let vimclojure#DynamicHighlighting=1
" let vimclojure#ParenRainbow=1
" let vimclojure#WantNailgun = 1
" let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"

set backspace=indent,eol,start
"colorscheme peachpuff
set background=light
let g:solarized_termtrans=1 " no background on solarized
let g:solarized_termcolors=16
colorscheme solarized
highlight LineNr ctermfg=darkgrey
"highlight Visual cterm=none ctermbg=cyan
"highlight LineNr ctermfg=magenta
"highlight LineNr ctermfg=cyan
"
autocmd! BufNewFile,BufReadPre,FileReadPre  *.py    so ~/.vim/python.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.rb    so ~/.vim/ruby.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.rake    so ~/.vim/ruby.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.erb    so ~/.vim/erb.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.html    so ~/.vim/html.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.liquid    so ~/.vim/html.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.yml    so ~/.vim/yaml.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.yaml    so ~/.vim/yaml.vim

"load language-specific vim files
autocmd! BufNewFile,BufReadPre,FileReadPre  *.hs    so ~/.vim/haskell.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.hamlet    so ~/.vim/haskell.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.hsc   so ~/.vim/haskell.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.lhs   so ~/.vim/haskell.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.cabal so ~/.vim/haskell.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.js so ~/.vim/js.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.hbs so ~/.vim/js.vim
autocmd! BufNewFile,BufReadPre,FileReadPre  *.css so ~/.vim/css.vim

" Stuff for neocomplete/omnicomplete and ruby
"setlocal omnifunc=syntaxcomplete#Complete
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 0
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.php =
"\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.c =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.cpp =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"
"FZF
let g:fzf_layout = { 'down': '~40%' }



"if &diff
    "colorscheme evening
"endif
set clipboard=unnamed
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>p :FZF<CR>
" for silver searcher
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

let g:haskell_classic_highlighting = 1

" hit // to search for selectded text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" For haskell intero plugin
" augroup my_haskell
"     autocmd!
" 
"     autocmd FileType haskell nmap <silent> <buffer> <LocalLeader>I <Plug>intero_toggle
"     autocmd FileType haskell nmap <silent> <buffer> <LocalLeader>B <Plug>intero_toggle_stack_build
" 
"     autocmd FileType haskell noremap <silent> <buffer> gd :call intero#go_to_definition()<CR>
"     autocmd FileType haskell setlocal omnifunc=intero#omnicomplete
" 
"     autocmd FileType haskell xnoremap <silent> <buffer> <LocalLeader>t :call intero#type_of_selection()<CR>
"     autocmd FileType haskell nnoremap <silent> <buffer> <LocalLeader>t :call intero#type_at_cursor()<CR>
"     autocmd FileType haskell nnoremap <silent> <buffer> <LocalLeader>i :call intero#send_line(printf(":info %s", expand("<cword>")))<CR>
"     autocmd FileType haskell nnoremap <silent> <buffer> <LocalLeader>k :call intero#send_line(printf(":kind %s", expand("<cword>")))<CR>
"     autocmd FileType haskell nnoremap <silent> <buffer> <LocalLeader>r :call intero#send_line(":reload")<CR>
" 
"     " Populates the quickfix list.  Use :copen to see the results
"     autocmd FileType haskell nnoremap <silent> <buffer> <LocalLeader>R :call intero#uses_at_cursor()<CR>
" 
"     autocmd FileType haskell nnoremap <silent> <buffer> <LocalLeader>l :call intero#send_line(printf(":load %s", expand("%")))<CR>
" augroup END
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
