return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig' ,
        'williamboman/mason.nvim' ,
        'williamboman/mason-lspconfig.nvim' ,
        'jose-elias-alvarez/null-ls.nvim' ,

        -- Autocompletion
        'hrsh7th/nvim-cmp' ,
        'hrsh7th/cmp-buffer' ,
        'hrsh7th/cmp-cmdline' ,
        'hrsh7th/cmp-path' ,
        'saadparwaiz1/cmp_luasnip' ,
        'hrsh7th/cmp-nvim-lsp' ,
        'hrsh7th/cmp-nvim-lua' ,
        'rcarriga/cmp-dap' ,

        -- Snippets
        'L3MON4D3/LuaSnip' ,
        'rafamadriz/friendly-snippets' ,
        { 'tzachar/cmp-tabnine', build='./install.sh' },
    },
    config = function ()
        require("plugins.configurations.lsp")
    end
}