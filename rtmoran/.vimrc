"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =";"

" Vim-plugged initiation
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-markdown'
"Plug 'plasticboy/vim-markdown'
" Plug 'xolox/vim-misc'
Plug 'vimwiki/vimwiki'
" Plug 'jreybert/vimagit'
" Plug 'xolox/vim-shell'
Plug 'takac/vim-hardtime'
Plug 'trevordmiller/nova-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

call plug#end()

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
	set relativenumber
	set mouse=a
   set termguicolors
	cmap qq q!
   set fcs=eob:\  


let g:markdown_syntax_conceal = 0
filetype plugin indent on

" Enable Hardmode by default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! HardTimeOn

" Set Theme
colorscheme nord
let s:italicize_comments="italic"
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 11
let g:nord_cursor_line_number_background = 0
let g:nord_italic_comments = 1
let g:nord_underline = 1
highlight Comment cterm=italic gui=italic
highlight String cterm=italic gui=italic
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=3
set softtabstop=3
" when indenting with '>', use 2 spaces width
set shiftwidth=3

" Redefine Escape Key
inoremap jj <ESC>

" Use markdown with wiki"
  let g:vimwiki_list = [{'path': '~/Notebook/',
\ 'syntax': 'markdown', 'ext': '.md'}]

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow
	set splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Open file as suckless sent presentation
	map <leader>s :!sent<space><C-r>% 2>/dev/null &<CR><CR>

" View an image for a suckless sent presentation:
	map <leader>v $F@ly$:!feh --scale-down --auto-zoom --image-bg black <c-r>" &<CR><CR>

" Open the selected text in a split (i.e. should be a file).
	map <leader>o "oyaW:sp <C-R>o<CR>
	xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
	vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding.pdf
	map <leader>p :!opout <c-r>%<CR><CR>

" Compile document
	map <leader>c :!compiler <c-r>%<CR>

"For saving view folds:
	"au BufWinLeave * mkview
	"au BufWinEnter * silent loadview
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Interpret .md files, etc. as .arkdown
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Readmes autowrap text:
	autocmd BufRead,BufNewFile *.md,*.tex set tw=79

" Get line, word and character counts with F3:
	map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
	map <F6> :setlocal spell! spelllang=en_us<CR>

" Use urlview to choose and open a url:
	:noremap <leader>u :w<Home>silent <End> !urlview<CR>
	:noremap ,, :w<Home>silent <End> !urlview<CR>

" Copy selected text to system clipboard (requires gvim installed):
	vnoremap  <C-c> "+y <CR>
	map <C-p> "+P

" Goyo plugin makes text more readable when writing prose:
	map <F10> :Goyo<CR>
	map <leader>f :Goyo \| set linebreak<CR>
	inoremap <F10> <esc>:Goyo<CR>a

" Toggle Prose Mode with F8:
    so /home/rtmoran/.vim/rtmoran/prose.vim
    nm <F8> :call ToggleProse()<CR>

" Insert date
   iab <expr> $(date) strftime("%B %d, %Y")

" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* Goyo

" Enable Goyo default for markdown note taking
   autocmd FileType markdown,mkd,md Goyo
   autocmd FileType markdown,mkd,md setl conceallevel=0
   autocmd FileType markdown,mkd,md call ToggleProse()
   autocmd FileType markdown,mkd,md setl showmode
   au FileType md setl conceallevel=0

" Enable autocompletion:
	set wildmode=longest,list,full
	set wildmenu

" Automatically deletes all tralling whitespace on save.
"	autocmd BufWritePre * %s/\s\+$//e

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" C-T for new tab
	nnoremap <C-t> :tabnew<cr>

" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l

" For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
	inoremap jw <Esc>
	inoremap wj <Esc>

" Quit from Goyo
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Integrating powerline support
let g:airline_powerline_fonts = 1
