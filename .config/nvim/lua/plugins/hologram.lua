return {
	"edluffy/hologram.nvim",
	enabled = vim.fn.executable("kitty") == 1,
	config = function()
		require("hologram").setup({
			auto_display = true,
		})
	end,
}
