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
            require('dap-python').test_runner = 'pytest'
            table.insert(require('dap').configurations.python, {
                type = 'python',
                request = 'launch',
                name = 'tms',
                program = '../venv/bin/chalice',
                args =  { "local", "--no-autoreload" },
                cwd = "/Users/domev/Work/tenspeed-lambda/tms"
            })

            --- 
            local sign = vim.fn.sign_define
            sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
            sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
            sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

        end,
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

            { "<leader>ds", '<cmd>lua require"dap".continue()<cr>' },
            { "<leader>dx", '<cmd>lua require"dap".terminate()<cr>' },
            { "<leader>dc", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>' },
            { "<leader>dd", '<cmd>lua require"dap".toggle_breakpoint()<cr>' },
            { "<leader>dn", '<cmd>lua require"dap".step_over()<cr>' },
            { "<leader>di", '<cmd>lua require"dap".step_into()<cr>' },
            { "<leader>do", '<cmd>lua require"dap".step_out()<cr>' },
        }
    }
}
