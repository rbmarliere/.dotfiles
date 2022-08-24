syntax on
set background=light
colorscheme solarized
set mouse=a
set clipboard=unnamedplus
set encoding=utf-8
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent
set backspace=indent,eol,start
set number
set relativenumber
set complete=.,w,b,u
set dir=$HOME/.vim/swp/
set bdir=$HOME/.vim/bkp/
set autoread
set tags+=.git/tags,tags,$HOME/.tags
set hlsearch
set incsearch
let mapleader=' '
set list listchars=tab:\~\ ,trail:~
set statusline=%{expand('%:h')}/%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set hidden

nnoremap <C-w><C-t> :tabnew<CR>
nnoremap - :Ex<CR>
nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap <Leader>H :vertical resize +10<CR>
nnoremap <Leader>J :resize -10<CR>
nnoremap <Leader>K :resize +10<CR>
nnoremap <Leader>L :vertical resize -10<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap P :pu<CR>
nnoremap Y y$
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> _ v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"
nnoremap <silent> <Leader>fws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
cnoremap <expr> <CR> CCR()

" https://gist.github.com/romainl/047aca21e338df7ccf771f96858edb86
function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C^(ls|files|buffers)'
        return "\<CR>:b"
    elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif cmdline =~ '\v\C^(cli|lli)'
        return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
    elseif cmdline =~ '\C^old'
        set nomore
        return "\<CR>:sil se more|e #<"
    elseif cmdline =~ '\C^changes'
        set nomore
        return "\<CR>:sil se more|norm! g;\<S-Left>"
    elseif cmdline =~ '\C^ju'
        set nomore
        return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
    elseif cmdline =~ '\C^marks'
        return "\<CR>:norm! `"
    elseif cmdline =~ '\C^undol'
        return "\<CR>:u "
    else
        return "\<CR>"
    endif
endfunction

