-- Import lsp-zero
local mason_ok, _ = pcall(require, "mason")
if not mason_ok then
	vim.notify("mason not installed")

	return
end

-- Import mason settings
local mason_settings_ok, settings = pcall(require, "mason.settings")
if not mason_settings_ok then
	vim.notify("mason.settings not installed")

	return
end

settings.set({
	ui = {
		border = "rounded",
	},
})
