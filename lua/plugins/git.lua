vim.g['gitblame_enabled'] = 0
return {
    {
        'TimUntersberger/neogit',
        dependencies = {
            'sindrets/diffview.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function ()
            require('neogit').setup({
                kind = "vsplit",
                integrations = {
                    diffview = true
                }
            })
            -- map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>")
            -- map("n", "<leader>gx", "<cmd>DiffviewClose<cr>")
        end,
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffviewOpen" },
            { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "DiffviewClose" },
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup()
            local map = vim.keymap.set
            map("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>")
            map("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>")
            map("n", "<leader>gv", "<cmd>Gitsigns preview_hunk<cr>")
            map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>")
            map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>")
            map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>")
        end

    },
    {
        'f-person/git-blame.nvim',
        keys = { { "<leader>gb", "<cmd>GitBlameToggle<cr>" } }
    }
}
