require("zen-mode").setup {
    window = {
        backdrop = 0.80, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 100,
        height = 0.9,
        options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
        },
    },
    plugins = {
        kitty = {
            enabled = true,
            font = "+3"
        },
        gitsigns = {
            enabled = true
        }
    }
}

vim.keymap.set("n", "<leader><leader>z", "<cmd>ZenMode<cr>")
