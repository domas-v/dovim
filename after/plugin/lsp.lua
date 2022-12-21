local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
    "sumneko_lua",
    "pyright"
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

lsp.setup_nvim_cmp({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer', keyword_length = 1 },
        { name = 'tabnine' },
    },
    mapping = lsp.defaults.cmp_mappings({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })
})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)
    vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>dv", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>dl", "<cmd>TroubleToggle<cr>", opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

----- DIAGNOSTICS -----
local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.flake8,
        -- TODO: mypy
        -- diagnostics.mypy.with({
        --     extra_args = {"--ignore-missing-imports", "--exclude=setup.py", "--exclude='test_'"
        --     }
        -- }),
    },
})

vim.diagnostic.config({
    virtual_text = true,
})

------- CMP -----
cmp.setup.cmdline({ '/', '?' }, {
    mapping = {
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = {
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
