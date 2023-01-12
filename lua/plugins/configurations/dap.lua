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

