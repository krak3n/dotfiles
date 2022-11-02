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
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					--[[ vim.lsp.buf.formatting_sync() ]]
				end,
			})
		end
	end,
	--[[ on_attach = function(client) ]]
	--[[ 	-- Format on save ]]
	--[[ 	if client.server_capabilities.document_formatting then ]]
	--[[ 		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()") ]]
	--[[ 	end ]]
	--[[ end, ]]
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
		-- formatting.goimports,
		formatting.golines.with({
			extra_args = { "-m 128" },
		}),
		diagnostics.golangci_lint,
		-- Protocol Buffers
		diagnostics.buf,
		formatting.buf,
		-- Terraform
		formatting.terraform_fmt,
	},
})
