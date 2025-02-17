return {
  "folke/tokyonight.nvim",
  opts = {
    on_highlights = function(hl, c)
      hl.ColorColumn = { bg = "#F7768E" }
      hl.CursorLineNr = { fg = "#FFD700" }
      hl.LineNr = { fg = "#A9B1D6" }
      hl.LineNrAbove = { fg = "#A9B1D6" }
      hl.LineNrBelow = { fg = "#A9B1D6" }
    end,
  },
}
