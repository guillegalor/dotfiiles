" Dein configuration
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('junegunn/fzf.vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('iamcco/markdown-preview.nvim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('godlygeek/tabular')
  call dein#add('Dimercel/todo-vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('xuhdev/vim-latex-live-preview')
  call dein#add('vim-pandoc/vim-pandoc')
  call dein#add('tpope/vim-surround')
  call dein#add('honza/vim-snippets')
  call dein#add('logico-dev/typewriter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('floobits/floobits-neovim')
  call dein#add('mkarmona/colorsbox')
  call dein#add('rust-lang/rust.vim')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('lervag/vimtex')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('w0rp/ale')
  call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})
  call dein#add('easymotion/vim-easymotion')
  " call dein#add('Shougo/deoplete.nvim')
  " call dein#add('autozimu/LanguageClient-neovim', {
  "   \ 'rev': 'next',
  "   \ 'build': './install.sh',
  "   \ })
  " call dein#add('prabirshrestha/vim-lsp')
  " call dein#add('Valloric/YouCompleteMe')
  " call dein#add('vim-syntastic/syntastic')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Use 256 colors
set t_Co=256

" Enable true colors
if (has("termguicolors"))
  set termguicolors
endif

" GruvBox config
let g:gruvbox_italic=1

" set background=dark

" Color Scheme
colorscheme gruvbox

" Set typewriter airline theme
let g:airline_theme = 'typewriter'

" Use powerline font in airline
let g:airline_powerline_fonts = 1

" Change the cursor from block to i-beam in INSERT mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

" display settings
set encoding=utf-8 " encoding used for displaying file
set ruler " show the cursor position all the time
set showmatch " highlight matching braces
set showmode " show insert/replace/visual mode
set number " show line numbers

" write settings
set confirm " confirm :q in case of unsaved changes
set fileencoding=utf-8 " encoding used when saving file
set nobackup " do not keep the backup~ file

" edit settings
set backspace=indent,eol,start " backspacing over everything in insert mode
set expandtab " fill tabs with spaces
set nojoinspaces " no extra space after '.' when joining lines
set shiftwidth=4 " set indentation depth to 4 columns
set softtabstop=4 " backspacing over 4 spaces like over tabs
set tabstop=4 " set tabulator length to 4 columns
" set textwidth=80 " wrap lines automatically at 80th column

" search settings
set hlsearch " highlight search results
set ignorecase " do case insensitive search...
set incsearch " do incremental search
set smartcase " ...unless capital letters are used

" file type specific settings
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code

" characters for displaying non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" tuning for gVim only
if has('gui_running')
        set background=dark " light background for GUI
        set columns=84 lines=48 " GUI window geometry
        set guifont=Monospace\ 12 " font for GUI window
        set number " show line numbers
        colorscheme nord
endif

" automatic commands
if has('autocmd')
        " file type specific automatic commands

        " tuning textwidth for Java code
        autocmd FileType java setlocal textwidth=132
        if has('gui_running')
                autocmd FileType java setlocal columns=136
        endif

        " don't replace Tabs with spaces when editing makefiles
        autocmd Filetype makefile,py setlocal noexpandtab

        " disable automatic code indentation when editing TeX and XML files
        autocmd FileType tex,xml setlocal indentexpr=

        " clean-up commands that run automatically on write; use with caution

        " delete empty or whitespaces-only lines at the end of file
        autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        autocmd BufWritePre * :%s/\s\+$//ge
endif

" kotlin syntax
au BufRead,BufNewFile *.kt  set filetype=kotlin
au BufRead,BufNewFile *.jet set filetype=kotlin
au Syntax kotlin source ~/.vim/syntax/kotlin.vim

" plantUML syntax
au BufRead,BufNewFile *.pu set filetype=plantuml
au BufRead,BufNewFile *.uml set filetype=plantuml
au BufRead,BufNewFile *.plantuml set filetype=plantuml
au Syntax plantuml source ~/.nvim/syntax/plantuml.vim

" Actually not used but maybe i'll use in future
" " make YCM compatible with UltiSnips
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<tab>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" let g:UltiSnipsExpandTrigger="<s-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-n>"

" " UltiSnips compatible with YCM
" let g:UltiSnipsExpandTrigger="<c-space>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" -------------------------------------------------------------

" Make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" Add UltiSnips dir
let g:UltiSnipsSnippetDirectories=['UltiSnips','mysnippets']

" Add type aiml
au BufRead, BufNewFile *.aiml set filetype=aiml

" Aiml syntax like html
au BufReadPost *.aiml set syntax="xml"

" Add tab shortcuts to <F7> and <F8>
map <F8> :tabp <cr>
map <F9> :tabn <cr>

" Fix Syntastic and YCM compatibility for cxx files
" let g:ycm_show_diagnostics_ui = 0

" Set default clipboard same as systemclipboard
set clipboard=unnamedplus

" Insert one line above or below changing to insert mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Leader change to comma
let mapleader=","

" Markdown compile with pandoc and preview with zathura
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <Leader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf %<CR>
nmap <Leader>pcn :RunSilent pandoc --number-sections -o /tmp/vim-pandoc-out.pdf %<CR>
nmap <Leader>pp :RunSilent zathura /tmp/vim-pandoc-out.pdf &<CR>

" Gutentags in status line
set statusline+=%{gutentags#statusline()}

" Persistent undo
set undofile
set undodir=~/.vim/undodir

" Leader key shortcuts
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>

" jk is scape
inoremap jk <ESC>
inoremap JK <ESC>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" select zathura as default pdf previewer for latex files
let g:livepreview_previewer = 'zathura'

" noh with leader key
nnoremap <Leader>nh :noh<CR>

" toggle todo plugin
nnoremap <C-t> :TODOToggle<CR>
" toggle nerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
" toggle tagbar
nnoremap <C-l> :TagbarOpen fj<CR>

" Fzf mappings
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>B :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

" Rust plugins settings
let g:rustfmt_autosave = 1

" Vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Syntastic and YCM integration for java
" let g:syntastic_java_checkers = []

" Activate FOCUS mode with F12
nmap <F12> :Goyo <bar> Limelight!!<CR>"

" Use deoplete
" let g:deoplete#enable_at_startup = 1

" " Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" " Required for operations modifying multiple buffers like rename.
" set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" let g:LanguageClient_devel = 1 " Use rust debug build
" let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
"
"-------------------------
" Coc Vim configuration
"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status'
"       \ },
"       \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
