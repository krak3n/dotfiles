return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  config = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- Go template
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

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "comment",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
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
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    })
  end,
}
