return {
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
        'rcarriga/cmp-dap' ,

        -- Snippets
        'L3MON4D3/LuaSnip' ,
        'rafamadriz/friendly-snippets' ,
        { 'tzachar/cmp-tabnine', build='./install.sh' },
    },
    config = function ()
        local lsp = require("lsp-zero")
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local null_ls = require('null-ls')

        --- LSP SETUP ---
        lsp.preset("recommended")
        lsp.ensure_installed({
            "sumneko_lua",
            "pyright",
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
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>dv", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end)

        lsp.setup()

        ----- DIAGNOSTICS -----
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.flake8,
                -- TODO: mypy
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
}
