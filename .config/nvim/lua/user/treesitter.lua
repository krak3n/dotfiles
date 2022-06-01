local configs_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_ok then
	vim.notify("failed to require nvim-treesitter.configs")

	return
end

local parsers_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_ok then
	vim.notify("failed to require nvim-treesitter.parsers")

	return
end

local parser_config = parsers.get_parser_configs()

parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = {
			"src/parser.c",
		},
	},
	filetype = "gotmpl",
	used_by = {
		"gohtmltmpl",
		"gotexttmpl",
		"gotmpl",
	},
}

configs.setup({
	ensure_installed = "all",
	ignore_install = { "phpdoc" },
	sync_install = false,
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
			"yaml",
		},
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
})
