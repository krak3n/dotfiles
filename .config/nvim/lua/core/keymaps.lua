local keymap = vim.keymap.set

-- Remap Leader to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function normal(lhs, rhs, opts)
  keymap("n", lhs, rhs, opts)
end

local function visualselect(lhs, rhs, opts)
  keymap("v", lhs, rhs, opts)
end

local function visual(lhs, rhs, opts)
  keymap("x", lhs, rhs, opts)
end

-- Disable space bar default behaviour in Normal or Visual mode
keymap({ "n", "v" }, "<Spance>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

-- Save file
normal("<C-s>", "<cmd> w <CR>", opts)

-- Save file without auto formatting
normal("<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- Quit file
normal("<C-q>", "<cmd> q <CR>", opts)

-- Delete single character without copying into registry
normal("x", '"_x', opts)

-- Vertical scroll and centre
normal('<C-d>', '<C-d>zz', opts)
normal('<C-u>', '<C-u>zz', opts)

-- Find and centre
normal("n", "nzz", opts)
normal("N", "Nzz", opts)
normal("*", "*zz", opts)
normal("#", "#zz", opts)

-- Stay in indent mode
visualselect("<", "<gv", opts)
visualselect(">", ">gv", opts)

-- Keep the yanked item in the registry when pasting
visual("p", [["_dP]])

-- Buffers
normal("<Tab>", ":bnext<CR>", opts)
normal("<S-Tab>", ":bprevious<CR>", opts)
normal("<leader>x", ":Bdelete!<CR>", opts)
normal("<leader>b", "<cmd> enew<CR>", opts)

-- Window navigation
normal("<C-h>", "<C-w>h", opts)
normal("<C-j>", "<C-w>j", opts)
normal("<C-k>", "<C-w>k", opts)
normal("<C-l>", "<C-w>l", opts)
