" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Mar 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ********************** stuff for Vundle
" set nocompatible      be iMproved, required
filetype off            " required

" set the runtime path to include Vundle and intitialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YCM
Plugin 'Valloric/YouCompleteMe'

" color_coded
"Plugin 'jeaye/color_coded'

" vim-colorschemes
Plugin 'flazz/vim-colorschemes'

" vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'

" gruvbox
Plugin 'morhetz/gruvbox'

" Linux Kernel Style
Plugin 'vivien/vim-linux-coding-style'

" Airline toolbar shit
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"cscope-maps
Plugin 'gnattishness/cscope_maps'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end. 
" plugin on Github repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosten on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file://home/gmarik/path/to/plugin
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtime properly
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a 
" different version somewhere else
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" 
" Brief help
" :PluginList           - lists configured plugins
" :PluginInstall        - installs plugins; append '!' to update or just
" :PluginUpdate
" :PluginSearch foo     - searches for foo; append '!' to refresh local cache
" :PluginClean          - confirms removal of unused plugins; append '!' to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non plugin stuff after this line
" ********************** stuff for Vundle
"
" separate installation stuff for ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" for the one colorscheme to rule them all
"colorscheme ChocolateLiquor

" for solarized
"syntax enable
"set background=dark
"set background=light
"colorscheme solarized

" gruvbox
"colorscheme gruvbox
"set background=dark
"set background=light
"
" set one for vim, one for gvim
if has('gui_running')
        syntax enable
        "set background=light
        set background=dark
        colorscheme solarized
        "colorscheme gruvbox
        set guioptions=aci
else
        colorscheme BlackSea
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
" ******************************************************************** ZEKE SETTINGS
"
" just gets rid of .un~ whatever files
set noundofile

"line numbers
set number

"when coding, auto-indent by 4 spaces (doesn't change tab)
set tabstop=4

"always replace TAB w 8 spaces, except for make files 
set expandtab
autocmd FileType make setlocal noexpandtab

"Jae's settings while editing *.txt files 
"	-automatically indent lines according to prev line
"	-replace tab w 8 spaces
"	-when i hit tab key, moves 2 spaces instead of 8
"	-wrap text if i go longer than 76 columns
"	-check spelling
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=76 spell spelllang=en_us

"dont do spell check on vim help files
autocmd FileType help setlocal nospell


"ignore case while searching
set ignorecase

" LINUX KERNEL CODING STYLE
" 80 characters line
set colorcolumn=81
" execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" Highlight Trailing Spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" LINUX KERNEL CODING STYLE

" FOLDING
set foldmethod=syntax
"set foldlevel=1
set foldclose=all
" ************************************************************************ ZEKE SETTINGS



"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit
