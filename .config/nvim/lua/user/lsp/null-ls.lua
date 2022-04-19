local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("failed to require null-ls")

	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	on_attach = function(client)
		-- Format on save
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
	sources = {
		-- General
		formatting.prettier.with({
			extra_args = { "--no-semi", "--jsx-single-quote" },
			disable_filetypes = { "yaml", "gotmpl" },
		}),
		-- Make
		formatting.cmake_format,
		-- Lua
		formatting.stylua,
		-- Python
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		-- Golang
		formatting.gofumpt,
		formatting.goimports,
		formatting.golines.with({
			extra_args = { "-m 128" },
		}),
		diagnostics.golangci_lint,
	},
})
