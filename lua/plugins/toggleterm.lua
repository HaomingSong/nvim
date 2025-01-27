return {
  "akinsho/toggleterm.nvim",
  -- event = "VeryLazy",
  version = "*",
  config = function()
    function _G.open_floating_terminal()
      if not FloatTerminal then
        FloatTerminal = require("toggleterm.terminal").Terminal:new({
          hidden = true,
          close_on_exit = true,
          direction = "float",
          highlights = {
            Normal = {
              guibg = "None",
            },
            NormalFloat = {
              link = "Normal",
            },
            FloatBorder = {
              guifg = "#89b4fa",
            },
          },
        })
      end
      FloatTerminal.float_opts = {
        width = math.ceil(0.8 * vim.o.columns),
        height = math.ceil(0.8 * vim.o.lines),
        row = math.ceil(0.1 * vim.o.lines),
        col = math.ceil(0.1 * vim.o.columns),
        border = "double",
        winblend = 0,
      }
      FloatTerminal:toggle()
    end
    vim.keymap.set({ "n", "t" }, "<A-i>", "<cmd>lua open_floating_terminal()<CR>", {
      silent = true,
      desc = "toggle float terminal",
    })
    vim.keymap.set({ "n" }, "<C-t>", function()
      if require("toggleterm.ui").find_open_windows() then
        vim.cmd("ToggleTermToggleAll")
      end
      vim.cmd("ToggleTerm " .. vim.v.count)
    end, { silent = true })
    vim.keymap.set({ "t", "n", "i" }, "<A-a>", "<cmd>ToggleTermToggleAll<CR>", { silent = true })
    require("toggleterm").setup({
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return vim.o.lines * 0.4
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<A-h>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
      -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
      -- on_open = fun(t: Terminal), -- function to run when the terminal opens
      -- on_close = fun(t: Terminal), -- function to run when the terminal closes
      -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
      -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
      -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
          -- guibg = "#1e222a",
          -- guifg = "#89b4fa",
        },
        NormalFloat = {
          link = "Normal",
        },
      },
      shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
      -- shading_factor = "<number>", -- the percentage by which to lighten dark terminal background, default: -30
      -- shading_ratio = "<number>", -- the ratio of shading factor for light/dark terminal background, default: -3
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = false,
      persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
      direction = "horizontal", --"vertical" | "horizontal" | "tab" | "float",
      close_on_exit = true, -- close the terminal window when the process exits
      clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
      -- Change the default shell. Can be a string or a function returning a string
      shell = vim.o.shell,
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
      -- This field is only relevant if direction is set to 'float'
      winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
      responsiveness = {
        -- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
        -- instead of next to each other
        -- default = 0 which means the feature is turned off
        horizontal_breakpoint = 135,
      },
    })
  end,
}
