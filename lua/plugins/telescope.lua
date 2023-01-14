return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
            'kyazdani42/nvim-web-devicons',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
            { "AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end, },
        },
        config = function ()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--trim',
                    },
                    mappings = {
                        i = {
                            ["<c-j>"] = actions.move_selection_next,
                            ["<c-k>"] = actions.move_selection_previous,
                            ["<c-d>"] = actions.delete_buffer,
                            ["<c-l>"] = actions.preview_scrolling_down,
                            ["<c-h>"] = actions.preview_scrolling_up,
                        },
                        n = {
                            ["<j>"] = actions.move_selection_next,
                            ["<k>"] = actions.move_selection_previous,
                            ["<c-d>"] = actions.delete_buffer,
                            ["<c-l>"] = actions.preview_scrolling_down,
                            ["<c-h>"] = actions.preview_scrolling_up,
                        }
                    },
                    layout_strategy = "flex",
                    layout_config = {
                        flex = {
                            flip_columns = 200,
                        },
                        horizontal = {
                            height = 0.8,
                            width = 0.8,
                            preview_width = 0.65,
                        },
                        vertical = {
                            height = 0.8,
                            width = 0.6,
                            preview_height = 0.4,
                            preview_cutoff = 34 -- cutoff if not full mac screen
                        }
                    },
                    sort_lastused = true,
                    sorting_strategy = "ascending",
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                }
            })

            require('telescope').load_extension('fzf')
            require('telescope').load_extension('neoclip')
        end,
        keys = {
            { '<leader>ff', "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { '<leader>fg', "<cmd>Telescope git_files<cr>", desc = "Git files" },
            { '<leader>fo', "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
            { '<leader>fh', "<cmd>Telescope help_tags<cr>", desc = "Help" },
            { '<leader>fk', "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
            { '<leader>fc', "<cmd>Telescope commands<cr>", desc = "Commands" },

            { '<leader>ft', "<cmd>TodoTelescope<cr>", desc = "Todo" },
            { '<leader>fd', "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
            { "<leader>fl", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP symbols" },
            { "<leader>fL", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "LSP workspace symbols" },
            { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "LSP references" },

            { '<leader>fy', "<cmd>Telescope neoclip<cr>", desc = "Clipboard" },
            { '<leader>fj', "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
            { '<leader><',  "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { '<leader>s',  "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer" },
            { '<leader>S',  "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        }
    },
}


