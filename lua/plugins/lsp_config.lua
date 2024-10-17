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
    },
  },
}
