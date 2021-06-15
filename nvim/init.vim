call plug#begin('~/.vim/plugged')
  Plug 'szw/vim-maximizer'
  Plug 'kassio/neoterm'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-commentary'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'StanAngeloff/php.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'tpope/vim-fugitive'
  Plug 'neovim/nvim-lspconfig'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'hrsh7th/nvim-compe'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'tpope/vim-surround'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/todo-comments.nvim'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  " Plug 'puremourning/vimspector'
"   Plug 'janko/vim-test'
  Plug 'vimwiki/vimwiki'
  Plug 'mhinz/vim-startify'
"   Plug 'heavenshell/vim-jsdoc', { 
"   \ 'for': ['javascript', 'javascript.jsx','typescript'], 
"   \ 'do': 'make install'
"   \}
"   Plug 'alaviss/nim.nvim'
"   Plug 'mfussenegger/nvim-dap'
"   Plug 'nvim-telescope/telescope-dap.nvim'
"   Plug 'theHamsta/nvim-dap-virtual-text'
"   Plug 'kyazdani42/nvim-web-devicons'
"   Plug 'ryanoasis/vim-devicons'
call plug#end()
 
" default options
set completeopt=menu,menuone,noselect " better autocomplete options
set hidden " allow hiding of buffer
set nowrap " don't wrap lines
set cursorline " show cursor line
set splitright " splits to the right
set confirm " confirmation of quit without save
set splitbelow " splits below
set expandtab " space characters instead of tab
set tabstop=2 " tab equals 2 spaces
set shiftwidth=2 " indentation
set scrolloff=5 " 5 lines above and below
set number " show absolute line numbers
set mouse=a " allow mouse
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
set visualbell " Use visual bell instead of beeping when doing something wrong
set diffopt+=vertical " starts diff mode in vertical split
set nobackup " don't create backup files
set nowritebackup " don't create backup files
set cmdheight=2 " only one line for commands
set shortmess+=c " don't need to press enter so often
set signcolumn=yes " add a column for sings (e.g. LSP, ...)
set updatetime=520 " time until update
set undofile " persists undo tree
set clipboard=unnamedplus " Allow copy in Windows
filetype plugin indent on " enable detection, plugins and indents
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown

if (has("termguicolors"))
  set t_Co=256
  set termguicolors " better colors, but makes it very slow!
  colorscheme obsidian
endif

" lewis6991/gitsigns.nvim
lua << EOF
 require('gitsigns').setup({})
EOF
 
" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <c-y> :Ttoggle<CR>
inoremap <c-y> <Esc>:Ttoggle<CR>
tnoremap <c-y> <c-\><c-n>:Ttoggle<CR>

" nvim-telescope/telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" tpope/vim-fugitive
nnoremap <leader>gg :G<cr>
nnoremap <leader>gl :G log -100<cr>

" Airline
set encoding=utf-8
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = '㏑'

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'

" easymotion
nmap <Leader>f <Plug>(easymotion-overwin-w)

" neovim/nvim-lspconfig
lua << EOL
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.tsserver.setup{
 capabilities = capabilities,
}

require'lspconfig'.vuels.setup{
 capabilities = capabilities,
}
EOL

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>n  :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <leader>p  :lua vim.lsp.diagnostic.goto_prev()<cr>

" 'hrsh7th/nvim-compe'
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    -- treesitter = true;
  };
}
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" Use Tab and shift Tab for navigating completion menu
lua << EOL
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOL

" 'mhinz/vim-startify'
if has('nvim')
    let g:startify_ascii = [
                \ "      .            .      ",
                \ "    .,;'           :,.    ",
                \ "  .,;;;,,.         ccc;.  ",
                \ ".;c::::,,,'        ccccc: ",
                \ ".::cc::,,,,,.      cccccc.",
                \ ".cccccc;;;;;;'     llllll.",
                \ ".cccccc.,;;;;;;.   llllll.",
                \ ".cccccc  ';;;;;;'  oooooo.",
                \ "'lllllc   .;;;;;;;.oooooo'",
                \ "'lllllc     ,::::::looooo'",
                \ "'llllll      .:::::lloddd'",
                \ ".looool       .;::coooodo.",
                \ "  .cool         'ccoooc.  ",
                \ "    .co          .:o:.    ",
                \ "      .           .'      ",
                \]
else
    let g:startify_ascii = [
                \ '     ________ ;;     ________',
                \ '    /********\;;;;  /********\',
                \ '    \********/;;;;;;\********/',
                \ '     |******|;;;;;;;;/*****/',
                \ '     |******|;;;;;;/*****/''',
                \ '    ;|******|;;;;/*****/'';',
                \ '  ;;;|******|;;/*****/'';;;;;',
                \ ';;;;;|******|/*****/'';;;;;;;;;',
                \ '  ;;;|***********/'';;;;;;;;;',
                \ '    ;|*********/'';;;;;;;;;',
                \ '     |*******/'';;;;;;;;;',
                \ '     |*****/'';;;;;;;;;',
                \ '     |***/'';;;;;;;;;',
                \ '     |*/''   ;;;;;;',
                \ '              ;;',
                \]
endif

let g:startify_padding_left = 10
let g:startify_custom_header = map(startify#pad(g:startify_ascii) , '"     ".v:val')
let g:startify_change_to_dir = 0

" folke/todo-comments.nvim
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" 
" " janko/vim-test
" nnoremap <silent> tt :TestNearest<CR>
" nnoremap <silent> tf :TestFile<CR>
" nnoremap <silent> ts :TestSuite<CR>
" nnoremap <silent> t_ :TestLast<CR>
" let test#strategy = "neovim"
" let test#neovim#term_position = "vertical"
 
" puremourning/vimspector
" fun! GotoWindow(id)
"   :call win_gotoid(a:id)
" endfun
" func! AddToWatch()
"   let word = expand("<cexpr>")
"   call vimspector#AddWatch(word)
" endfunction
" let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
" let g:vimspector_sidebar_width = 60
" nnoremap <leader>dd :call vimspector#Launch()<CR>
" nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
" nnoremap <leader>da :call AddToWatch()<CR>
" nnoremap <leader>dx :call vimspector#Reset()<CR>
" nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
" nnoremap <S-k> :call vimspector#StepOut()<CR>
" nnoremap <S-l> :call vimspector#StepInto()<CR>
" nnoremap <S-h> :call vimspector#StepOver()<CR>
" nnoremap <leader>d_ :call vimspector#Restart()<CR>
" nnoremap <leader>dn :call vimspector#Continue()<CR>
" nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
" nnoremap <leader>dbb :call vimspector#ToggleBreakpoint()<CR>
" nnoremap <leader>dbc :call vimspector#ToggleConditionalBreakpoint()<CR>
" let g:vimspector_sign_priority = {
"   \    'vimspectorBP':         998,
"   \    'vimspectorBPCond':     997,
"   \    'vimspectorBPDisabled': 996,
"   \    'vimspectorPC':         999,
"   \ }
 
" " " janko/vim-test and puremourning/vimspector
" " nnoremap <leader>dd :TestNearest -strategy=jest<CR>
" " function! JestStrategy(cmd)
"  "  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
"  "  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
" " endfunction      
" " let g:test#custom_strategies = {'jest': function('JestStrategy')}
" 
" " CDS
" augroup MyCDSCode
"     autocmd!
"     autocmd BufReadPre,FileReadPre *.cds set ft=cds
" augroup END
" lua << EOF
"   local lspconfig = require'lspconfig'
"   local configs = require'lspconfig/configs'
"   configs.sapcds_lsp = {
"     default_config = {
"       cmd = {vim.fn.expand("$HOME/projects/startcdslsp")};
"       filetypes = {'cds'};
"       root_dir = function(fname)
"         return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
"       end;
"       settings = {};
"     };
"   }
"   if lspconfig.sapcds_lsp.setup then
"     lspconfig.sapcds_lsp.setup{ }
"   end
" EOF
 
" nvim/treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
EOF
 
" set foldmethod=expr
" setlocal foldlevelstart=99
" set foldexpr=nvim_treesitter#foldexpr()
" 
" " mfussenegger/nvim-dap
" lua << EOF
" local dap = require('dap')
" dap.adapters.node2 = {
"   type = 'executable',
"   command = 'node',
"   args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
" }
" vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
" vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
" EOF
" nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <S-k> :lua require'dap'.step_out()<CR>
" nnoremap <S-l> :lua require'dap'.step_into()<CR>
" nnoremap <S-j> :lua require'dap'.step_over()<CR>
" nnoremap <leader>dn :lua require'dap'.continue()<CR>
" nnoremap <leader>dk :lua require'dap'.up()<CR>
" nnoremap <leader>dj :lua require'dap'.down()<CR>
" nnoremap <leader>d_ :lua require'dap'.run_last()<CR>
" nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
" nnoremap <leader>di :lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>
" vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
" nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
" nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
" nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
" 
" " Plug 'nvim-telescope/telescope-dap.nvim'
" lua << EOF
" require('telescope').setup()
" require('telescope').load_extension('dap')
" EOF
" nnoremap <leader>df :Telescope dap frames<CR>
" nnoremap <leader>dc :Telescope dap commands<CR>
" nnoremap <leader>db :Telescope dap list_breakpoints<CR>
" 
" " theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
" let g:dap_virtual_text = v:true
" 
" " jank/vim-test and mfussenegger/nvim-dap
" nnoremap <leader>dd :TestNearest -strategy=jest<CR>
" function! JestStrategy(cmd)
"   let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
"   let fileName = matchlist(a:cmd, '\v'' -- (.*)$')[1]
"   call luaeval("require'debugHelper'.debugJest([[" . testName . "]], [[" . fileName . "]])")
" endfunction      
" let g:test#custom_strategies = {'jest': function('JestStrategy')}

" NERDTree
let g:NERDTreeQuitOnOpen = 1

" Useful mappings
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Redraw screen to also turn off search highlighting until the next search
nnoremap <C-o> :nohl<CR><C-L>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-W><S-N> <C-\><C-N>
tnoremap <C-J> <C-\><C-N><C-W>j
tnoremap <C-K> <C-\><C-N><C-W>k
tnoremap <C-L> <C-\><C-N><C-W>l
tnoremap <C-H> <C-\><C-N><C-W>h

" Move lines up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" jump buffer
nnoremap _    <C-o>
nnoremap +    <C-i>

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

" change buffer
noremap <leader>] :bn<CR>
noremap <leader>[ :bp<CR>
nnoremap <C-e> :bp\|bd #<CR>

" add new line
nnoremap O O<Esc>

