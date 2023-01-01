-- require("toggleterm").setup()
require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = function (term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.2
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    -- size = 50,
    direction = 'vertical',
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    close_on_exit = true,
    float_opts = {
        border = 'curved',
    }
})

local map = vim.keymap.set
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>")
map("n", "<leader>tv",  "<cmd>ToggleTerm direction=vertical<cr>")
map("n", "<leader>tx",  "<cmd>ToggleTerm direction=horizontal<cr>")
map("n", "<leader>tw",  "<cmd>ToggleTerm direction=tab<cr>")
map("n", "<leader>ta",  "<cmd>ToggleTermToggleAll<cr>")
map("n", "<leader>t1", "<cmd>1ToggleTerm<cr>")
map("n", "<leader>t2", "<cmd>2ToggleTerm<cr>")
map("n", "<leader>t3", "<cmd>3ToggleTerm<cr>")

map("n", "<leader>ee", "<cmd>ToggleTermSendCurrentLine<cr>")
map("v", "<leader>ev", "<cmd>ToggleTermSendVisualSelection<cr>")
map("v", "<leader>el", "<cmd>ToggleTermSendVisualLines<cr>")
