" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = '~/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
call dein#add('Shougo/Unite.vim')
call dein#add('Shougo/vimproc.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('junegunn/fzf', {'build': './install -all'})
call dein#add('junegunn/fzf.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('rking/ag.vim')
call dein#add('github/copilot.vim')

" Finish Dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax enable

" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif

execute 'set runtimepath+=~/.vim/plugin/'

let g:vimfiler_as_default_explorer = 1

let g:copilot_filetypes = #{
  \   c: v:true,
  \   python: v:true,
  \   gitcommit: v:true,
  \   markdown: v:true,
  \   text: v:true,
  \ }

" let copilot supports gitcommit
"let g:copilot#enabled_filetypes = ['gitcommit']

nnoremap S :Ag 
nnoremap <C-q> :ccl<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>e :VimFiler -split -simple -winwidth=35 -no-quit<CR>
nnoremap <C-h> :Gtags -f %<CR>
nnoremap <C-g> :GtagsCursor 
nnoremap <C-j> :GtagsCursor<CR>
nnoremap J :cn<CR>
nnoremap K :cp<CR>

" Filesコマンドにもプレビューを出す
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
