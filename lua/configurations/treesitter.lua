require("nvim-treesitter.configs").setup {
    ensure_installed = { "help", "python", "lua", "vim" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            scope_incremental = '<TAB>',
            node_decremental = '<S-Tab>',
        },
    },
    indent = {
        enable = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true
    },
}
