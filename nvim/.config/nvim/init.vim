" Dein configuration
if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Edit
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-commentary')
    call dein#add('mbbill/undotree')
    call dein#add('AndrewRadev/splitjoin.vim')
    call dein#add('AndrewRadev/switch.vim')
    call dein#add('junegunn/vim-easy-align')
    call dein#add('godlygeek/tabular')
    call dein#add('jiangmiao/auto-pairs')
    if exists('##TextYankPost')
        call dein#add('machakann/vim-highlightedyank')
        let g:highlightedyank_highlight_duration = 100
    endif
    call dein#add('salsifis/vim-transpose')

    " Colors
    call dein#add('morhetz/gruvbox')
    call dein#add('shinchu/lightline-gruvbox.vim')
    call dein#add('nanotech/jellybeans.vim')
    call dein#add('logico-dev/typewriter')
    call dein#add('mkarmona/colorsbox')

    " Git
    call dein#add('tpope/vim-fugitive')
    call dein#add('junegunn/gv.vim')
    call dein#add('mhinz/vim-signify')

    " Browsing
    call dein#add('junegunn/fzf.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('Dimercel/todo-vim')
    call dein#add('/ervandew/supertab')
    call dein#add('haya14busa/incsearch.vim')
    call dein#add('haya14busa/incsearch-fuzzy.vim')
    call dein#add('psliwka/vim-smoothie')

    " Lang
    call dein#add('ludovicchabant/vim-gutentags')
    call dein#add('lervag/vimtex')
    call dein#add('xuhdev/vim-latex-live-preview')
    call dein#add('PietroPate/vim-tex-conceal')
    call dein#add('rust-lang/rust.vim')
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
    call dein#add('junegunn/vim-journal')
    call dein#add('szymonmaszke/vimpyter')
    call dein#add('vim-pandoc/vim-pandoc')
    call dein#add('vim-pandoc/vim-pandoc-syntax.git')
    call dein#add('jalvesaq/Nvim-R')
    call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
					\ 'build': 'sh -c "cd app & yarn install"' })

    " Lint
    call dein#add('w0rp/ale')
    call dein#add('SirVer/ultisnips')

    " Snippets
    call dein#add('honza/vim-snippets')

    " Wiki
    call dein#add('vimwiki/vimwiki')
    call dein#add('patrickdavey/vimwiki_markdown')

    " Miscellaneous
    call dein#add('tpope/vim-obsession')
    call dein#add('junegunn/goyo.vim')
    call dein#add('junegunn/limelight.vim')
    call dein#add('prabirshrestha/async.vim')
    call dein#add('itchyny/lightline.vim')
    call dein#add('rhysd/clever-split.vim')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('mtth/scratch.vim')
    call dein#add('mhinz/vim-startify')
    call dein#add('camspiers/animate.vim')
    call dein#add('camspiers/lens.vim')
    call dein#add('jalvesaq/vimcmdline')
    call dein#add('itchyny/calendar.vim')

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

" Color Scheme
colorscheme gruvbox

" Set typewriter airline theme
let g:airline_theme = 'typewriter'

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

" VXML syntax
au BufRead,BufNewFile *.vxml  set filetype=xml

" kotlin syntax
au BufRead,BufNewFile *.kt  set filetype=kotlin
au BufRead,BufNewFile *.jet set filetype=kotlin
au Syntax kotlin source ~/.config/nvim/syntax/kotlin.vim

" clips syntax
au BufRead,BufNewFile *.clp  set filetype=clips
au Syntax clips source ~/.config/nvim/syntax/clips.vim

" plantUML syntax
au BufRead,BufNewFile *.pu set filetype=plantuml
au BufRead,BufNewFile *.uml set filetype=plantuml
au BufRead,BufNewFile *.plantuml set filetype=plantuml
au Syntax plantuml source ~/.config/nvim/syntax/plantuml.vim

let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" Add UltiSnips dir
let g:UltiSnipsSnippetDirectories=['UltiSnips','mysnippets']

" Add type aiml
au BufRead, BufNewFile *.aiml set filetype=aiml

" Aiml syntax like html
au BufReadPost *.aiml set syntax="xml"

" Set default clipboard same as systemclipboard
set clipboard=unnamedplus

" Insert one line above or below changing to insert mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Leader change to comma
let mapleader=","
let leader2=" "

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
nnoremap <Leader><Leader> :update<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>

" jk is scape
inoremap jk <ESC>
inoremap JK <ESC>

" move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" move to beginning/end of line
nnoremap H g^
nnoremap L g$

" highlight last inserted text
nnoremap gV `[v`]

" noh with leader key
nnoremap <Leader>nh :noh<CR>

" toggle todo plugin
nnoremap <C-t> :TODOToggle<CR>
" toggle nerdTree
nnoremap <C-n> :NERDTreeToggle<CR>

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

" Activate FOCUS mode with F12
nmap <F2> :Goyo <bar> Limelight!!<CR>"

"-------------------------
" Coc Vim configuration

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
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

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

" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

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

" Exit terminal using jk
tnoremap jk <C-\><C-n>

" Window managment improved
nnoremap <Leader>wk <C-W><C-K>
nnoremap <Leader>wj <C-W><C-J>
nnoremap <Leader>wh <C-W><C-H>
nnoremap <Leader>wl <C-W><C-L>

" Switch pluggin map
let g:switch_mapping = "-"

" Easy align commands
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Incsearch plugin config
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" Git (@mikeymaxdb)
" List git status
nnoremap <Leader>gs :GitFiles?<CR>
" List commit log
nnoremap <Leader>gl :Commits<CR>
" List commit log for current buffer
nnoremap <Leader>gt :BCommits<CR>
" Add files and start commit
nnoremap <Leader>gc :Gwrite<CR>:Gcommit<CR>

" Add tab shortcuts
nnoremap <space>p :tabp <cr>
nnoremap <space>n :tabn <cr>

set wildoptions=pum
set pumblend=20

" make Y consistent with C and D.
nnoremap Y y$

" read microsoft word, odt, ... files with pandoc
" autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout
" let g:loaded_zipPlugin= 1
" let g:loaded_zip      = 1

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" Undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" Vimwiki
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/vimwiki/',
  \ 'path_html': '~/vimwiki/html/',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'custom_wiki2html': '~/vimwiki/tools/wiki2html.sh'}]

" Animate and Lens
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>

" Vimtex
let g:tex_flavor = "latex"
let g:livepreview_previewer = 'zathura'
set conceallevel=2
let g:tex_conceal='abdgms'
let g:vimtex_compiler_engine = 'lualatex'

" Vimcmdline
let cmdline_map_start = '<LocalLeader>s'
