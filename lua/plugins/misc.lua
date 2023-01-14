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
    -- {
    --     'arakkkkk/kanban.nvim'
    -- }

}
