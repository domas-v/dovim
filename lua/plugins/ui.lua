return {
    {
        'nvim-tree/nvim-tree.lua',
        config = function () require("nvim-tree").setup() end,
        keys = {
            { "<leader><", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
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
        lazy = false,
        dependencies = 'kyazdani42/nvim-web-devicons',
        keys ={
            { "<leader>*",  "<cmd>BufferPin<cr>" },
            { "<leader>k",  "<cmd>BufferNext<cr>"},
            { "<leader>j",  "<cmd>BufferPrevious<cr>"},
            { "<leader>]",  "<cmd>BufferMoveNext<cr>" },
            { "<leader>[",  "<cmd>BufferMovePrevious<cr>" },
            { "<leader>1",  "<cmd>BufferGoto 1<cr>" },
            { "<leader>2",  "<cmd>BufferGoto 2<cr>" },
            { "<leader>3",  "<cmd>BufferGoto 3<cr>" },
            { "<leader>4",  "<cmd>BufferGoto 4<cr>" },
            { "<leader>5",  "<cmd>BufferGoto 5<cr>" },
            { "<leader>0",  "<cmd>BufferLast<cr>" },
            { "<leader>xx", "<cmd>BufferClose<cr>" },
            { "<leader>xo", "<cmd>BufferCloseAllButCurrent<cr>" },
            { "<leader>xj", "<cmd>BufferCloseBuffersLeft<cr>" },
            { "<leader>xk", "<cmd>BufferCloseBuffersRight<cr>" },
            { "<leader>x*", "<cmd>BufferCloseAllButPinned<cr>" },
        }
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
    {
        "tamton-aquib/duck.nvim",
        keys = {
            { "<leader>dh", "<cmd>lua require('duck').hatch()<cr>", desc = "Hatch Duck" },
            { "<leader>dc", "<cmd>lua require('duck').cook()<cr>", desc = "Cook Duck" },
        }
    }
}
