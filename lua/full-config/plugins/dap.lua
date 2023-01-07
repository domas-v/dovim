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

vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dt", "<cmd>DapVirtualTextToggle<cr>")
vim.keymap.set("n", "<leader>de", "<cmd>lua require('dapui').eval()<cr>")
vim.keymap.set("n", "<leader>df", "<cmd>lua require('dapui').float_element()<cr>")
vim.keymap.set("n", "<leader>dR", "<cmd>DapVirtualTextForceRefresh<cr>")
vim.keymap.set("n", '<leader>dm', '<cmd>lua require("dap-python").test_method()<cr>')
vim.keymap.set("n", "<F5>", '<cmd>lua require"dap".continue()<cr>')
vim.keymap.set("n", "<F6>", '<cmd>lua require"dap".terminate()<cr>')
vim.keymap.set("n", "<F8>", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>')
vim.keymap.set("n", "<F9>", '<cmd>lua require"dap".toggle_breakpoint()<cr>')
vim.keymap.set("n", "<F10>", '<cmd>lua require"dap".step_over()<cr>')
vim.keymap.set("n", "<F11>", '<cmd>lua require"dap".step_into()<cr>')
vim.keymap.set("n", "<F12>", '<cmd>lua require"dap".step_out()<cr>')
