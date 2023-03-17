local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	vim.notify("treesitter not installed")
	return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("treesitter not installed")
	return
end

configs.setup({
	-- A list of parser names, or "all" (the four listed parsers should always be installed)
	ensure_installed = { 
		"c", 
		"dockerfile",
		"go", 
		"gomod", 
		"gosum", 
		"help", 
		"html",
		"javascript", 
		"json", 
		"lua", 
		"make",
		"markdown",
		"markdown_inline",
		"proto",
		"python",
		"ruby",
		"rust",
		"sql",
		"terraform",
		"vim", 
		"yaml", 
	},

	indent = {
		enable = true
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- Hilight settings
	highlight = {
		enable = true,

		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
			    return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})
