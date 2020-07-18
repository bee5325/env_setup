" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

"------------------------------------------------------------
" Vundle
"
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'jiangmao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'shougo/deoplete.nvim'
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'posva/vim-vue'
if has('python')
    Plugin 'davidhalter/jedi-vim'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
filetype plugin on

" Enable syntax highlighting
syntax on
syntax sync fromstart


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
set incsearch

" Do not wrap around
set nowrap
set guioptions+=b

" Remove menubar and toolbars
set guioptions-=m
set guioptions-=T

" Highlight current line
set cursorline
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

set splitright
set splitbelow

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
"set mouse=ra

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Always leave some space when scroll off the sreen
set scrolloff=5

" Display column line at 80
set colorcolumn=80

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" to fix the problem of weird character inserted when using backspace
set t_kb=

" visual selection automatically copied to clipboard
set go+=a

" Auto cd to current directory when switching buffer
" autocmd BufEnter * lcd %:p:h

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=4
"set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=4
set tabstop=4

"------------------------------------------------------------
" plugins {{{1
"
" Nerdtree
"
let g:NERDTreeQuitOnOpen = 1

" Airline
"
set encoding=utf-8
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = '㏑'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='badwolf'

set noshowmode

if has('python')

    " deoplete
    "
    let g:deoplete#enable_at_startup = 1

    " ALE
    "
    let g:ale_sign_error = '!'
    let g:ale_sign_warning = '•'
    let g:ale_python_pylint_options = "--extension-pkg-whitelist=pygame"

endif

" CtrlP
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Python support
"
let $PYTHONPATH = "D:\\Tool\\Common\\Python\\v3.4.4\\Lib;D:\\Tool\\Common\\Python\\v3.4.4\\DLLs;D:\\Tool\\Common\\Python\\v3.4.4\\Lib\\lib-tk"
let $PYLINTRC = "$HOME\\vimfiles\\linter\\pylint"
" " python with virtualenv support
" py3 << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'Scripts\\activate_this.py')
"   exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
" EOF

"------------------------------------------------------------
" Misc setup {{{1
"
" Default directory
if has("win32")
    if @% == ""
        cd D:\Programming
    endif
endif

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
map <leader>y "*y
map <leader>p "*p

" Map O to just insert a new line and return to normal mode
nmap O O<ESC>

" Don't jump when search for current word
nnoremap * :keepjumps normal! mi*`i<cr>

" Jump forwards and backwards
nnoremap <C-\> <C-o>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-o> :nohl<CR><C-L>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-E> :bp\|bd #<CR>

" nerdtree
"
map <C-n> :NERDTreeToggle %:p:h<CR>

" compile and run c++ programs from vim
map <F8> :w <CR> :!g++ % -o %< <CR>
map <F7> :!./%< <CR>

" Easier navigation using arrow keys
noremap <LEFT>    <C-U>
noremap <RIGHT>   <C-D>
noremap <UP>      <C-Y>
noremap <DOWN>    <C-E>

" Easier naviagation in quickfix window
noremap <leader>w :lnext<CR>
noremap <leader>q :lprevious<CR>

" search highlighted text
vnoremap // y/\V<C-R>"<CR>

" grep for current text in directory
let g:gdir = getcwd()
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cword>")) . " " . g:gdir<cr>:redraw!<cr>:copen<cr>
vnoremap <leader>g y:silent execute "grep! -R " . @" . " " . g:gdir<cr>:redraw!<cr>:copen<cr>

" change buffer
noremap <leader>] :bn<CR>
noremap <leader>[ :bp<CR>

"------------------------------------------------------------
"Colorscheme
"
if has("gui_running")
  colorscheme obsidian
else
  set t_Co=256
  set term=xterm-256color
  set t_ut=
  let g:seoul256_background = 234
  colorscheme seoul256
endif


"------------------------------------------------------------:
"window size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=50 columns=100
  set guifont=Powerline_Consolas:h11
endif

"---------------------------------------
" Macros
" Copy text to new tab, keep only the first column
let @a = 'Y:tabnewp:%s/\(\S\+\)\s.*$/\1/g'
" Change from rows to cols (remove pins as well
let @s = ':%s_\(.\+\)\n_\1 _g'
" Copy text to new tab, keep first two columns
let @d = 'Y:tabnewp:%s/\(\S\+\s\+\S\+\)\s.*$/\1/g'
