return { -- Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
    },
    {
      "nvim-tree/nvim-web-devicons",
      enabled = vim.g.have_nerd_font,
    },
  },
  config = function()
    local wk = require("which-key")

    wk.add({
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers", mode = "n" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
      { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text", mode = "n" },
      { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find string", mode = "n" },
      { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Resume Last Search", mode = "n" },
      { "<leader>fl", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch", mode = "n" },
      { "<leader>fl", "<cmd>Telescope git_commit<cr>", desc = "Checkout Commit", mode = "n" },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t\t.*$")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })

    local icons = require("core.icons")
    local actions = require("telescope.actions")

    local function filenameFirst(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == "." then
        return tail
      end
      return string.format("%s\t\t%s", tail, parent)
    end

    require("telescope").setup({
      defaults = {
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = icons.ui.Forward .. " ",
        entry_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        path_display = { "smart" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        sorting_strategy = nil,
        layout_strategy = nil,
        layout_config = {},
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
          },
          n = {
            ["<esc>"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        planets = {
          show_pluto = true,
          show_moon = true,
        },

        colorscheme = {
          enable_preview = true,
        },

        live_grep = {
          theme = "ivy",
          file_ignore_patterns = { ".git", "node_modules" },
          additional_args = function()
            return { "--hidden" }
          end
        },

        grep_string = {
          theme = "ivy",
        },

        find_files = {
          theme = "dropdown",
          previewer = false,
          path_display = filenameFirst,
          file_ignore_patterns = { ".git", "node_modules" },
          hidden = true,
        },

        git_commits = {
          theme = "ivy",
        },

        git_branches = {
          theme = "ivy",
        },

        buffers = {
          theme = "ivy",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },

        lsp_references = {
          theme = "dropdown",
          initial_mode = "normal",
        },

        lsp_definitions = {
          theme = "dropdown",
          initial_mode = "normal",
        },

        lsp_declarations = {
          theme = "dropdown",
          initial_mode = "normal",
        },

        lsp_implementations = {
          theme = "dropdown",
          initial_mode = "normal",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    })
  end,
}
