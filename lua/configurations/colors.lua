-- require("tokyonight").setup({
-- 	-- transparent = true,
--     style = "night",
-- 	styles = {
-- 	comments = "italic",
-- 		keywords = "italic",
-- 		functions = "bold",
-- 		variables = "NONE",
-- 		-- sidebars = "transparent", -- style for sidebars, see below
-- 		-- floats = "transparent", -- style for floating windows
-- 	},
-- })

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
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
        notify = true,
        barbar = true,
        leap = true,
        mason = true,
        ts_rainbow = true,
        lsp_trouble = true,
        neogit = true,
        markdown = true,
        dap = {
            enabled = true,
            enable_ui = true, -- enable nvim-dap-ui
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        }
    },
})

vim.cmd.colorscheme("catppuccin")
