return {
  "kmontocam/nvim-conda",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>vs", "<cmd>CondaActivate<cr>" },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { "<leader>vd", "<cmd>CondaDeactivate<cr>" },
  },
}
