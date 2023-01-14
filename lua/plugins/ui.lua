return {
    {
        'nvim-tree/nvim-tree.lua',
        config = function () require("nvim-tree").setup() end,
        keys = {
            { "<leader><TAB>", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
        },
    },
    {
        'simrat39/symbols-outline.nvim',
        config = function () require('symbols-outline').setup() end,
        keys = {
            { "<leader>>", "<cmd>SymbolsOutline<cr>", desc = "SymbolsOutline" }
        }
    },
    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function() require('trouble').setup() end,
        keys = { { "<leader>dl", "<cmd>TroubleToggle<cr>", desc = "TroubleToggle" } }
    },
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function() require('todo-comments').setup() end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require('indent_blankline').setup({
                space_char_blankline = ' ',
                show_current_context = true,
                show_current_context_start = false,
                filetype_exclude = { 'startup' },
            })
        end
    },
    {
        'romgrk/barbar.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    {
        'sindrets/winshift.nvim',
        config = function() require('winshift').setup() end,
        keys = {
            { "<leader>wm", "<cmd>WinShift<cr>", desc = "WinShift mode" },
            { "<leader>wh", "<cmd>WinShift left<cr>", desc = "Winshift left" },
            { "<leader>wk", "<cmd>WinShift up<cr>", desc = "WinShift up" },
            { "<leader>wj", "<cmd>WinShift down<cr>", desc = "WinShift down" },
            { "<leader>wl", "<cmd>WinShift right<cr>", desc = "WinShift right" },
        }
    },
    {
        'simeji/winresizer',
        keys = {
            { "<leader>wr", "<cmd>WinResizerStartResize<cr>", desc = "Win resize mode" }
        }
    },
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        dependencies = { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end }
    },
}
