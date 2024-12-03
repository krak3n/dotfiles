-- Format on save and linters
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters
    local completion = null_ls.builtins.completion -- completion

    -- list of formatters & linters for mason to install
    require("mason-null-ls").setup({
      ensure_installed = {
        "buf",
        "goimports",
        "gofumpt",
        "golines",
        "prettier",
        "stylua",
        "shfmt",
        "yamlfmt",
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true,
    })

    local goimports_reviser_company_prefixes = os.getenv("GOIMPORTS_REVISER_COMPANY_PREFIXES")

    local sources = {
      -- General
      completion.spell,
      -- formatting.trim_whitespace,
      -- formatting.trim_newlines,
      -- Golang
      formatting.gofumpt,
      formatting.goimports,
      formatting.goimports_reviser.with({
        extra_args = {
          -- "-rm-unused",
          -- "-set-alias",
          -- "-use-cache",
          "-company-prefixes",
          goimports_reviser_company_prefixes,
          "-imports-order",
          "std,general,company,project,blanked,dotted",
        },
      }),
      formatting.golines.with({
        extra_args = { "-m 256" },
      }),
      -- Terraform
      formatting.terraform_fmt,
      -- Protocol Buffers
      formatting.buf,
      diagnostics.buf,
      -- Lua
      formatting.stylua,
      -- Yaml, JSON etc
      formatting.prettier,
      formatting.prettier.with({
        filetypes = { "html", "json", "yaml", "markdown" },
        extra_filetypes = {
          "toml",
        },
      }),
    }

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
