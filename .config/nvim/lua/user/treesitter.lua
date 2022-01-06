local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("failed to require nvim-treesitter.configs")

  return
end

configs.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {
      "yaml"
    }
  },
  -- Rainbow parentheses
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  -- Comments
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
