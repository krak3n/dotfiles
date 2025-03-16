require("core.options")
require("core.keymaps")

-- Ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    require("plugins.theme"),
    require("plugins.whichkey"),
    require("plugins.neotree"),
    require("plugins.bufferline"),
    require("plugins.lualine"),
    require("plugins.treesitter"),
    require("plugins.telescope"),
    require("plugins.lsp"),
    require("plugins.cmp"),
    require("plugins.fmt"),
    -- require("plugins.indent"),
    require("plugins.hlchunk"),
    require("plugins.todo"),
    require("plugins.sleuth"),
    require("plugins.colorizer"),
    require("plugins.gitsigns"),
    require("plugins.smear"),
    require("plugins.ghostty"),
  },
  install = {
    colorschme = { "onedark", "default" },
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
})
