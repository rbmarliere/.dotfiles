vim.g.mapleader = " "
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.bdir = os.getenv("HOME") .. "/.config/nvim/tmp"
vim.opt.colorcolumn = "90"
vim.opt.dir = os.getenv("HOME") .. "/.config/nvim/tmp"
vim.opt.encoding = "utf-8"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.guicursor = "a:blinkon100"
vim.opt.guicursor = "a:blinkon100"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = "tab:~ ,trail:~"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 8
vim.opt.sessionoptions:remove({ "blank", "terminal" }) -- exclude nvim-dap buffers
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/tmp"
vim.opt.undofile = true
vim.opt.updatetime = 50

vim.opt.expandtab = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 8
vim.opt.smartindent = true
vim.opt.smarttab = false
vim.opt.softtabstop = 8
vim.opt.tabstop = 8
