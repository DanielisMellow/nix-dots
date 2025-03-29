-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- @g macro will run current file
vim.cmd([[
	augroup run_file
		autocmd BufEnter *.py let @g=":w\<CR>:vsp |terminal python3 %\<CR>i"
	augroup end
]])

-- Autoformat setting
-- local set_autoformat = function(pattern, bool_val)
--     vim.api.nvim_create_autocmd({ "FileType" }, {
--         pattern = pattern,
--         callback = function()
--             vim.b.autoformat = bool_val
--         end,
--     })
-- end
-- vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/nvim/bin/python3"

--set_autoformat({ "python" }, false)
-- set_autoformat({ "lua" }, true)
