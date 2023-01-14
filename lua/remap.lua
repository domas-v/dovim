vim.g.mapleader = " "
vim.g.maplocalleader = ";"
local map = vim.keymap.set

-- move visual selection
map("v", "J", ":m '>+1<CR>gv=gv", {desc = 'Move visual line down'})
map("v", "K", ":m '<-2<CR>gv=gv", {desc = 'Move visual line up'})
map("v", "<", "<gv", {desc = 'Move visual line left'})
map("v", ">", ">gv", {desc = 'Move visual line right'})

--terminal 
-- map('t', '<C-w>h', '<C-\\><C-n><C-w>h', { noremap = true })
-- map('t', '<C-w>j', '<C-\\><C-n><C-w>j', { noremap = true })
-- map('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true })
-- map('t', '<C-w>l', '<C-\\><C-n><C-w>l', { noremap = true })

 -- wrapped line movement
map("n", "k", "gk")
map("n", "j", "gj")
map("n", "0", "g0")
map("n", "$", "g$")
map("n", "Y", "y$")

-- handy remaps
map("n", "J", "mzJ`z", {desc = 'Join lines'})
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<leader>q", "<cmd>close<cr>" )
map("n", "<leader>Q", "<cmd>qa<cr>")
map("n", "<esc>", "<cmd>nohl<cr>")
map("n", "<leader><leader>w", "<cmd>set wrap!<cr>")

-- yank to system clipboard
map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- pop up movement
map('i', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {expr = true, noremap = true})
map('i', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {expr = true, noremap = true})
map('c', '<C-k>', '<LEFT>', { noremap = true })
map('c', '<C-j>', '<RIGHT>', { noremap = true })
map('t', '<C-x>', '<C-\\><C-N>', { noremap = true })

-- search & replace
-- map("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- word under cursor
map("v", "<leader>r" , ":s/")  -- in visual selection
map("n", "<leader>r", ":%s/") -- in whole buffer
map("n", "<C-s>", "/")
map("n", "<C-a>", "?")
map("i", "<C-s>", "<esc>/")
map("i", "<C-a>", "<esc>?")

-- windows/buffers
map("n", "<leader>k", "<cmd>BufferNext<cr>")
map("i", "<C-s>", "<esc>/")
map("n", "<leader>j", "<cmd>BufferPrevious<cr>")
map("n", "<leader>O", "<cmd>only<cr>")
map("n", "<leader>*", "<cmd>BufferPin<cr>")
map("n", "<leader>]", "<cmd>BufferMoveNext<cr>")
map("n", "<leader>[", "<cmd>BufferMovePrevious<cr>")
map("n", "<leader>1", "<cmd>BufferGoto 1<cr>")
map("n", "<leader>2", "<cmd>BufferGoto 2<cr>")
map("n", "<leader>3", "<cmd>BufferGoto 3<cr>")
map("n", "<leader>4", "<cmd>BufferGoto 4<cr>")
map("n", "<leader>5", "<cmd>BufferGoto 5<cr>")
map("n", "<leader>0", "<cmd>BufferLast<cr>")
map("n", "<leader>wv", ":vert sb ")
map("n", "<leader>wx", ":sbuffer ")
map("n", "<leader>X",  "<cmd>bd! %<cr>")
map("n", "<leader>xx", "<cmd>BufferClose<cr>")
map("n", "<leader>xo", "<cmd>BufferCloseAllButCurrent<cr>")
map("n", "<leader>xj", "<cmd>BufferCloseBuffersLeft<cr>")
map("n", "<leader>xk", "<cmd>BufferCloseBuffersRight<cr>")
map("n", "<leader>x*", "<cmd>BufferCloseAllButPinned<cr>")

