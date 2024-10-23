return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          basedpyright = {
            typeCheckingMode = "off",
          },
        },
      },
      ruff = {
        mason = false,
        autostart = false,
      },
      ruff_lsp = {
        mason = false,
        autostart = false,
      },
    },
  },
}
