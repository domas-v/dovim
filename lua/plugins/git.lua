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
                },
                disable_commit_confirmation = true
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
        lazy = false,
        config = function () require('gitsigns').setup() end,
        keys = {
            { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Gitsigns next" },
            { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Gitsigns prev" },
            { "<leader>gv", "<cmd>Gitsigns preview_hunk<cr>", desc = "Gitsigns preview" },
            { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Gitsigns stage" },
            { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Gitsigns undo stage" },
            { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Gitsigns reset" }
        }

    },
    {
        'f-person/git-blame.nvim',
        keys = { { "<leader>gb", "<cmd>GitBlameToggle<cr>" } }
    }
}
