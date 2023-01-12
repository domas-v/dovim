return {
    {
        'windwp/nvim-autopairs',
        config = function () require('nvim-autopairs').setup() end,
    },
    {
        'kylechui/nvim-surround',
        config = function () require('nvim-surround').setup({ move_cursor = false }) end
    },
    {
        'numToStr/Comment.nvim',
        config = function () require('Comment').setup() end
    },
    {
        'ggandor/leap.nvim',
        config = function () require('leap').add_default_mappings() end
    },
    {
        'ggandor/flit.nvim',
        config = function () require('flit').setup() end
    },
    {
        'Pocco81/auto-save.nvim',
        config = function() require('auto-save').setup({ execution_message = { message = "" } }) end,
    },
    'RRethy/vim-illuminate',
    'mg979/vim-visual-multi',
}
