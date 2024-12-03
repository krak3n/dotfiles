return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree = require("neo-tree")
    local icons = require("core.icons")

    neotree.setup({
      window = {
        position = "right",
      },
      git_status = {
        symbols = {
          -- Change type
          added = icons.git.FileAdded, -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = icons.git.FileDeleted, -- this can only be used in the git_status source
          renamed = icons.git.FileRenamed, -- this can only be used in the git_status source
          -- Status type
          untracked = icons.git.FileUntracked,
          ignored = icons.git.FileIgnored,
          unstaged = icons.git.FileUnstaged,
          staged = icons.git.FileStaged,
          conflict = icons.git.Conflict,
        },
      },
    })

    local whichkey = require("which-key")

    whichkey.add({
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree", mode = "n" },
    })
  end,
}
