local function ts_organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<Leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workLeader_folders()))
  end, opts)
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<Leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "<buffer>",
    callback = function()
      if client.name == "tsserver" then
        ts_organize_imports()
      elseif client.supports_method("textDocument/codeAction") then
        local response = client.request_sync("textDocument/codeAction", vim.lsp.util.make_range_params())
        if response and response.result then
          local code_actions = response.result
          if code_actions then
            for _, code_action_object in ipairs(code_actions) do
              -- print(vim.inspect(code_action_object))
              if code_action_object.kind == "source.organizeImports" then
                vim.lsp.buf.code_action({
                  context = { only = { "source.organizeImports" } },
                  apply = true,
                })
              end
            end
          end
        end
      end
      vim.lsp.buf.format()
    end,
  })
end

local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.on_attach(on_attach)
lsp.configure("pylsp", {
  -- organizeImports requires pylsp-rope
  on_attach = function(client, bufnr) end,
  settings = {
    pylsp = {
      plugins = {
        mccabe = {
          threshold = 20,
        },
      },
    },
  },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

local null_ls = require("null-ls")
null_ls.setup({
  on_attach = on_attach,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier.with({
      disabled_filetypes = {
        "javascript",
        --   "javascriptreact",
        --   "javascript.jsx",
        "typescript",
        --   "typescriptreact",
        --   "typescript.tsx",
      },
    }),
  },
})
