return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- Loads linting on file read/new file
	config = function()
		local lint = require("lint")
		local lint_enabled = false

		lint.linters_by_ft = {
			python = { "pylint", "mypy" },
		}

		-- Function to toggle linting
		function ToggleLintDiagnostics()
			lint_enabled = not lint_enabled
			if lint_enabled then
				print("🔍 Lint Diagnostics Enabled")
				lint.try_lint() -- Re-run linting to show diagnostics
			else
				print("🚫 Lint Diagnostics Hidden")
				vim.diagnostic.hide(nil, 0) -- Hides linting diagnostics without stopping the linter
			end
		end
		-- Set keymap inside config function
		vim.api.nvim_set_keymap("n", "<leader>i", ":lua ToggleLintDiagnostics()<CR>", { noremap = true, silent = true })
	end,
}
