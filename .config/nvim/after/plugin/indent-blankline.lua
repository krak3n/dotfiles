local ok, indentline = pcall(require, "indent_blankline")
if not ok then
	vim.notify("indent-blankline not installed")
	return
end

indentline.setup({
	enabled = true,
	char = "┊",
	show_end_of_line = true,
	show_current_context = true,
	show_current_context_start = true,
	use_treesitter = true,
	use_treesitter_scope = true,
})
