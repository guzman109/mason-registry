vim.env.LAZY_STDPATH = ".repro"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

require("lazy.minit").repro({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- add any other plugins here
		{
			"mason-org/mason.nvim",
			opts = {
				registries = { "file:~/Projects/NeoVIM/mason-registry/" },
				ensure_installed = {
				  "swiftlint",
				  "swiftformat"
				},
			},
		},
		{
			"nvim-treesitter/nvim-treesitter",
			opts = {
				ensure_installed = {
					"swift",
				},
			},
		},
		-- {
		-- 	"mason-org/mason.nvim",
		-- 	opts = {
		-- 	},
		-- },

		-- LSP configuration for Swift (SourceKit)
		{
			"neovim/nvim-lspconfig",
			opts = {
				servers = {
					sourcekit = {
						cmd = { "sourcekit-lsp" },
						filetypes = { "swift" },
						autostart = true,
					},
				},
			},
		},

		-- Formatter: swiftformat
		{
			"stevearc/conform.nvim",
			opts = {
				formatters_by_ft = {
					swift = { "swiftformat" },
				},
				formatters = {
					swiftformat = {
						command = "swiftformat",
						args = {
							"--indent",
							"4",
							"--indentcase",
							"false",
							"--trimwhitespace",
							"always",
							"--wraparguments",
							"before-first",
							"--wrapcollections",
							"before-first",
							"--self",
							"insert",
							"--importgrouping",
							"alphabetized",
							"$FILENAME",
						},
						stdin = false,
					},
				},
			},
		},

		-- Linter: swiftlint
		{
			"mfussenegger/nvim-lint",
			opts = {
				linters_by_ft = {
					swift = { "swiftlint" },
				},
			},
		},
	},
})
