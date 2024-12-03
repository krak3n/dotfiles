return {
  "navarasu/onedark.nvim",
  lazy = false, -- load on start up
  priority = 1000, -- highest priority
  config = function()
    local onedark = require("onedark")

    onedark.setup({
      style = "dark",
      highlights = {
        -- make floating windows transparent
        Pmenu = { bg = "none" },
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    })

    onedark.load()
  end,
}
