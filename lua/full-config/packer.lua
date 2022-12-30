vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function () require('full-config.plugins.treesitter') end
    }
    -- TODO: treesitter textobjects
    use {
        'p00f/nvim-ts-rainbow',
        'nvim-treesitter/playground'
    }

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        use { 'tzachar/cmp-tabnine', run='./install.sh' },
        config = function () require('full-config.plugins.lsp') end
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function () require('full-config.plugins.telescope') end
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- colors
    use {
        'folke/tokyonight.nvim',
        config = function () require('full-config.plugins.colors') end
    }

   -- ui -- noice
   -- Packer
   use {
       "folke/noice.nvim",
       requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
       config = function () require("full-config.plugins.noice") end
   }

    -- sanity
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }
    use {
        'RRethy/vim-illuminate',
    }
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use {
        'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup({
            move_cursor = false
        }) end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent_blankline').setup({
            space_char_blankline = ' ',
            show_current_context = true,
            show_current_context_start = false,
            filetype_exclude = { 'startup', },
        }) end
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function () require('full-config.plugins.lualine') end
    }

    -- tabs/buffers/windows
    use {
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'sindrets/winshift.nvim',
        config = function() require('winshift').setup() end
    }
    use { 'simeji/winresizer' }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        config = function () require('gitsigns').setup() end,
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'TimUntersberger/neogit',
        cmd = 'Neogit',
        config = function () require('neogit').setup({integrations = {diffview = true}}) end,
        requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' }
    }
    use {
        'f-person/git-blame.nvim',
        config = function () vim.g['gitblame_enabled'] = 0 end
    }

    -- autosave
    use {
        'Pocco81/auto-save.nvim',
        config = function() require('auto-save').setup({ execution_message = { message = "" } }) end, }

    -- movement
    use {
        'ggandor/leap.nvim',
        config = function () require('leap').add_default_mappings() end
    }
    use {
        'ggandor/flit.nvim',
        config = function () require('flit').setup() end
    }

    -- terminal
    use {
        'akinsho/toggleterm.nvim',
        config = function () require('full-config.plugins.toggleterm') end
    }
    use {
        'hkupty/iron.nvim',
        config = function () require('full-config.plugins.iron') end
    }

    -- debug
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'mfussenegger/nvim-dap-python',
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'rcarriga/cmp-dap',
        },
        config = function () require('full-config.plugins.dap') end
    }

    -- diagnostics
    use { "jose-elias-alvarez/null-ls.nvim" }
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('trouble').setup() end
    }
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('todo-comments').setup() end
    }

    -- quickfix
    use {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        requires = {
            'junegunn/fzf',
            run = function()
                vim.fn['fzf#install']()
            end

        }
    }

    -- misc
    use { "dstein64/vim-startuptime" }

    -- TODO: execute python https://github.com/smzm/hydrovim
    -- TODO: undotree
    -- TODO: multi-cursor
end)
