return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'mfussenegger/nvim-dap-python',
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function () require("plugins.configurations.dap") end,
        keys = {
            { "<leader>du",  "<cmd>lua require('dapui').toggle()<cr>" },
            { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>" },
            { "<leader>dt", "<cmd>DapVirtualTextToggle<cr>" },
            { "<leader>de", "<cmd>lua require('dapui').eval()<cr>" },
            { "<leader>df", "<cmd>lua require('dapui').float_element()<cr>" },
            { "<leader>dR", "<cmd>DapVirtualTextForceRefresh<cr>" },
            { '<leader>dm', '<cmd>lua require("dap-python").test_method()<cr>' },
            { "<F5>", '<cmd>lua require"dap".continue()<cr>' },
            { "<F6>", '<cmd>lua require"dap".terminate()<cr>' },
            -- { "<F8>", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>' },
            { "<F9>", '<cmd>lua require"dap".toggle_breakpoint()<cr>' },
            { "<F10>", '<cmd>lua require"dap".step_over()<cr>' },
            { "<F11>", '<cmd>lua require"dap".step_into()<cr>' },
            { "<F12>", '<cmd>lua require"dap".step_out()<cr>' },
        }
    }
}
