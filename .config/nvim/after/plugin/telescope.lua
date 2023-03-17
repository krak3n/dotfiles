local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("telescope not installed")
	return
end


local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
	vim.notify("telescope not installed")
	return
end

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.live_grep, {})
