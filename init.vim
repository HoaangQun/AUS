" # https://github.com/HoaangQun/
"
"        __       __        _______            ___             ___         __       __        _______               _______        __        __     __       __
"  	|  |     |  |      |  ___  |          /   \           /   \       |  |     |  |      |  ___  |             |  ___  |      |  |      |  |   |  |     |  |   
"  	|  |     |  |     |  |   |  |        /  _  \         /  _  \      |  |\    |  |     |  |   |  |           |  |   |  |     |  |      |  |   |  |\    |  |
"  	|  |     |  |    |  |     |  |      /  / \  \       /  / \  \     |  | \   |  |    |  |     |  |         |  |     |  |    |  |      |  |   |  | \   |  | 
" 	|  |     |  |   |  |       |  |    /  /   \  \     /  /   \  \    |  |  \  |  |   |  |       |  |       |  |       |  |   |  |      |  |   |  |  \  |  | 
" 	|  |-----|  |   |  |       |  |   /  /     \  \   /  /     \  \   |  |\  \ |  |   |  |       |__|       |  |       |  |   |  |      |  |   |  |\  \ |  |
" 	|  |_____|  |   |  |       |  |   |  |     |  |   |  |     |  |   |  | \  \|  |   |  |     _____        |  |    ___|  |   |  |      |  |   |  | \  \|  |    
" 	|  |     |  |   |  |       |  |   |  |-----|  |   |  |-----|  |   |  |  \  |  |   |  |    |__   |       |  |    \  \  |   |  |      |  |   |  |  \  |  | 
" 	|  |     |  |    |  |     |  |    |  |_____|  |   |  |_____|  |   |  |   \ |  |    |  |     |  |         |  |    \  \|    |  |      |  |   |  |   \ |  |    
" 	|  |     |  |     |  |___|  |     |  |     |  |   |  |     |  |   |  |    \|  |     |  |___|  |           |  |___|\  \     |  |____|  |    |  |    \|  |
" 	|  |     |  |      |       |      |  |     |  |   |  |     |  |   |  |     |  |      |       |             |       \  \     |        |     |  |     |  | 
"        --       --        -------       ----     ----    --       --     --       --        -------               ------  ---      --------       --       --
"
"
"
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation for GitHub; translates to https://github.com/junegunn/seoul256.vim.git
Plug 'junegunn/seoul256.vim'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-easy-align.git'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Using a non-default branch
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Use 'dir' option to install plugin in a non-default directory
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }

" Post-update hook: run a shell command after installing or updating the plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Post-update hook can be a lambda expression
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" If the vim plugin is in a subdirectory, use 'rtp' option to specify its path
Plug 'nsf/gocode', { 'rtp': 'vim' }

" On-demand loading: loaded when the specified command is executed
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" On-demand loading: loaded when a file with a specific file type is opened
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Theme onedark"
Plug 'navarasu/onedark.nvim'

"nerdTree
Plug 'preservim/nerdtree'

"terminal
Plug 'voldikss/vim-floaterm'

"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"autocomplete
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"auto ()
Plug 'jiangmiao/auto-pairs'


" Call plug#end to update &runtimepath and initialize the plugin system.
" - It automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()

" Extensions need to be installed at first startup
let g:coc_global_extensions = [
      \'coc-css',
      \'coc-html',
      \'coc-json',
      \'coc-jedi',
      \'coc-vimlsp',
      \]

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:airline_powerline_fonts = 1                       " Enable font for status bar
let g:airline_theme='onedark'                           " Theme OneDark

let g:airline#extensions#tabline#enabled = 1            " Enable Tab bar
let g:airline#extensions#tabline#left_sep = ' '         " Enable Tab seperator 
let g:airline#extensions#tabline#left_alt_sep = '|'     " Enable Tab seperator
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'        " Set Tab name as file name

let g:airline#extensions#whitespace#enabled = 0         " Remove warning whitespace"

let g:airline_section_error=''

" This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment' } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

hi! fzf_fg ctermfg=14
hi! fzf_fgp ctermfg=3
hi! fzf_hl ctermfg=5
hi! fzf_hlp ctermfg=5
hi! fzf_info ctermfg=6
hi! fzf_prompt ctermfg=6
hi! fzf_spinner ctermfg=6
hi! fzf_pointer ctermfg=3
let g:fzf_colors = {
    \ 'fg':      ['fg', 'fzf_fg'],
    \ 'hl':      ['fg', 'fzf_hl'],
    \ 'fg+':     ['fg', 'fzf_fgp'],
    \ 'hl+':     ['fg', 'fzf_hlp'],
    \ 'info':    ['fg', 'fzf_info'],
    \ 'prompt':  ['fg', 'fzf_prompt'],
    \ 'pointer': ['fg', 'fzf_pointer'],
    \ 'spinner': ['fg', 'fzf_spinner'] }

" :Files
"command! -bang -nargs=? -complete=dir Files
"    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --theme=TwoDark --style=header,numbers,snip --line-range :300 {}']}, <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
nnoremap <silent> <F6> :Files<CR>

" :Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--exact', '--layout=reverse']}, <bang>0)
nnoremap <silent> <F7> :Rg<CR>
" Ignore some file 
let $FZF_DEFAULT_COMMAND='find . \( -name __pycache__ -o -name .git -name .vagrant \) -prune -o -print'

set number

" Vim color
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark

nnoremap <silent> <F5> :NERDTreeToggle<CR>

let g:floaterm_position = 'topright'
let g:floaterm_width = 0.57
let g:floaterm_height = 0.75
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']

nnoremap <silent> <F8> :FloatermToggle!<CR>

tnoremap <silent> <F8> <C-\><C-n>:FloatermToggle!<CR>

nnoremap <silent> <F2> :q!<CR>

nnoremap <silent> <F3> :w!<CR>

nnoremap <silent> <F4> :wq!<CR>

vnoremap c y<CR>

nnoremap c yy<CR>

nnoremap d d<CR>

nnoremap n P<CR>

nnoremap q :bd<CR>

nmap g gg<CR>

nmap u u<CR>

set shortmess+=I

