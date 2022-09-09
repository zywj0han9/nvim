"__  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
" Author: @zyw9
" 使用前安装 nodejs，yarn，使用pip安装pynvim debugpy，使用npm install -g neovim 安装python 
" 在使用npm之前将/usr/lib/node_modules/这个文件下所有的文件当前用户的权限
" chown xxxx:xxxx -R /usr/lib/node_modules/
" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif

source $HOME/.config/nvim/_machine_specific.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" " 
"
" " ====================
" " === Editor Setup ===
" " ====================
" " ===
" " === System
" " ===
set clipboard=unnamedplus
let &t_ut=''
set autochdir

" " ===
" " === Editor behavior
" " ===
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"
"
" " ===
" " === Terminal Behaviors
" " ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

" " ===
" " === Basic Mappings
" " ===
let mapleader=" "
noremap ; :
" " Save & quit
noremap Q :q!<CR>
noremap q :q<CR>
" noremap <C-q> :qa<CR>
noremap S :w<CR>
"
" " 配置文件
noremap <LEADER>gc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER><LEADER>h  :vsp ~/.config/nvim/help<CR>
noremap <LEADER>+ :vsp
" make Y to copy till the end of the line
nnoremap Y y$
"
" " Indentation
nnoremap < <<
nnoremap > >>
"
" Insert Key
noremap o i
noremap O I
" Search
" noremap <LEADER><CR> :nohlsearch<CR>
"
" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/	/\t/g
vnoremap <LEADER>tt :s/	/\t/g

" Folding
noremap <silent> <LEADER>o za
"
" Open up lazygit
noremap \lg :LazyGit<CR>
noremap \gc :LazyGitConfig<CR>
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     i
" < j   l >
"     k
"     v
noremap <silent> i k
noremap <silent> j h
noremap <silent> k j
noremap <silent> l l
noremap <silent> gu gk
noremap <silent> ge gj
noremap <silent> \v v$h
" U/E keys for 5 times u/e (faster navigation)
noremap <silent> I 5k
noremap <silent> K 5j

" N key: go to the start of the line
noremap <silent> J 0
" I key: go to the end of the line
noremap <silent> L $
"
" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

source $HOME/.config/nvim/cursor.vim
source $HOME/.config/nvim/cursor_for_qwerty.vim
" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A
" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" ===
" === Searching
" ===
noremap - N
noremap = n

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l
noremap qf <C-w>o

" Disable the default s key
noremap s <nop>
"
" " split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tnj :-tabmove<CR>
noremap tnl :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
"source $XDG_CONFIG_HOME/nvim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>lx$p
"
" " Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next 'j' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

noremap <C-c> zz


" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
"
" " Call figlet
noremap tx :r !figlet
"
" " find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>
" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		" exec "!mkdir -p out"
		" exec "!gcc -ansi -Wall % -o %<"
		" :sp
 		" :res -15
 		:term gcc -ansi -Wall % -o %< && time ./%<
 		" exec "!time ./%<"
 		" :term time ./%<
 	elseif &filetype == 'cpp'
 		set splitbelow
 		exec "!g++ -std=c++14 % -Wall -o %<"
 		exec "!time ./%<"
 		" :sp
 		" :res -15
 		" :term g++ -std=c++11 % -Wall -o %< && time ./%<
 		" :term time ./%<
 	elseif &filetype == 'cs'
 		set splitbelow
 		silent! exec "!mcs %"
 		" :sp
 		" :res -5
 		:term mono %<.exe
 	elseif &filetype == 'java'
 		set splitbelow
 		" :sp
 		" :res -5
 		:term javac % && time java %<
 	elseif &filetype == 'sh'
 		:!time bash %
 	elseif &filetype == 'python'
 		set splitbelow
 		" :sp
 		" :res -5
 		:term python3 %
 	elseif &filetype == 'html'
 		silent! exec "!".g:mkdp_browser." % &"
 	elseif &filetype == 'markdown'
 		exec "InstantMarkdownPreview"
 	elseif &filetype == 'tex'
 		silent! exec "VimtexStop"
 		silent! exec "VimtexCompile"
 	elseif &filetype == 'dart'
 		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
 		silent! exec "CocCommand flutter.dev.openDevLog"
 	elseif &filetype == 'javascript'
 		set splitbelow
 		:sp
 		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'racket'
		set splitbelow
		:sp
		:res -5
		term racket %
 	elseif &filetype == 'go'
 		set splitbelow
 		:sp
 		:term go run .
 	elseif &filetype== 'R'
 		set splitbelow
 		:sp
 		: term time Rscript %
 	endif
 endfunc

 " 插件管理
 call plug#begin('$HOME/.config/nvim/plugged')
 " Plug 'LoricAndre/fzterm.nvim'

 " Colors Themes
 Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
 Plug 'EdenEast/nightfox.nvim'
 Plug 'morhetz/gruvbox'
 " Testing my own plugin
 " Plug 'theniceboy/vim-calc'

 " Treesitter
 "Plug 'nvim-treesitter/nvim-treesitter'
 "Plug 'nvim-treesitter/playground'
 Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
 " Pretty Dress
 Plug 'theniceboy/nvim-deus'
 "Plug 'arzg/vim-colors-xcode'

 " Status line
 Plug 'theniceboy/eleline.vim'
 Plug 'ojroques/vim-scrollstatus'

 " General Highlighter
 Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
 Plug 'RRethy/vim-illuminate'

 " File navigation
 "Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
 "Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
"  Plug 'junegunn/fzf-lua'
"  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
 Plug 'kevinhwang91/rnvimr'
 Plug 'airblade/vim-rooter'
"  Plug 'pechorin/any-jump.vim'

 " Taglist
 Plug 'liuchengxu/vista.vim'

 " Debugger
 " Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

 " Auto Complete
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 " Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
 Plug 'wellle/tmux-complete.vim'

 " Snippets
 " Plug 'SirVer/ultisnips'
 Plug 'theniceboy/vim-snippets'

 " Undo Tree
 Plug 'mbbill/undotree'

 " Git
 Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
 Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
 "Plug 'mhinz/vim-signify'
 Plug 'airblade/vim-gitgutter'
 Plug 'cohama/agit.vim'
 Plug 'kdheepak/lazygit.nvim'

 " Tex
 " Plug 'lervag/vimtex'

 " CSharp
 Plug 'OmniSharp/omnisharp-vim'
 Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

 " HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
 Plug 'elzr/vim-json'
 Plug 'neoclide/jsonc.vim'
 Plug 'othree/html5.vim'
 Plug 'alvan/vim-closetag'
 " Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
 " Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
 " Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
 Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
 " Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
 " Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
 "Plug 'jaxbot/browserlink.vim'
 Plug 'HerringtonDarkholme/yats.vim'
 " Plug 'posva/vim-vue'
 " Plug 'evanleck/vim-svelte', {'branch': 'main'}
 " Plug 'leafOfTree/vim-svelte-plugin'
 " Plug 'leafgarland/typescript-vim'
 Plug 'MaxMEllon/vim-jsx-pretty'
 Plug 'pangloss/vim-javascript'
 Plug 'leafgarland/typescript-vim'
 Plug 'peitalin/vim-jsx-typescript'
 Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
 Plug 'pantharshit00/vim-prisma'

 " Go
 Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

 " Python
 " Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
 Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
 " Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
 "Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
 "Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
 Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

 " Flutter
 Plug 'dart-lang/dart-vim-plugin'

 " Swift
 Plug 'keith/swift.vim'
 Plug 'arzg/vim-swift'

 " Markdown
 Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
 Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
 Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
 Plug 'dkarter/bullets.vim'

 " Other filetypes
 " Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

 " Editor Enhancement
 "Plug 'Raimondi/delimitMate'
 Plug 'jiangmiao/auto-pairs'
 Plug 'mg979/vim-visual-multi'
 Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
 Plug 'theniceboy/antovim' " gs to switch
 Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
 Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
 Plug 'junegunn/vim-after-object' " da= to delete what's after =
 Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
 Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
 Plug 'easymotion/vim-easymotion'
 " Plug 'Konfekt/FastFold'
 "Plug 'junegunn/vim-peekaboo'
 "Plug 'wellle/context.vim'
 Plug 'svermeulen/vim-subversive'
 Plug 'theniceboy/argtextobj.vim'
 Plug 'rhysd/clever-f.vim'
 Plug 'AndrewRadev/splitjoin.vim'
 Plug 'theniceboy/pair-maker.vim'
 Plug 'theniceboy/vim-move'
 " Plug 'jeffkreeftmeijer/vim-numbertoggle'
 Plug 'Yggdroot/indentLine'

 " For general writing
 Plug 'junegunn/goyo.vim'
 "Plug 'reedes/vim-wordy'
 "Plug 'ron89/thesaurus_query.vim'

 " Bookmarks
 " Plug 'MattesGroeger/vim-bookmarks'

 " Find & Replace
 Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

 " Documentation
 "Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

 " Mini Vim-APP
 "Plug 'jceb/vim-orgmode'
 "Plug 'mhinz/vim-startify'
 Plug 'skywind3000/asynctasks.vim'
 Plug 'skywind3000/asyncrun.vim'

 " Vim Applications
 Plug 'itchyny/calendar.vim'

 " Other visual enhancement
 Plug 'luochen1990/rainbow'
 Plug 'mg979/vim-xtabline'
 Plug 'ryanoasis/vim-devicons'
 Plug 'wincent/terminus'

 " Other useful utilities
 Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
 " Plug 'makerj/vim-pdf'
 "Plug 'xolox/vim-session'
 "Plug 'xolox/vim-misc' " vim-session dep

 " Dependencies
 " Plug 'MarcWeber/vim-addon-mw-utils'
 " Plug 'kana/vim-textobj-user'
 " Plug 'roxma/nvim-yarp'

" Format
" Plug ''

call plug#end()

 set re=0

 " experimental
 set lazyredraw
 "set regexpengine=1
"Format
nnoremap <leader>f :Format<CR>

 " ===
 " === Dress up my vim
 " ===
 set termguicolors " enable true colors support
 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 colorscheme gruvbox
 set background=dark
"  colorscheme tokyonight
" colorscheme dawnfox
" colorscheme carbonfox
" colorscheme nightfox
" colorscheme nordfox
hi NonText ctermfg=gray guifg=grey10
 " hi SpecialKey ctermfg=blue guifg=grey70
 "
 " ===================== Start of Plugin Settings =====================

 " ===
 " === eleline.vim
 " ===
 let g:airline_powerline_fonts = 0
 let g:airline_theme='one'

 " ==
 " == GitGutter
 " ==
 " let g:gitgutter_signs = 0
 let g:gitgutter_sign_allow_clobber = 0
 let g:gitgutter_map_keys = 0
 let g:gitgutter_override_sign_column_highlight = 0
 let g:gitgutter_preview_win_floating = 1
 let g:gitgutter_sign_added = '▎'
 let g:gitgutter_sign_modified = '░'
 let g:gitgutter_sign_removed = '▏'
 let g:gitgutter_sign_removed_first_line = '▔'
 let g:gitgutter_sign_modified_removed = '▒'
 " autocmd BufWritePost * GitGutter
 nnoremap <LEADER>gf :GitGutterFold<CR>
 nnoremap H :GitGutterPreviewHunk<CR>
 nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
 nnoremap <LEADER>g= :GitGutterNextHunk<CR>



 " ===
 " === coc.nvim
 " ===
 let g:coc_global_extensions = [
 	\ 'coc-actions',
 	\ 'coc-css',
 	\ 'coc-docker',
 	\ 'coc-diagnostic',
 	\ 'coc-eslint',
 	\ 'coc-explorer',
 	\ 'coc-flutter-tools',
 	\ 'coc-gitignore',
 	\ 'coc-html',
 	\ 'coc-json',
 	\ 'coc-lists',
 	\ 'coc-prettier',
 	\ 'coc-pyright',
 	\ 'coc-snippets',
 	\ 'coc-sourcekit',
 	\ 'coc-stylelint',
 	\ 'coc-syntax',
 	\ 'coc-tasks',
 	\ 'coc-todolist',
 	\ 'coc-translator',
 	\ 'coc-tslint-plugin',
 	\ 'coc-tsserver',
 	\ 'coc-vimlsp',
 	\ 'coc-vetur',
 	\ 'coc-yaml',
 	\ 'coc-yank',
 	\ 'coc-clangd',
 	\ 'coc-cmake',
 	\ 'coc-emmet',
 	\ 'coc-highlight',
 	\ 'coc-sh',
 	\ 'coc-pairs',
 	\ 'coc-marketplace',
 	\ 'coc-sql',
 	\ 'coc-java',
 	\ 'coc-r-lsp',
 	\ 'coc-go',
 	\ 'coc-git',
 	\ 'coc-nav',
	\ 'coc-htmldjango',
	\ 'coc-html-css-support',
	\ 'coc-docker',
	\ 'coc-vimlsp',
	\ 'coc-xml']
 " TAB Using
if empty(mapcheck("\<C-n>", 'i'))
  inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
endif
if empty(mapcheck("\<C-p>", 'i'))
  inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
endif
if empty(mapcheck("\<down>", 'i'))
  inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
endif
if empty(mapcheck("\<up>", 'i'))
  inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"
endif
if empty(mapcheck("\<C-e>", 'i'))
  inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
endif
if empty(mapcheck("\<C-y>", 'i'))
  inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
endif
if empty(mapcheck("\<PageDown>", 'i'))
  inoremap <silent><expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
endif
if empty(mapcheck("\<PageUp>", 'i'))
  inoremap <silent><expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"
endif
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? "\<C-p>" : "\<C-h>"
" noremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <C-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
let g:coc_snippet_next = '<TAB>'
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'zyw9'
" let g:snips_datetime = strftime("%Y-%m-%d %H:%M:%S")
" let g:snips_File = expand("%:t")
" let g:snips_datetime = <C-r> = :read !date<CR>
autocmd BufRead,BufNewFile tsconfig.json setfiletype=jsonc
autocmd BufNewFile *.sh,*.[ch],*.c,*.cpp,*.py,*.md,Makefile,*.mk,*.h exec ":call SetTitle()"
func SetComment()
	call setline(1,"/*================================================================") 
  call append(line("."),   "*   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
  call append(line(".")+1, "*")
  call append(line(".")+2, "*   @File：".expand("%:t")) 
  call append(line(".")+3, "*   @Author：zyw9")
  call append(line(".")+4, "*   @DateTime：".strftime("%Y-%m-%d %H:%M:%S")) 
  call append(line(".")+5, "*   @描    述：") 
  call append(line(".")+6, "*")
  call append(line(".")+7, "================================================================*/") 
  call append(line(".")+8, "")
  call append(line(".")+9, "")
endfunc

func SetComment_sh()
  call setline(3, "#================================================================") 
  call setline(4, "#   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
  call setline(5, "#")
  call setline(6, "#   @File：".expand("%:t")) 
  call setline(7, "#   @Author：zyw9")
  call setline(8, "#   @DateTime：".strftime("%Y-%m-%d %H:%M:%S")) 
  call setline(9, "#   描    述：") 
  call setline(10, "#")
  call setline(11, "#================================================================")
  call setline(12, "")
  call setline(13, "")
endfunc 
func SetTitle()
  if &filetype == 'make' 
    call setline(1,"") 
    call setline(2,"")
    call SetComment_sh()
  elseif &filetype == 'sh' 
    call setline(1,"#!/system/bin/sh") 
    call setline(2,"")
    call SetComment_sh()
	else 
		if &filetype == 'python'
			call setline(1, "#! /usr/bin/python3")
			call setline(2, "# coding=utf-8")
			call setline(3, "###########################################")
			call setline(4, "# @File: ".expand("%:t"))
			call setline(5, "# @Author:   zyw9")
			call setline(6, "# @DateTime: ".strftime("%Y-%m-%d %H:%M:%S"))
			call setline(7, "###########################################")
			call setline(8,"")
		elseif &filetype == 'cpp'
			call SetComment()
		elseif &filetype == 'c'
			call SetComment()
		elseif &filetype == 'h'
			call SetComment()
		endif
	endif
endfunc

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1
autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === FZF
" ===
let g:fzf_preview_window = 'right:40%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

" ==================== fzf-lua ====================
noremap <silent> <C-p> :FzfLua files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :FzfLua oldfiles cwd=~<CR>
noremap <silent> <C-q> :FzfLua builtin<CR>
noremap <silent> <C-t> :FzfLua lines<CR>
" noremap <silent> <C-x> :FzfLua resume<CR>
noremap <silent> z= :FzfLua spell_suggest<CR>
noremap <silent> <C-w> :FzfLua buffers<CR>
noremap <leader>; :History:<CR>
augroup fzf_commands
  autocmd!
  autocmd FileType fzf tnoremap <silent> <buffer> <c-j> <down>
  autocmd FileType fzf tnoremap <silent> <buffer> <c-k> <up>
augroup end
" if g:nvim_plugins_installation_completed == 1
" lua <<EOF
" require'fzf-lua'.setup {
" 	global_resume = true,
" 	global_resume_query = true,
" 	winopts = {
" 		height = 0.95,
" 		width = 0.95,
" 		preview = {
" 			scrollbar = 'float',
" 		},
" 		fullscreen = false,
" 		vertical       = 'down:45%',      -- up|down:size
" 		horizontal     = 'right:60%',     -- right|left:size
" 		hidden         = 'nohidden',
" 		title = true,
" 	},
" 	keymap = {
" 		-- These override the default tables completely
" 		-- no need to set to `false` to disable a bind
" 		-- delete or modify is sufficient
" 		builtin = {
" 			["<c-f>"]      = "toggle-fullscreen",
" 			["<c-r>"]      = "toggle-preview-wrap",
" 			["<c-p>"]      = "toggle-preview",
" 			["<c-y>"]      = "preview-page-down",
" 			["<c-l>"]      = "preview-page-up",
" 			["<S-left>"]   = "preview-page-reset",
" 		},
" 		fzf = {
" 			["esc"]        = "abort",
" 			["ctrl-h"]     = "unix-line-discard",
" 			["ctrl-k"]     = "half-page-down",
" 			["ctrl-b"]     = "half-page-up",
" 			["ctrl-n"]     = "beginning-of-line",
" 			["ctrl-a"]     = "end-of-line",
" 			["alt-a"]      = "toggle-all",
" 			["f3"]         = "toggle-preview-wrap",
" 			["f4"]         = "toggle-preview",
" 			["shift-down"] = "preview-page-down",
" 			["shift-up"]   = "preview-page-up",
" 			["ctrl-e"]     = "down",
" 			["ctrl-u"]     = "up",
" 		},
" 	},
"   previewers = {
"     cat = {
"       cmd             = "cat",
"       args            = "--number",
"     },
"     bat = {
"       cmd             = "bat",
"       args            = "--style=numbers,changes --color always",
"       theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
"       config          = nil,            -- nil uses $BAT_CONFIG_PATH
"     },
"     head = {
"       cmd             = "head",
"       args            = nil,
"     },
"     git_diff = {
"       cmd_deleted     = "git diff --color HEAD --",
"       cmd_modified    = "git diff --color HEAD",
"       cmd_untracked   = "git diff --color --no-index /dev/null",
"       -- pager        = "delta",      -- if you have `delta` installed
"     },
"     man = {
"       cmd             = "man -c %s | col -bx",
"     },
"     builtin = {
"       syntax          = true,         -- preview syntax highlight?
"       syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
"       syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
"     },
"   },
"   files = {
"     -- previewer      = "bat",          -- uncomment to override previewer
"                                         -- (name from 'previewers' table)
"                                         -- set to 'false' to disable
"     prompt            = 'Files❯ ',
"     multiprocess      = true,           -- run command in a separate process
"     git_icons         = true,           -- show git icons?
"     file_icons        = true,           -- show file icons?
"     color_icons       = true,           -- colorize file|git icons
"     -- executed command priority is 'cmd' (if exists)
"     -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
"     -- default options are controlled by 'fd|rg|find|_opts'
"     -- NOTE: 'find -printf' requires GNU find
"     -- cmd            = "find . -type f -printf '%P\n'",
"     find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
"     rg_opts           = "--color=never --files --hidden --follow -g '!.git'",
"     fd_opts           = "--color=never --type f --hidden --follow --exclude .git",
"   },
"   buffers = {
"     prompt            = 'Buffers❯ ',
"     file_icons        = true,         -- show file icons?
"     color_icons       = true,         -- colorize file|git icons
"     sort_lastused     = true,         -- sort buffers() by last used
"   },
" }
" EOF
" endif

" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
\   '<C-k>': ['<C-u>'],
\   '<C-j>': ['<C-e>'],
\   '<C-]>': ['<C-v>'],
\   '<C-p>': ['<C-n>'],
\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root', 'class']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0


" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'


" ===
" === vim-bookmarks
" ===
" let g:bookmark_no_default_key_mappings = 1
" nmap mt <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mi <Plug>BookmarkNext
" nmap mn <Plug>BookmarkPrev
" nmap mC <Plug>BookmarkClear
" nmap mX <Plug>BookmarkClearAll
" nmap mu <Plug>BookmarkMoveUp
" nmap me <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1


" ===
" === Undotree
" ===
noremap N :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> e <plug>UndotreeNextState
	nmap <buffer> u <plug>UndotreePreviousState
	nmap <buffer> E 5<plug>UndotreeNextState
	nmap <buffer> U 5<plug>UndotreePreviousState
endfunc


" ==
" == vim-multiple-cursor
" ==
" let g:multi_cursor_use_default_mapping = 0
" let g:multi_cursor_start_word_key = '<c-k>'
" let g:multi_cursor_select_all_word_key = '<a-k>'
" let g:multi_cursor_start_key = 'g<c-k>'
" let g:multi_cursor_select_all_key = 'g<a-k>'
" let g:multi_cursor_next_key = '<c-k>'
" let g:multi_cursor_prev_key = '<c-p>'
" let g:multi_cursor_skip_key = '<C-s>'
" let g:multi_cursor_quit_key = '<Esc>'


" ===
" === vim-visual-multi
" ===
" let g:VM_theme             = 'iceblue'
" let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'k'
let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'


" ===
" === Far.vim
" ===
" noremap <LEADER>f :F  **/*<left><left><left><left><left>
" let g:far#mapping = {
		" \ "replace_undo" : ["l"],
		" \ }


" ===
" === vim-calc
" ===
" noremap <LEADER>a :call Calc()<CR>
" Testing
" if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
" source ~/Github/vim-calc/vim-calc.vim
"endif


" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista coc<CR>
" noremap T :Vista coc<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" function! NearestMethodOrFunction() abort
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:scrollstatus_size = 15

" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
" let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END



" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let maplocalleader=' '


" ===
" === vim-calendar
" ===
" noremap \c :Calendar -position=here<CR>
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
" let g:calendar_google_api_key = "AIzaSyBpr0ci1HiXTREMcVgAPyH20MlPWxDsjV0"
" source ~/.cache/calendar.vim/credentials.vim
" let g:calendar_google_api_key = 'AIzaSyBpr0ci1HiXTREMcVgAPyH20MlPWxDsjV0'
" let g:calendar_google_client_id = '1079948634283-734ju54b3pgidg9pc1gkcvvn4emc7u72.apps.googleusercontent.com'
" let g:calendar_google_client_secret = 'UOcNFIuYO-8bfYGxsnNGcgvb'
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> j <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> l <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> o <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> O <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === vim-go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
" let g:go_gopls_enabled=0
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" ===
" === OmniSharp
" ===
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'ctrlp'

autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

sign define OmniSharpCodeActions text=💡

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
" map ' <Plug>(easymotion-overwin-f2)
" nmap ' <Plug>(easymotion-overwin-f2)
" map E <Plug>(easymotion-j)
" map U <Plug>(easymotion-k)
" nmap f <Plug>(easymotion-overwin-f)
" map \; <Plug>(easymotion-prefix)
" nmap ' <Plug>(easymotion-overwin-f2)
" map 'l <Plug>(easymotion-bd-jk)
" nmap 'l <Plug>(easymotion-overwin-line)
" map  'w <Plug>(easymotion-bd-w)
" nmap 'w <Plug>(easymotion-overwin-w)


" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === jsx
" ===
let g:vim_jsx_pretty_colorful_config = 1


" ===
" === fastfold
" ===
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1
"

" ===
" === tabular
" ===
vmap ga :Tabularize /


" ===
" === vim-after-object
" ===
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>


" ===
" === vim-session
" ===
" let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
" let g:session_autosave = 'no'
" let g:session_autoload = 'no'
" let g:session_command_aliases = 1
" set sessionoptions-=buffers
" set sessionoptions-=options
" noremap sl :OpenSession<CR>
" noremap sS :SaveSession<CR>
" noremap ss :SaveSession
" noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
" noremap so :OpenSession default<CR>
" noremap sD :DeleteSession<CR>
" noremap sA :AppendTabSession<CR>


" ===
" === context.vim
" ===
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>


" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" ===
" === reply.vim
" ===
" noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
" noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
" noremap <LEADER>rt :ReplStop<CR>
"

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0

"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable=1
let g:rnvimr_pick_enable=1
let g:rnvimr_draw_border=0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)


" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ===
" === AsyncRun
" ===
noremap gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6


" ===
" === dart-vim-plugin
" ===
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:dartfmt_options = ["-l 100"]

" ===
" === tcomment_vim
" ===
nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<


" ===
" === NrrwRgn
" ===
" let g:nrrw_rgn_nomap_nr = 1
" let g:nrrw_rgn_nomap_Nr = 1
" noremap <c-y> :NR<CR>

" ===
" === vim-move
" ===
let g:move_key_modifier = 'C'

" ===
" === any-jump
" ===
" nnoremap B :AnyJump<CR>
" let g:any_jump_window_width_ratio  = 0.8
" let g:any_jump_window_height_ratio = 0.9
 "

" ===
" === typescript-vim
" ===
let g:typescript_ignore_browserwords = 1

" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1

" ===
" === nvim-treesitter
" ===
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"  -- one of "all", "language", or a list of languages
"  ensure_installed = {"typescript", "dart", "java", "c", "prisma", "bash"},
"  highlight = {
"    enable = true,              -- false will disable the whole extension
"    disable = { "rust" },  -- list of language that will be disabled
"  },
" }
" EOF
" ==================== lightspeed ====================
nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
" autocmd BufEnter * map <buffer> <nowait> { <Plug>Lightspeed_S
map <nowait> " <Plug>Lightspeed_omni_s
" if g:nvim_plugins_installation_completed == 1
" lua <<EOF
" require'lightspeed'.setup {
"   ignore_case = true,
"   -- exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },
"   -- --- s/x ---
"   -- jump_to_unique_chars = { safety_timeout = 400 },
"   -- match_only_the_start_of_same_char_seqs = true,
"   force_beacons_into_match_width = true,
"   -- -- Display characters in a custom way in the highlighted matches.
"   -- substitute_chars = { ['\r'] = '¬', },
"   -- -- Leaving the appropriate list empty effectively disables "smart" mode,
"   -- -- and forces auto-jump to be on or off.
"   safe_labels= {"a", "r", "s", "t", "n", "e", "i", "o", "w", "f", "u", "y", "x", 'c', "v", "k", "m"},
"   -- labels = {},
"   special_keys = {
"     next_match_group = '<space>',
"     prev_match_group = '<tab>',
"   },
" }
" EOF
" endif

" ===
" === Terminal Colors
" ===

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
" if has_machine_specific_file == 0
	" exec "e ~/.config/nvim/_machine_specific.vim"
" endif

