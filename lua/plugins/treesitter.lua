return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'p00f/nvim-ts-rainbow',
        'nvim-treesitter/playground',
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    config = function ()
        require("plugins.configurations.treesitter")
    end
}
