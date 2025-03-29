return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			lua_ls = {
				-- Don't use Mason for this server
				mason = false,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			},
			pyright = {
				mason = false,
			},
			jedi_language_server = {
				mason = false,
			},
		},
		setup = {
			pyright = function()
				require("lazyvim.util").lsp.on_attach(function(client, _)
					if client.name == "pyright" then
						-- Disable hover from Pyright (Jedi will handle it)
						client.server_capabilities.hoverProvider = false
					end
				end)
			end,
		},
	},
}
