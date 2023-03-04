return {
    {
        'catppuccin/nvim',
        config = function ()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            term_colors = true,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = { "italic" },
                keywords = { "bold" },
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                barbar = true,
                leap = true,
                mason = true,
                ts_rainbow = false,
                lsp_trouble = true,
                neogit = true,
                markdown = true,
                symbols_outline = true,
                dap = {
                    enabled = true,
                    enable_ui = true,
                },
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true,
                }
            },

})
            vim.cmd.colorscheme("catppuccin")
            vim.cmd [[highlight LeapBackdrop guifg=#777777]]
        end

    }
}


