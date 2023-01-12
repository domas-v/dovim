return {
    {
        'jbyuki/nabla.nvim',
        ft = { 'markdown', 'md' },
        keys = {
            { '<leader>pv', ':lua require("nabla").enable_virt()<CR>', desc = "Enable Nabla" },
            { '<leader>pm', ':lua require("nabla").popup()<CR>', desc = "Nabla popup" },
        }
    },
    {
        -- BUG: 'edluffy/hologram.nvim' -- messages on different files. check this pr: https://github.com/edluffy/hologram.nvim/pull/26
        'lucasdf/hologram.nvim', branch = 'get-extmarks-error-handler',
        config = function () require('hologram').setup({auto_display = true}) end,
        ft = { 'markdown', 'md' }
    },
    -- misc
    {
        'dstein64/vim-startuptime',
        cmd = "StartupTime"
    }

}
