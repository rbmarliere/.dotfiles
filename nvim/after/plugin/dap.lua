require("dapui").setup({
  layouts = { {
    elements = { {
      id = "breakpoints",
      size = 0.10
    }, {
      id = "stacks",
      size = 0.30
    }, {
      id = "watches",
      size = 0.20
    }, {
      id = "scopes",
      size = 0.40
    } },
    position = "left",
    size = 60
  }, {
    elements = { {
      id = "console",
      size = 0.25
    }, {
      id = "repl",
      size = 0.75
    } },
    position = "right",
    size = 170
  } },
})

local dapui_opened = false

local toggle_ui = function()
  local bufname = vim.fn.bufname()
  if bufname == "" then
    return
  end

  local dap_repl = vim.fn.bufnr("[dap-repl]")
  local repl_win = vim.fn.win_findbuf(dap_repl)[1]
  if repl_win == nil then
    -- if dap repl is not in a window, reset the flag
    dapui_opened = false
  end

  if dapui_opened then
    return
  end

  if vim.fn.tabpagebuflist()[2] == nil then
    require("dapui").open()
    dapui_opened = true
  else
    -- if current tab has more than one buffer, open dap ui in a new tab
    local curpos = vim.fn.getcurpos()
    vim.cmd.tabedit(bufname)
    vim.fn.setpos(".", curpos)

    require("dapui").open()
    dapui_opened = true
  end
end

local opts = { silent = true }

vim.keymap.set("n", "<C-x>", toggle_ui, opts)
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
vim.keymap.set("n", "<F4>", ":lua require'dap'.close()<CR>", opts)
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('condition: '))<CR>", opts)
vim.keymap.set("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", opts)
vim.keymap.set("n", "<Leader>lb", ":lua require'dap'.list_breakpoints()<CR>:copen<CR>", opts)
vim.keymap.set("n", "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('message: '))<CR>", opts)
