return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			python = { "isort", "ruff_format" },
			nix = { "nixpkgs_fmt" },
			lua = { "stylua" },
		},
		formatters = {
			stylua = {
				-- Prevent Mason from installing this formatter
				mason = false,
				-- Configure to use system stylua
				command = "stylua",
				args = { "--stdin-filepath", "$FILENAME", "-" },
				stdin = true,
			},
			isort = {
				mason = false,
				command = "isort",
				args = { "--stdout", "--filename", "$FILENAME", "-" },
				stdin = true,
			},
			ruff_format = {
				mason = false,
				command = "ruff",
				args = { "format", "-" },
				stdin = true,
			},
			nixpkgs_fmt = {
				mason = false,
				command = "nixpkgs-fmt",
				stdin = true,
			},
		},
	},
}
