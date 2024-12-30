return {
	"saghen/blink.cmp",
	version = "*",
	-- build = 'cargo build --release',
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "saghen/blink.compat", lazy = true, version = false },
		{ "epwalsh/obsidian.nvim" },
	},
	opts = {
		enabled = function()
			return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
		end,
		keymap = { preset = "default" },
		signature = { enabled = true },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			menu = {
				-- ExtraWhiteSpace is red in alabaster theme, disable it here
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None,ExtraWhiteSpace:Normal",
			},
		},
		sources = {
			default = { "obsidian", "obsidian_new", "obsidian_tags", "lazydev", "lsp", "path", "snippets", "buffer" },
			cmdline = {},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				snippets = {
					opts = {
						search_paths = {
							vim.fn.stdpath("config") .. "/snippets",
							"snippets", -- relative path, per-project
						},
					},
				},
				obsidian = {
					name = "obsidian",
					module = "blink.compat.source",
					score_offset = 100,
				},
				obsidian_new = {
					name = "obsidian_new",
					module = "blink.compat.source",
					score_offset = 100,
				},
				obsidian_tags = {
					name = "obsidian_tags",
					module = "blink.compat.source",
					score_offset = 100,
				},
			},
		},
	},
}
