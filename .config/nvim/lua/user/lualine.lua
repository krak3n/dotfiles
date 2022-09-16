local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	vim.notify("failed to require lualine")

	return
end

local onedark_ok, onedark = pcall(require, "lualine.themes.onedark")
if not onedark_ok then
	vim.notify("failed to require lualine.themes.onedark")

	return
end

lualine.setup({
	options = {
		theme = onedark,
		globalstatus = true,
		icons_enabled = true,
		always_divide_middle = true,
		section_separators = { left = "", right = "" },
		component_separators = "|",
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
