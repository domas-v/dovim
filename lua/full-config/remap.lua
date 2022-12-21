vim.g.mapleader = " "
local map = vim.keymap.set

-- move visual selection
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

--terminal 
map('t', '<C-w>h', '<C-\\><C-n><C-w>h', { noremap = true })
map('t', '<C-w>j', '<C-\\><C-n><C-w>j', { noremap = true })
map('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true })
map('t', '<C-w>l', '<C-\\><C-n><C-w>l', { noremap = true })

 -- wrapped line movement
map("n", "k", "gk")
map("n", "j", "gj")
map("n", "0", "g0")
map("n", "$", "g$")
map("n", "Y", "y$")

-- handy remaps
map("n", "J", "mzJ`z") -- join lines, stay cursor
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<leader>q", "<cmd>q<cr>" )
map("n", "<leader>Q", "<cmd>qa<cr>")
map("n", "<esc>", "<cmd>nohl<cr>")

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
map("n", "<leader>br", ":%s/") -- in whole buffer
-- map("n", "<leader>s", "/") -- temporary search (currently telescope fuzzy buffer search doesn't work)

-- windows/buffers
map("n", "<leader>k", "<cmd>BufferNext<cr>")
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
map("n", "<leader>ws", ":sbuffer ")
map("n", "<leader>wr", "<cmd>WinResizerStartResize<cr>")
map("n", "<leader>wm", "<cmd>WinShift<cr>")
map("n", "<leader>wh", "<cmd>WinShift left<cr>")
map("n", "<leader>wk", "<cmd>WinShift up<cr>")
map("n", "<leader>wj", "<cmd>WinShift down<cr>")
map("n", "<leader>wl", "<cmd>WinShift right<cr>")
map("n", "<leader>X",  "<cmd>bd! %<cr>")
map("n","<leader>xx", "<cmd>BufferClose<cr>")
map("n","<leader>xf", "<cmd>bd ")
map("n","<leader>xo", "<cmd>BufferCloseAllButCurrent<cr>")
map("n","<leader>xj", "<cmd>BufferCloseBuffersLeft<cr>")
map("n","<leader>xk", "<cmd>BufferCloseBuffersRight<cr>")
map("n", "<leader>x*", "<cmd>BufferCloseAllButPinned<cr>")

-- git
map("n", "<leader>gg", "<cmd>Neogit<cr>")
map("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>")
map("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>")
map("n", "<leader>gv", "<cmd>Gitsigns preview_hunk<cr>")
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>")
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>")
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>")
map("n", "<leader>gb", "<cmd>GitBlameToggle<cr>")

-- debug

