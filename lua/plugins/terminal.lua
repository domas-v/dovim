return {
    {
        'akinsho/toggleterm.nvim',
        config = function ()
            require("plugins.configurations.toggleterm")
        end,
        keys = {
            {"<c-\\>", "<cmd>ToggleTerm<cr>"},
            {"<leader>tt", "<cmd>ToggleTerm<cr>"},
            {"<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>"},
            {"<leader>tx", "<cmd>ToggleTerm direction=horizontal<cr>"},
            {"<leader>tw", "<cmd>ToggleTerm direction=tab<cr>"},
            {"<leader>ta", "<cmd>ToggleTermToggleAll<cr>"},
            {"<leader>t1", "<cmd>1ToggleTerm<cr>"},
            {"<leader>t2", "<cmd>2ToggleTerm<cr>"},
            {"<leader>t3", "<cmd>3ToggleTerm<cr>"},
        }
    },
    {
        'hkupty/iron.nvim',
        config = function ()
            require("plugins.configurations.iron")
        end,
        keys = {
            {"<leader>ii", "<cmd>IronRepl<cr>"},
            {"<leader>it", "<cmd>IronReplHere<cr>"},
            {"<leader>if", "<cmd>IronFocus<cr>"},
            {"<leader>ih", "<cmd>IronHide<cr>"},
        }
    },
}
