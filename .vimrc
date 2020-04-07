"Testing--------------------{{{
" maps <F10> to return name of highlight group
:nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

"}}}

"Learning--------------------{{{
function! s:MyLearning()
" remap of zM to zC
" remap of zR to zO
:nnoremap zM <nop>
:nnoremap zR <nop>
:nnoremap zC zM
:nnoremap zO zR

:inoremap jk <esc>
:vnoremap jk <esc>
:inoremap <esc> <nop>

"unmap arrows from nmode
:nnoremap <up> <nop>
:nnoremap <down> <nop>
:nnoremap <left> <nop>
:nnoremap <right> <nop>

"unmap arrows from nmode
:inoremap <up> <nop>
:inoremap <down> <nop>
:inoremap <left> <nop>
:inoremap <right> <nop>

"unmap arrows from nmode
:vnoremap <up> <nop>
:vnoremap <down> <nop>
:vnoremap <left> <nop>
:vnoremap <right> <nop>

"on ctrl-u upper case word
:inoremap <c-u> <esc>viwU

"Disable ctrl-w+arrow on switching splits
"new settings is just arrow
:nnoremap <c-w>k <nop>
:nnoremap <c-w>j <nop>
:nnoremap <c-w>l <nop>
:nnoremap <c-w>h <nop>

:inoremap <c-k>		<esc><c-w>k
:inoremap <c-j>		<esc><c-w>j
:inoremap <c-h>		<esc><c-w>h
:inoremap <c-l>		<esc><c-w>l

:nnoremap <c-k>		<esc><c-w>k
:nnoremap <c-j>		<esc><c-w>j
:nnoremap <c-h>		<esc><c-w>h
:nnoremap <c-l>		<esc><c-w>l

endfunction
"}}}

"Default settings --------------------{{{
:let &tabstop=4
:let &shiftwidth=4
:set mouse=a
:set relativenumber
:set number
:language en_US.UTF-8
:syntax on
:set foldmethod=syntax
:set hlsearch

:call s:MyLearning()

" }}}

"File set up--------------------{{{
augroup file_set_up
	autocmd!
	autocmd FileType cpp call s:MyCSettings()
	autocmd FileType hpp call s:MyCSettings()
	autocmd FileType c   call s:MyCSettings()
	autocmd FileType h   call s:MyCSettings()
	autocmd FileType sql call s:MySQLSettings()
	autocmd FileType vim call s:MyVimSettings()
	autocmd FileType php call s:MyPHPSettings()
augroup end
" }}}

"SQL function only--------------------{{{
function! s:MySQLSettings()
	:iabbrev select SELECT
	:iabbrev while WHILE
	:iabbrev from FROM 
	:iabbrev where WHERE
	:iabbrev as AS
	:iabbrev create CREATE
	:iabbrev function FUNCTION
	:iabbrev procedure PROCEDURE
	:iabbrev table TABLE
	:iabbrev int INTEGER
	:iabbrev integer INTEGER
	:iabbrev use USE
	:iabbrev go GO
	:iabbrev exec EXEC
	:iabbrev if IF
	:iabbrev declare DECLARE
	:iabbrev return RETURN
	:iabbrev begin BEGIN
	:iabbrev end END
	:iabbrev into INTO
	:iabbrev alter ALTER
endfunction
" }}}

"Vim function only--------------------{{{
function! s:MyVimSettings()
	"Fold marker when starting vim file
	:setlocal foldmethod=marker

endfunction
" }}}

"C/C++ function for windows --------------------{{{
function! s:MyCWindowsSettings()

	"windows variables
	:syn keyword ctype DWORD NETRESOURCE LPWSTR WSADATA SOCKET HANDLE FILETIME SYSTEMTIME TEXT LPTSTR TCHAR
	
	"preprocesor
	:highlight cpreproc   ctermfg=4 guifg=#00D7AF
	:highlight cdefine    ctermfg=4 guifg=#00D7AF
	:highlight cprecondit ctermfg=4 guifg=#00D7AF
	:highlight cinclude   ctermfg=4 guifg=#00D7AF
	
	"modifier (static const virtual)
	:highlight cppmodifier   ctermfg=1 guifg=#00AF5F 
	:highlight cstorageclass ctermfg=1 guifg=#00AF5F
	
	"change highlight on basic namespaces
	:highlight cppNamespace ctermfg=43 guifg=#00D7AF
endfunction
"}}}

"function for default windows settings ----------------{{{
function! s:DefaultWindowsSettings()
source $VIMRUNTIME/vimrc_example.vim
	:colorscheme torte
	
	set diffexpr=MyDiff()
	function MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg1 = substitute(arg1, '!', '\!', 'g')
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg2 = substitute(arg2, '!', '\!', 'g')
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		let arg3 = substitute(arg3, '!', '\!', 'g')
		if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
		if empty(&shellxquote)
		let l:shxq_sav = ''
		set shellxquote&
		endif
		let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
		let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
		else
		let cmd = $VIMRUNTIME . '\diff'
		endif
		let cmd = substitute(cmd, '!', '\!', 'g')
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
		if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
		endif
	endfunction
endfunction
"}}}

"C/C++ function for unix --------------------{{{
function! s:MyCUnixSettings()
	:highlight cstorageclass ctermfg=6 guifg=#0000ff
	
	"preprocesor
	:highlight cpreproc   ctermfg=5 guifg=#00D7AF
	:highlight cdefine    ctermfg=5 guifg=#00D7AF
	:highlight cprecondit ctermfg=5 guifg=#00D7AF
	:highlight cinclude   ctermfg=5 guifg=#00D7AF
	
	"modifier (static const virtual)
	:highlight cppmodifier   ctermfg=35 guifg=#00AF5F 
	:highlight cstorageclass ctermfg=35 guifg=#00AF5F
	
	
endfunction
"}}}

"C/C++ add body of function--------------------{{{
function! g:AddFunctionToSrcFile()
	:normal! k$w"1y$
	:execute "normal! /class\<CR>"
	:normal! N
	:normal! w"2ye
	:execute "normal! \<c-w>l"
	:normal! G2o
	:normal! "1px%b"2Pa::
	"0W"2Pa::
	:normal! $o
	:normal! i{/*{{
	:normal! A{*/
	:normal! 2o
	:normal! i}/*}}
	:normal! A}*/
	:execute "normal! ki\<tab>"
endfunction
"}}}

"C/C++ function only--------------------{{{
function! s:MyCSettings()
	" cpp only
	:autocmd FileType cpp :iabbrev ednl endl
	
	"insert tabs, format
	:autocmd BufWritePre * :normal! gg=G
	
	"delete/yank parameters dp 
	:onoremap p i(
	
	"use only on file from header file when its src is opened
	:nnoremap <tab> :call g:AddFunctionToSrcFile()<CR>A
	
	" napise druhy par zavorek
	:inoremap { <esc>2k$wy0o<esc>Pa{<esc>2o<esc>pA}<esc>k0PA<tab>
	
	"Fold marker when starting vim file
	:set foldmethod=marker
	
	"adding to highlights
	:syn keyword cpptype vector map list string wchar_t set wstring ifstream ofstream
	
	"highlight default namespace
	:syn match cppNamespace "\(filesystem\|chrono\|std\|ios\|sf\|Event\|Color\)::"me=e-2
	:hi def link cppNamespace Type
	
	
	if has("win32")
	:call s:MyCWindowsSettings()
	
	"windows default settings
	:call s:DefaultWindowsSettings()
	else
	:call s:MyCUnixSettings()
	endif
	
endfunction
" }}}

"PHP function only--------------------{{{
function! s:MyPHPSettings()
endfunction
" }}}
