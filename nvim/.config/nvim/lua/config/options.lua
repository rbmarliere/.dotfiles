vim.g.mapleader = " "
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
vim.g.c_syntax_for_h = 1

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backspace = "indent,eol,start"
vim.opt.encoding = "utf-8"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.guicursor="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = "tab:  ,trail:~"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.signcolumn = "yes"
vim.opt.title = true
vim.opt.updatetime = 50

vim.opt.backup = false
vim.opt.bdir = vim.fn.stdpath("cache") .. "/tmp"
vim.opt.dir = vim.fn.stdpath("cache") .. "/tmp"
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.stdpath("cache") .. "/tmp"
vim.opt.undofile = true

vim.opt.expandtab = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 8
vim.opt.smartindent = true
vim.opt.smarttab = false
vim.opt.softtabstop = 8
vim.opt.tabstop = 8
