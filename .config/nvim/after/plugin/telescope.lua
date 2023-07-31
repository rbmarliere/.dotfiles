local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
telescope.setup({
	defaults = {
		layout_strategy = "bottom_pane",
		layout_config = {
			height = 0.5,
		},
		border = false,
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<C-u>"] = false,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git" },
		},
	},
	extensions = {
		live_grep_args = {
			vimgrep_arguments = {
				"rg",
				"--glob",
				"!.git",
				"--hidden",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			mappings = {
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				},
			},
		},
	},
})

local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-Space>", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
vim.keymap.set("n", "<Leader>pf", builtin.git_files, opts)
vim.keymap.set("n", "<Leader>pg", telescope.extensions.live_grep_args.live_grep_args, opts)
