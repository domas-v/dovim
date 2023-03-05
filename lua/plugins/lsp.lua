return {
    {
        'github/copilot.vim', lazy = false,
        init = function ()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<S-CR>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.g.copilot_assume_mapped = true
        end
    },
    {
        "folke/neodev.nvim",
        config = function () require("neodev").setup() end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig' ,
            'williamboman/mason.nvim' ,
            'williamboman/mason-lspconfig.nvim' ,
            'jose-elias-alvarez/null-ls.nvim' ,

            -- Autocompletion
            'hrsh7th/nvim-cmp' ,
            'hrsh7th/cmp-buffer' ,
            'hrsh7th/cmp-cmdline' ,
            'hrsh7th/cmp-path' ,
            'saadparwaiz1/cmp_luasnip' ,
            'hrsh7th/cmp-nvim-lsp' ,
            'hrsh7th/cmp-nvim-lua' ,
            'rcarriga/cmp-dap',

            -- Snippets
            'L3MON4D3/LuaSnip' ,
            { 'tzachar/cmp-tabnine', build='./install.sh' },
        },
        config = function ()
            local lsp = require('lsp-zero').preset({
                name = 'minimal',
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = true,
            })

            lsp.ensure_installed({
                'pyright',
                'lua_ls',
                'jsonls',
                'bashls',
                'marksman',
            })

            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local null_ls = require('null-ls')

            --- LSP SETUP ---
            lsp.configure('pyright', {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off"
                        }
                    }
                }
            })

            lsp.setup_nvim_cmp({
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp', keyword_length = 1 },
                    { name = 'buffer', keyword_length = 1 },
                },
                mapping = lsp.defaults.cmp_mappings({
                    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                })
            })

            local navic = require('nvim-navic')

            lsp.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}
                navic.attach(client, bufnr)

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>dv", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end)

            lsp.nvim_workspace() -- Configure lua language server for neovim
            lsp.setup()

            ----- DIAGNOSTICS -----
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.flake8
                }
            })

            vim.diagnostic.config({ virtual_text = true })

            ------- COMPLETION -----
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

            require("cmp").setup({
                enabled = function()
                    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                    or require("cmp_dap").is_dap_buffer()
                end
            })

            cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
                sources = {
                    { name = "dap" },
                },
            })
        end,
    },
}
