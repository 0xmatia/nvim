-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Normal Mode remaps ]]
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "Q", "<cmd>BufferClose<CR>", { noremap = true, silent = true })

-- move split panes
vim.keymap.set("n", "<A-h>", "<C-W>H", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<C-W>J", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", "<C-W>K", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", "<C-W>L", { noremap = true, silent = true })

-- buffers
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>B", "<cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-p>", "<cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "Q",  "<cmd>Bdelete<CR>", { noremap = true, silent = true })

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- nvim tree
vim.keymap.set("n", "<leader>e", "<cmd>:Neotree toggle<CR>", { noremap = true, silent = true })

-- stop highlighting formatted text
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<cr>", { noremap = true, silent = true })

-- copy/paste to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", [["+y]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", [["+p]], { noremap = true, silent = true })

-- [[ Insert Mode remaps ]]

-- exit insert mode
vim.keymap.set("i", "ii", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })

-- move lines up and down
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- exit insert mode
vim.keymap.set("i", "ii", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "qq", "<Esc>", { noremap = true, silent = true })

-- [[ Visual mode remaps ]]

-- exit visual mode
vim.keymap.set("v", "qq", "<Esc>", { noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- copy to sytstem clipboard
vim.keymap.set("v", "<leader>y", [["+y]], { noremap = true, silent = true })

-- delete but do not save to register
vim.keymap.set("v", "<leader>d", [["_d]], { noremap = true, silent = true })

-- [[ Visual block mode remaps ]]
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
