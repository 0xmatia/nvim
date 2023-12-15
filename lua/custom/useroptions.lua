-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = true

-- Row numbers
vim.opt.number = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- match brackets
vim.opt.showmatch = true

-- autoindent
vim.opt.autoindent = true

-- popup menu hight
vim.opt.pumheight = 10 

-- highlight line
vim.opt.cursorline = true 

-- smart indentation
vim.opt.smartindent = true

-- always split below
vim.opt.splitbelow = true

-- always split to the right 
vim.opt.splitright = true 

-- persistent undo
vim.opt.undofile = true

-- tab as 4 spaces
vim.opt.tabstop = 4
