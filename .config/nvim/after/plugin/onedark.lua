local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	vim.notify("onedark not installed")
	return
end

onedark.setup({})
onedark.load()
