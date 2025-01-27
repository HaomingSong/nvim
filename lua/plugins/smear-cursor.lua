return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  config = function()
    require("smear_cursor").setup({
      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      legacy_computing_symbols_support = false,
      stiffness = 0.8,
      trailing_stiffness = 0.6,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
      trailing_exponent = 0.3,
    })
  end,
}
