return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
            'kyazdani42/nvim-web-devicons',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
        },
        config = function () require('plugins.configurations.telescope') end,
        keys = {
            { '<leader>ff', "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { '<leader>fg', "<cmd>Telescope git_files<cr>", desc = "Git files" },
            { '<leader>fo', "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
            { '<leader>ft', "<cmd>TodoTelescope<cr>", desc = "Todo" },
            { '<leader>fh', "<cmd>Telescope help_tags<cr>", desc = "Help" },
            { '<leader>fk', "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
            { '<leader>fc', "<cmd>Telescope commands<cr>", desc = "Commands" },
            { '<leader>fd', "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
            { '<leader>fr', "<cmd>Telescope registers<cr>", desc = "Registers" },
            { '<leader>fj', "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
            { '<leader><',  "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { '<leader>s',  "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer" },
            { '<leader>S',  "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        }
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function ()
            require("nvim-tree").setup()
        end,
        keys = {
            { "<leader><TAB>", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
        },
    },
    {
        'folke/noice.nvim',
        config = function () require('plugins.configurations.noice') end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function () require('plugins.configurations.lualine') end
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
    {
        'folke/zen-mode.nvim',
        config = function()
            require("plugins.configurations.zenmode")
        end,
        keys = {
            { "<leader><leader>z", "<cmd>ZenMode<cr>" }
        }
    },
}
