local o  = vim.o  -- global options
local wo = vim.wo -- window local options
-- local cmd = vim.cmd -- vim commands
local g = vim.g -- vim variables, like g:variable = something

-- line numbers
wo.linebreak = true
o.nu = true
o.relativenumber = true

-- tabs and spaces
o.tabstop = 4
o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.smartindent = true

-- remove clutter
o.swapfile = false
o.writebackup = false
o.backup = false
o.shortmess= o.shortmess .. 'c'

-- appearance
wo.conceallevel = 2
o.splitbelow = true
o.splitright = true
o.shiftround = true
o.wrap = true
o.cmdheight = 1
o.showmatch = true  -- show bracket macthing
o.scrolloff = 8
o.signcolumn = "yes"
o.termguicolors = true

-- folds
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- search
o.ignorecase = true
o.smartcase = true
-- o.hlsearch = false
o.incsearch = true

-- misc
o.mouse = "a"
o.hidden = true -- allow unsaved buffers
o.completeopt = "menuone,noselect" -- completion type

-- performance
o.updatetime = 100
o.timeoutlen = 600
o.lazyredraw = false

-- bufferline
g.bufferline = {
    icon_pinned = '車',
    insert_at_end = true,
    icons = 'both'
}
