-- setupindent_blankline
local ok, indent = pcall(require, "indent_blankline")
if not ok then
  vim.notify("failed to require indent_blanklin")

  return
end

indent.setup{
  char = "┊",
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = {'help', 'packer', 'NvimTree', 'lsp-installer'},
  use_treesitter = true,
}
