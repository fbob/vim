"--------------------------------------------------------------------------
" Keyboard Mappings
"--------------------------------------------------------------------------
let mapleader = "\<Space>"
" TODO
" Easier on the shift.
" noremap <space> :

" TODO
" Restore selection on shift
" vnoremap <silent> < <gv
" vnoremap <silent> > >gv

" Toggle highlight
nnoremap <silent> <f4> :nohlsearch<cr>
" TODO
" Use ctrl-n to unhighlight search results in normal mode:
"nmap <silent> <C-N> :silent noh<CR>

" Toggle linewrapping
nnoremap <silent> <f8> :let &wrap = !&wrap<cr>

" Compile
nnoremap <silent> <f9> :echo "Running make..."<cr>:sil! make<cr>:cw<cr>:redraw!<cr>:echo "Make complete."<cr>

" Taglist plugin
nnoremap <silent> <f5> :Tlist<cr>

" MRU plugin
nnoremap <silent> <f2> :MRU<cr>

" Project file
"nnoremap <silent> <f3> :Project<cr>

" Toggle paste
nnoremap <silent> <f10> :let &paste = !&paste<cr>:set paste?<cr>

" Taglist
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Windows mappings
noremap <S-Up>    :wincmd k<CR>
noremap <S-Down>  :wincmd j<CR>
noremap <S-Left>  :wincmd h<CR>
noremap <S-Right> :wincmd l<CR>

imap <S-Up>    <C-O>:wincmd k<CR>
imap <S-Down>  <C-O>:wincmd j<CR>
imap <S-Left>  <C-O>:wincmd h<CR>
imap <S-Right> <C-O>:wincmd l<CR>

" In order to use the arrow keys when visually selecting text:
vnoremap <Left> h
vnoremap <Right> l
vnoremap <Up> k 
vnoremap <Down> j

"
" Recherche sur le web avec Firefox
"
vmap g :<C-U>!firefox "http://www.google.fr/search?hl=fr&q=<cword>&btnG=Recherche+Google&meta=" &gt;& /dev/null<CR><CR>
vmap w :<C-U>!lynx "http://fr.wikipedia.org/wiki/<cword>" >& /dev/null<CR><CR>
vmap ,o :<C-U>!firefox "<cfile>" >& /dev/null<CR><CR>
"
" Toggle fold state between closed and opened.
"
" If there is no fold at current line, just moves forward.
" If it is present, reverse it's state.
fun! ToggleFold()
	if foldlevel('.') == 0
		normal! l
	else
		if foldclosed('.') < 0
			. foldclose
		else
			. foldopen
		endif
	endif
	" Clear status line
	echo
endfun
" Map this function to Space key.
noremap <space> :call ToggleFold()<CR>
" History completion.
au filetype vimshell inoremap <buffer> <expr><silent> <Up> unite#sources#vimshell_history#start_complete(!0)
nnoremap gF :edit <cfile><cr>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
