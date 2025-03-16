local function toggleHLChunk()
  if vim.g.hlchunkDisabled then
    vim.cmd.EnableHLIndent()
    vim.cmd.EnableHLChunk()
    -- vim.cmd.EnableHLLineNum()
  else
    vim.cmd.DisableHLIndent()
    vim.cmd.DisableHLChunk()
    -- vim.cmd.DisableHLLineNum()
  end
  vim.g.hlchunkDisabled = not vim.g.hlchunkDisabled
end

return {
  {
    "shellRaining/hlchunk.nvim",
    lazy = true,
    opts = {
      chunk = {
        enable = true,
        style = {
          {
            fg = "#c678dd",
          },
          {
            fg = "#e86671",
          },
        },
      },
      indent = {
        enable = true,
        use_treesitter = true,
        chars = {
          "┊",
        },
        filter_list = {
          function(v)
            return v.level ~= 1
          end,
        },
      },
      blank = {
        enable = false,
      },
      line_num = {
        enable = false,
        style = {
          {
            fg = "#c678dd",
          },
          {
            fg = "#e86671",
          },
        },
      },
    },
    config = function(_, opts)
      require("hlchunk").setup(opts)
      toggleHLChunk()
    end,
    keys = {
      {
        "<leader>ti",
        function()
          toggleHLChunk()
        end,
        desc = "Toggle Indentation",
      },
    },
  },
}
