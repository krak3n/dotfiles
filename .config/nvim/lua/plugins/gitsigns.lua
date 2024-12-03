return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({})

    local whichkey = require("which-key")

    whichkey.add({
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk", mode = "n" },
      { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Line Git Blame", mode = "n" },
    })
  end,
}
