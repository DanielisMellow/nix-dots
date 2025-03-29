return {
  "lambdalisue/suda.vim",
  config = function()
    -- Optionally, create a custom command or key mapping.
    -- For example, map :W to call :SudaWrite
    vim.api.nvim_create_user_command("W", function()
      vim.cmd("SudaWrite")
    end, { desc = "Write file with sudo" })

    -- You could also add a keymap:
    -- vim.keymap.set("n", "<leader>W", "<cmd>SudaWrite<CR>", { desc = "Write file with sudo" })
  end,
}
