--
-- LSP via lsp-zero
--

local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
	vim.notify("lsp-zero not installed")

	return
end

-- Set vim diagnostic signs
local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

-- Use recommended preset
lsp.preset("recommended")

-- Ensure the follow LSP clients are installed
lsp.ensure_installed({
	"bufls",
	"gopls",
	"jsonls",
	"lua_ls",
	"rust_analyzer",
	"yamlls",
})

-- Set LSP on_attach function for mappings
lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "D", function()
    vim.diagnostic.open_float(nil, { focus = false })
	end, opts)
end)

-- Configure lua language server for neovim
lsp.nvim_workspace()

-- Configure gopls
lsp.configure("gopls", {
	settings = {
		gopls = {
			analyses = {
				fieldalignment = true,
			},
			semanticTokens = true,
			completeUnimported = true,
			directoryFilters = {
				"-.git",
			},
			usePlaceholders = true,
		},
	},
})

-- Configure Lua
lsp.configure("lua-language-server", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- General LSP Preferences
lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = signs.Error,
		warn = signs.Warn,
		hint = signs.Hint,
		info = signs.Info,
	},
})

-- Setup lsp
lsp.setup()

-- Setup Key Binding for Mason
vim.keymap.set("n", "<leader>m", ":Mason<CR>")

--
-- Completion via nvim-cmp
--

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	vim.notify("nvim-cmp not installed")

	return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
	vim.notify("nvim-cmp not installed")

	return
end

local cmp_config = lsp.defaults.cmp_config({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = lsp.defaults.cmp_mappings({
		-- Tab goes to next item
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- Shift+Tab goes to previous item
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- Enter explcitly selects current selected item.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	window = {
		completion = cmp.config.window.bordered(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

cmp.setup(cmp_config)

--
-- Formatting / Diagnostics from null-ls
--

local null_ok, null = pcall(require, "null-ls")
if not null_ok then
	vim.notify("failed to require null-ls")

	return
end

-- Set diagnostic signs
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- null-opts from lsp
local null_opts = lsp.build_options("null-ls", {})
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null.builtins.diagnostics
-- if you want to set up formatting on save, you can use this as a callback
local lsp_formatting_cb = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		bofnr = bufnr,
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end

-- Setup null-ls
null.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = lsp_formatting_cb, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = lsp_formatting_cb,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
	sources = {
		-- General
		formatting.prettier.with({
			extra_args = { "--no-semi", "--jsx-single-quote" },
			disable_filetypes = { "yaml", "gotmpl" },
		}),
		-- Golang
		formatting.gofumpt,
		formatting.goimports,
		formatting.golines.with({
			extra_args = { "-m 128" },
		}),
		diagnostics.golangci_lint,
		-- Lua
		formatting.stylua,
		-- Protocol Buffers
		diagnostics.buf,
		formatting.buf,
	},
})

-- Set diagnostic config
vim.diagnostic.config({
	severity_sort = true,
  virtual_text = false,
	float = {
		source = "always",
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
	},
})
