set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  WINDOWS OPTIONS - with some changes                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set options and add mapping such that Vim behaves a lot like MS-Windows
"
" Maintainer:    Bram Moolenaar <Bram@vim.org>
" Last change:    2006 Apr 02

" bail out if this isn't wanted (mrsvim.vim uses this).
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
    finish
endif

" set the 'cpoptions' to its Vim default
if 1    " only do this when compiled with expression evaluation
    let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
"behave mswin
behave xterm

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>        "+gP
map <S-Insert>        "+gP

cmap <C-V>        <C-R>+
cmap <S-Insert>        <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>        <C-V>
vmap <S-Insert>        <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>        <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>        :update<CR>
vnoremap <C-S>        <C-C>:update<CR>
inoremap <C-S>        <C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
    set guioptions-=a
endif

" Alt-Space is System menu
if has("gui")
    noremap <M-Space> :simalt ~<CR>
    inoremap <M-Space> <C-O>:simalt ~<CR>
    cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" Increment
noremap <C-P> <C-A>
" Decrement
"noremap <C-P> <C-X>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" restore 'cpoptions'
set cpo&
if 1
    let &cpoptions = s:save_cpo
    unlet s:save_cpo
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Evan's Options                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General options
set ignorecase
set hlsearch
set incsearch
set statusline=%F%m%r%h%w\ [%{&ff},\ %Y]\ %<[char:\%03.3b,%02.2B]\ %=%-14.(%l,%c%V%)\ %L\ lines\ \ \ \ \ \ %P
set laststatus=2
set number
set foldcolumn=1
set ffs=unix,dos
set mouse=a
set lazyredraw " do not redraw while running macros (much faster) (LazyRedraw)
set wildmenu
set showmatch " show matching brackets
set matchtime=5 " how many tenths of a second to blink matching brackets for
"set scrolloff=5 " Keep 5 lines (top/bottom) for scope
set sidescrolloff=5 " Keep 5 lines at the side

" Spacing/tabbing
set shiftwidth=4
set tabstop=4
set softtabstop=4
if has("gui")
	set lines=40
	set columns=120
endif
set expandtab
set autoindent nosmartindent cindent
set copyindent " Follow the previous indentation
set preserveindent
set lcs=extends:>,precedes:<,tab:>-,nbsp:-,trail:&

" Bell options
set novisualbell
set noerrorbells

" Colors
syntax on
colorscheme torte

set backup
set backupdir=~/.vimbackups
set directory=~/.vimbackups " put all swp/~ files here

" indentation fixes
"inoremap <CR> <CR><Space><BS>
"nnoremap o o<Space><BS>
"nnoremap O O<Space><BS>
"nnoremap S S<Space><BS>

" Buffer commands
set hidden
map <C-n> :bprev<CR>
map <C-m> :bnext<CR>
map <F1> :bprev<CR>
map <F2> :bnext<CR>

" From vimrc_example.vim
filetype plugin indent on
autocmd FileType ruby setlocal sw=2 sts=2 ts=2 et nocindent nosmartindent autoindent

" mac settings
set anti
set enc=utf-8
set termencoding=macroman
set gfn=Monaco:h13


" Visual search mappings
" http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" autocomplete {}
"inoremap {<cr> {<cr>}<c-o>O<tab>
"inoremap [<cr> [<cr>]<c-o>O<tab>
"inoremap (<cr> (<cr>)<c-o>O<tab>

" Remap [{ and ]} to be easier with alt { }
"noremap <a-[> k[{
"noremap <a-]> j]}
noremap <a-s-]> vi{"0p
noremap <a-]> mzvi{y`z
noremap <a-[> mz[{V]}y`z

""""""""""""""""""""""""""""""""""""
" Files to edit
""""""""""""""""""""""""""""""""""""

nnoremap gx :e ~/.vimrc<cr>
nnoremap glvim :e ~/.vimrc<cr>
nnoremap glnginx :e c:\cygwin\home\estenmark\nginxconfs\nginx.evan.conf<cr>
nnoremap glvsvim :e ~/.vsvimrc<cr>
nnoremap glidea :e ~/.ideavimrc<cr>


""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""

" Try to keep folding
autocmd BufWritePost,BufLeave,WinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview


""""""""""""""""""""""""""""""""""""
" Visual Studio and more
""""""""""""""""""""""""""""""""""""

" alias for ~ (toggle case)
nnoremap <a-u> ~
vnoremap <a-u> ~

" Great for pasting while in normal/visual mode
vnoremap - "0p
nnoremap - viw"0pb
function! ReplaceAndDown()
    norm viw"0pbj
endfunction
nnoremap _ :call ReplaceAndDown()<cr>
"nnoremap _ :norm viw"0pbj<cr>

" Putting guard clause above line
"nnoremap ,/ :let @/=""<cr>
nnoremap g/ /ÿÿÿ<cr>
#nnoremap gG O//<Space>guard<Space>clause<Space>-<Space>

" Change CamelCaseWord to UPPER_SNAKE_CASE_WORD
nnoremap g3 :set noic<cr>mayiwo<esc>p:s/\u/_\0/g<cr>gUiwxyiwdd`aviw"0pb:set ic<cr>/ÿÿÿ<cr>

noremap gy "+y

if has('win32') || has('win64')
    let &runtimepath.=',$HOME/.vim'
    "set runtimepath=path/to/home.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,path/to/home.vim/after
endif

#nmap <F5> :w<CR>:!ruby %<CR>
#imap <F5> <Esc>:w<CR>:!ruby %<CR>

