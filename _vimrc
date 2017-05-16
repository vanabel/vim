" vim: foldmethod=marker foldmarker={,}
" User variable  $TEXDOC, $TEXTEMP, $TEXUSRDEFN, $USERHOME {
let $TEXDOC = $VIM.'/../CTEX/TEXDOC/'
let $TEXTEMP = $TEXDOC.'Template/'
let $TEXUSRDEFN = $TEXTEMP.'/usrdefn.tex' 
let $USRHOME = $VIM.'/myvim'
" }
" Add custom runtimepath {
if has('win32') || has('win64')
  let &rtp .=','.$VIM.'/myvim/,'.$VIM.'/myvim/after'
endif
" }
" General vim configure {
" Not for VI {
set nocp
" }
" Line number {
set nu
" }
" Auto change the current dir {
set autochdir
" }
" Auto complete of vim command {
set wildmenu
" }
" Increase search {
set is
" }
" Show position of cursor {
set ruler
" }
" Allow backspace in insert mode {
set bs=indent,eol,start
" }
" No sounds {
set vb
" }
" Shorter spaces {
set sw=2 ts=2 bs=2 ai si sta et
" }
" Set wrap, list disables linebreak {
set wrap lbr tw=0 wm=0 nolist
" }
" good fold fill char {
set fillchars=vert:\|,fold:-
" }
" }
" Color scheme {
if !isdirectory($VIM.'/myvim/colors')
  colo darkblue
else
"colo phd
colo solarized
set background =dark
"colo molokai
"let g:molokai_original = 1
endif
" }
" Encodings {
"  Encoding for file
set fenc=utf-8
" Encoding for file's content
set enc=utf-8
" Supported encoding
set fencs=usc-bom,
      \utf-8,
      \chinese,
      \cp936,
      \gb18030,
      \big5,
      \euc-jp,
      \euc-kr,
      \latin1
" }
" Auto indent {
if has('autocmd')
  filetype plugin indent on
endif
" }
" Plugin Admin {
" vim-plug https://github.com/junegunn/vim-plug
" Add Plug owner/projname then run PlugInstall
" The root of plug is $Vim/myvim/plugged
call plug#begin('$Vim/myvim/plugged')
" for latex
Plug 'lervag/vimtex'
" for snips
Plug 'Sirver/ultisnips'
" for fold
Plug 'Konfekt/FastFold'
"Plug 'nelstrom/vim-markdown-folding'
" for git
Plug 'tpope/vim-fugitive'
" for session
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
" for fullscreen
"Plug 'xolox/vim-shell'
" for more default snippets
"Plug 'honza/vim-snippets'
"Plug 'ajh17/VimCompletesMe'
call plug#end()
" }
" TeX {
" General TeX config {
" Spell check {
"   Spell check for English, escape Chinese. 
"   Use zg/zug to add/remove to good wordlist
"     and 2zg/2zug to add/remove to ignore wordlist
au FileType tex setlocal spell spelllang=en_us,cjk
      \ spf=$VIM/myvim/spell/en.utf-8.add
      \ spf+=$VIM/myvim/spell/ignore.utf-8.add
" }
"  Add :_- to keywords {
au FileType tex let g:tex_isk='48-57,_,:,-,a-z,A-Z,192-255'
" }
" Enable TeX fold {
let g:vimtex_fold_enabled =1
let g:vimtex_fold_comments =1
"au FileType tex let g:tex_fold_enabled =1 
" we don't want fold too much
au FileType tex setlocal foldlevel=2
" Also fold command
"let g:vimtex_fold_preamble =0
"let g:vimtex_fold_comments = 1
" }
" Add more fold by TexNewMathZones {
" see :h tex-math
" see $VIM/myvim/after/syntax/tex.vim
" }
" Accept @ in .tex {
au FileType tex let b:tex_stylish=1
" }
" }
" Advanced Config for VimTeX {
if isdirectory($VIM.'/myvim/plugged/vimtex')
" viewer comfig {
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
      \ = '-reuse-instance -forward-search @tex @line @pdf'
      \ . ' -inverse-search "gvim --servername ' . v:servername
      \ . ' --remote-send \"^<C-\^>^<C-n^>'
      \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
      \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
      \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
      \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
" }
let g:vimtex_quickfix_latexlog= {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'default' : 0,
      \ 'packages' : {
      \   'default' : 1,
      \   'biblatex' : 1,
      \   'babel' : 1,
      \   'hyperref' : 1,
      \ },
      \}
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-xelatex',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}
" Add Quick Math Input {
"`N for \nabla
let g:vimtex_imaps_disabled = ['N', '~', '^', 'o', 'O']
call vimtex#imaps#add_map({
      \ 'lhs' : 'N',
      \ 'rhs' : '\nabla',
      \ 'wrapper' : 'vimtex#imaps#wrap_math'
      \})
call vimtex#imaps#add_map({
      \	'lhs' : '~',
      \	'rhs' : '\tilde',
      \ 'wrapper' : 'vimtex#imaps#wrap_math'
      \})
call vimtex#imaps#add_map({
      \	'lhs' : '^',
      \	'rhs' : '\wedge',
      \	'wrapper' : 'vimtex#imaps#wrap_math'
      \})
call vimtex#imaps#add_map({
      \	'lhs' : 'o',
      \	'rhs' : '\circ',
      \	'wrapper' : 'vimtex#imaps#wrap_math'
      \})
call vimtex#imaps#add_map({
      \	'lhs' : 'O',
      \	'rhs' : '\otimes',
      \	'wrapper' : 'vimtex#imaps#wrap_math'
      \})
call vimtex#imaps#add_map({
      \ 'lhs' : '2',
      \	'rhs' :	'\sqrt{}',
      \	'wrapper' : 'vimtex#imaps#wrap_math'
      \})
" }
endif
" }
" Custom Config for TeX {
" Open bib (./bib/jobname) {
"map <Leader>lb :silent exec 'tabnew %:h/bib/%:t:r.bib'<cr>
if !empty(glob('%:p:h/bib'))
  map <Leader>lb :silent exec "tabnew %:p:h/bib/*.bib"<tab><cr>
else
  map <Leader>lb :silent exec "tabnew %:p:h/*.bib"<tab><cr>
endif
" }
" 7z {
map <Leader>lz :silent exec "!cd %:p:h/../ & 7z u -tzip %:t:r usrdefn.tex %:h:t/%:t:r.tex %:h:t/%:t:r.pdf %:h:t/%:t:r.synctex.gz %:h:t/bib/%:t:r.bib >".$USRHOME."/temp/7z.log 2>&1"<cr><cr>
map <Leader>lze :silent exec "!cd %:p:h/../ & 7z u -seml -tzip %:t:r usrdefn.tex %:h:t/%:t:r.tex %:h:t/%:t:r.pdf %:h:t/%:t:r.synctex.gz %:h:t/bib/%:t:r.bib >".$USRHOME."/temp/7z.log 2>&1"<cr><cr>
" }
" Open Working Directory {
"set nossl "use \ for path instead of /
nnoremap <silent> <Leader>ld :if expand("%:p:h") != "" \| exec "!start explorer" expand("%:p:h:S") \| endif<CR>
" }
" User Define Maps for VimTex {
" Open bib/*.bib Under Current Dir {
nmap ;b \lb
imap ;b <Esc>:w<cr>;b
" }
" Compile by Latexmk {
nmap ;c \ll
imap ;c <Esc>:w<cr>;c
" }
" Compile Selected {
nmap ;C \lL
imap ;C <Esc>:w<cr>;C
" }
" Open Dir of Current File {
nmap ;d \ld
imap ;d <Esc>:w<cr>;d
" }
" Open Compile Output {
nmap ;o \lo
imap ;o <Esc>:w<cr>;o
" }
" Open Error Log {
nmap ;e \le
imap ;e <Esc>:w<cr>;e
" }
" Show Latexmk Status {
nmap ;g \lg
imap ;g <Esc>:w<cr>;g
" }
" Show Fullstatus {
nmap ;G \lG
imap ;G <Esc>:w<cr>;G
" }
" Show Vimtex Infomation {
nmap ;i \li
imap ;i <Esc>:w<cr>;i
" }
" Show Vimtex Fullinfo {
nmap ;I \lI
imap ;I <Esc>:w<cr>;I
" }
" Stop Current Latexmk {
nmap ;k \lk
imap ;k <Esc>:w<cr>;k
" }
" Stop All Latexmk {
nmap ;K \lK
imap ;K <Esc>:w<cr>;K
" }
" Show Quick Key Reference {
nmap ;m \lm
imap ;m <Esc>:w<cr>;m
" }
" Set Main {
nmap ;M \ls
imap ;M <Esc>:w<cr>;M
" }
" Clean Latexmk {
nmap ;n :silent exec "!rm *.fls"<cr>\lc
imap ;n <Esc>:w<cr>;n
" }
" Full Clean {
nmap ;N \lC
imap ;N <Esc>:w<cr>;N
" }
" Relaod Vimtex {
nmap ;r \lx
imap ;r <Esc>:w<cr>;r
" }
" Toc Open {
nmap ;t \lt
imap ;t <Esc>:w<cr>;t
" }
" Toggle toc open {
nmap ;T	\lT
imap ;T <Esc>:w<cr>;T
" }
" Open Label {
nmap ;y \ly
imap ;y <Esc>:w<cr>;y
" }
" Toggle Label Open {
nmap ;Y \lY
imap ;Y <Esc>:w<cr>;Y
" }
" Preview {
nmap ;v \lv
imap ;v <Esc>:w<cr>;v
" }
" <F5> for Omni Complete {
imap <F5> <c-x><c-o>
" }
" }
" }
" MetaPost Compile {
function! MetaPostCompile()
  let s:origdir = getcwd()
  lcd %:p:h
  silent exec '!latexmk -C'
  silent exec '!xelatex -shell-escape %'
  silent exec 'cd' fnameescape(s:origdir)
endfunction
imap <silent> <F3> <Esc>:call MetaPostCompile()<cr>
map <silent> <F3> :call MetaPostCompile()<cr>
" }
" Auto Load _vimrc.custom in the Working Root {
au BufNewFile,BufReadPost,BufEnter *.tex call CustomConfig()
function! CustomConfig()
  let custom_vimrc = expand('%:p:h').'/_vimrc.custom'
  if filereadable(custom_vimrc)
    exe 'so' custom_vimrc
  endif
endfunction
" }
" TeX Live Preview {
function! Texlivepreview()
  "change dir
  :lcd  %:p:h
  if filewritable(bufname("%"))
    silent update %
  endif
endfunction
"Since not work for VI
if has("gui_running") 
  "au CursorMoved *.tex call Texlivepreview()
  "au CursorMovedI *.tex call Texlivepreview()
  "au CursorHold *.tex call Texlivepreview()
endif
" }
" Autoinstall missing package {
function! InstallPackages()
  let winview = winsaveview()
  call inputsave()
  let cmd = ['tlmgr install']
  %call add(cmd, matchstr(getline('.'), '\\usepackage\(\[.*\]\)\?{\zs.*\ze\}'))
  echomsg join(cmd)
  echo system(join(cmd))
  call inputrestore()
  call winrestview(winview)
endfunction
command! InstallPackages call InstallPackages()
" }
" }
" UltiSnips Config {
let g:UltiSnipsSnippetsDir =$VIM.'/myvim/UltiSnips'
" }
" General Custom Config {
" User Defined Maps {
"Esc
imap jk <Esc>
nnoremap ;; $
"imap () ()<left>
"imap [] []<left>
"imap {} {}<left>
"Move right
imap <c-e> <right>
"Copy to Clipboard
vnoremap ;x "*y
"Paste from Clopboard
nmap ;p "*p
"Switch window
nnoremap nw <C-w><C-w>
"Next/Previous tab gt gT
" }
" Restore Working Status {
" Only Save buffers, folds, and winsize. Ignore blank, curdir, help, options
set sessionoptions=curdir,tabpages,resize,winpos,winsize,options
" use xolox/vim-session 
let g:session_directory = $USRHOME
let g:session_default_name = 'Session'
let g:session_autosave ='yes'
let g:session_autoload ='yes'
let g:session_autosave_periodic =10
let g:session_autosave_silent=1
" }
" Go to Last Position when Start {
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" }
" Remember the Position and Size of Window {
set sessionoptions+=resize,winpos
" }
"Full screen for TEX {
"Starting vim for tex file in fullscreen mode
"Need https://github.com/xolox/vim-shell
"Not always on top
let g:shell_fullscreen_always =get(g:,'shell_fullscreen_always', 0)
let g:shell_fullscreen_message =get(g:,'shell_fullscreen_message',0)
"With xolox/session plugin, it will save fullscreen status
autocmd BufNewFile,BufReadPost,BufEnter *.tex 
      \ set spell |
      \ if has("gui_running") |
      \ 	set lines=12 columns=133 |
      \ 	winpos 0 0	|
      \ endif
" }
" Set UTF8 Encoding for tex,markdown,vim {
au FileType tex,markdown,vim set encoding=utf-8
" }
" Set EN Language as Default {
" Just rename the `lang` dir under Vim8\vim80
" }
" Remove Menu/Toolbar/Scrollbar {
set go=aegit
" }
" Set Default Fonts for GUI {
set guifont=Consolas:h16:cANSI
" }
" Set Status Line {
" set statusline=%F%m%r\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
if has('statusline')
  set laststatus=2            						 " Use airline for statusline.
  " Broken down into easily include-able segments
  set statusline  =
  set statusline +=[%n]\                            " Buffer number
  set statusline +=%<%f\                            " Filename
  set statusline +=%w%h%m%r                         " Options
  if isdirectory($VIM.'/myvim/plugged/vim-fugitive')
    set statusline +=%{fugitive#statusline()}         " Git Hotness
  endif
  set statusline +=\ %{'['.(&fenc!=''?&fenc:&enc)}  " File encoding
  set statusline +=%{(&bomb?\"/BOM\":\"/NOBOM/\")}  " BOM or not
  set statusline +=%{&ff}/%Y]                       " Filetype
  set statusline +=\ [%{getcwd()}]                  " Current dir
  set statusline +=\ [0x%04B]                       " Character under cursor 
  set statusline +=%=%-14.(%l,%c%V%)\ %p%%          " Right aligned file nav info
endif
" }
" Auto Load vimrc When Save {
augroup myvimrc
  au!
  au! BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so % 
        \	| if has('gui_running') | so % | endif
augroup END
" }
" }

