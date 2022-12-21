vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --sanity
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
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
    -- use {
    --     'lukas-reineke/indent-blankline.nvim',
    --     config = function() require('indent_blankline').setup({
    --         space_char_blankline = ' ',
    --         show_current_context = true,
    --         show_current_context_start = false,
    --         filetype_exclude = { 'startup', },
    --     }) end
    -- }
    use {
        'ggandor/leap.nvim',
        config = function () require('leap').add_default_mappings() end
    }
    use {
        'ggandor/flit.nvim',
        config = function () require('flit').setup() end
    }

end)
