local map = vim.keymap.set

-- git
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>")
map("n", "<leader>gx", "<cmd>DiffviewClose<cr>")
map("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>")
map("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>")
map("n", "<leader>gv", "<cmd>Gitsigns preview_hunk<cr>")
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>")
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>")
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>")
map("n", "<leader>gb", "<cmd>GitBlameToggle<cr>")

require('gitsigns').setup()
vim.g['gitblame_enabled'] = 0


local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(_)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

map("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

