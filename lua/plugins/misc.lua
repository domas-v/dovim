return {
    {
        'jbyuki/nabla.nvim',
        ft = { 'markdown', 'md' },
        keys = {
            { '<leader><leader>ne', ':lua require("nabla").enable_virt()<CR>', desc = "Enable Nabla" },
            { '<leader><leader>np', ':lua require("nabla").popup()<CR>', desc = "Nabla popup" },
        }
    },
    {
        -- BUG: 'edluffy/hologram.nvim' -- messages on different files. check this pr: https://github.com/edluffy/hologram.nvim/pull/26
        'lucasdf/hologram.nvim', branch = 'get-extmarks-error-handler',
        config = function () require('hologram').setup({auto_display = true}) end,
        ft = { 'markdown', 'md' }
    },
    -- TODO: jupyter support: https://github.com/dccsillag/magma-nvim
    {
        "iamcco/markdown-preview.nvim",
        lazy = false, -- TODO: possible to lazy load?
        build = function() vim.fn["mkdp#util#install"]() end,
        keys = {
            { "<leader><leader>m", "<cmd>MarkdownPreviewToggle<cr>", desc = "MarkdownPreview" }
        }
    },
    {
        'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 0.80, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    width = 100,
                    height = 0.9,
                    options = {
                        signcolumn = "no",
                        number = false,
                        relativenumber = false,
                        cursorline = false,
                        cursorcolumn = false,
                        foldcolumn = "0",
                        list = true,
                    },
                },
                plugins = {
                    kitty = {
                        enabled = true,
                        font = "+9"
                    },
                    gitsigns = {
                        enabled = true
                    }
                }
            }
        end,
        keys = {
            { '<leader><leader>z', '<cmd>ZenMode<cr>' }
        }
    },
    {
        'folke/twilight.nvim',
        config = function() require("twilight").setup() end
    },
    {
        'arakkkkk/kanban.nvim',
        config = function() require('kanban').setup() end
    }

}
