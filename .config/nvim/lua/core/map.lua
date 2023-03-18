local toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

local opts = { noremap = true }

vim.g.mapleader = " "

vim.keymap.set("n", "-", ":Ex<CR>", opts)
vim.keymap.set("n", "<Bar>", "<C-W>v<C-W><Right>", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-w><C-t>", ":tabnew<CR>", opts)
vim.keymap.set("n", "<C-w>C", ":tabclose<CR>", opts)
vim.keymap.set("n", "<Leader><Leader><Leader><Leader><Leader><Leader>l", "<Plug>NetrwRefresh", opts)
vim.keymap.set("n", "<Leader><Space>", ":nohlsearch<CR>", opts)
vim.keymap.set("n", "<Leader>H", ":vertical resize +10<CR>", opts)
vim.keymap.set("n", "<Leader>J", ":resize -10<CR>", opts)
vim.keymap.set("n", "<Leader>K", ":resize +10<CR>", opts)
vim.keymap.set("n", "<Leader>L", ":vertical resize -10<CR>", opts)
vim.keymap.set("n", "<Leader>W", ":w !sudo tee % > /dev/null<CR>", opts)
vim.keymap.set("n", "<Leader>Y", '"+y$', opts)
vim.keymap.set("n", "<Leader>q", toggle_qf, opts)
vim.keymap.set("n", "<Leader>rs", ":source ~/.config/nvim/sessions/", opts)
vim.keymap.set("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)
vim.keymap.set("n", "<Leader>ss", ":mksession! ~/.config/nvim/sessions/", opts)
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "P", ":pu<CR>", opts)
vim.keymap.set("n", "_", "<C-W>s<C-W><Down>", opts)
vim.keymap.set("n", "gp", "`[v`]", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set({ "n", "v" }, "<Leader>P", '"+p', opts)
vim.keymap.set({ "n", "v" }, "<Leader>p", '"_dP', opts)
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', opts)
