return {
    {
        'catppuccin/nvim',
        config = function ()
            require("plugins.configurations.catppuccin")
            vim.cmd.colorscheme("catppuccin")
            vim.cmd [[highlight LeapBackdrop guifg=#777777]]
        end

    }
}
