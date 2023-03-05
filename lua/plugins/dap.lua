return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'mfussenegger/nvim-dap-python',
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function ()
            local dap = require('dap')
            local dapui = require("dapui")

            --- dapui
            dapui.setup()
            require("nvim-dap-virtual-text").setup({
                virt_text_win_col = 30
            })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            --- python
            require('dap-python').setup("python")
            require("dap-python").test_runner = "pytest"
            require('dap.ext.vscode').load_launchjs()


            --- 
            local sign = vim.fn.sign_define
            sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
            sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
            sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

        end,
        keys = {
            { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle DAP UI" },
            { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", desc = "Toggle DAP Repl" },
            { "<leader>dt", "<cmd>DapVirtualTextToggle<cr>", desc = "Toggle DAP Virtual text" },
            { "<leader>de", "<cmd>lua require('dapui').eval()<cr>", desc = "DAP Eval" },
            { "<leader>df", "<cmd>lua require('dapui').float_element()<cr>", desc = "Toggle DAP Float element" },
            { "<leader>dR", "<cmd>DapVirtualTextForceRefresh<cr>", desc = "DAP Refresh virtual text" },
            { '<leader>dm', "<cmd>lua require('dap-python').test_method()<cr>", desc = "Test python method" },

            { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start DAP" },
            { "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Stop DAP" },
            { "<leader>dd", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Breakpoint" },
            { "<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step over" },
            { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step into" },
            { "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step out" },

            { "<F5>",  "<cmd>lua require'dap'.continue()<cr>", desc = "Start DAP" },
            { "<F6>",  "<cmd>lua require'dap'.terminate()<cr>", desc = "Stop DAP" },
            { "<F9>",  "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Breakpoint" },
            { "<F10>", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step over" },
            { "<F11>", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step into" },
            { "<F12>", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step out" },

        }
    }
}
