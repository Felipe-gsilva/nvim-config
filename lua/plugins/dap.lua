-- [nfnl] Compiled from fnl/plugins/dap.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>"
end
local function _2_()
  local widgets = require("dap.ui.widgets")
  return widgets.centered_float(widgets.frames())
end
local function _3_()
  local widgets = require("dap.ui.widgets")
  return widgets.centered_float(widgets.scopes())
end
local function _4_()
  local dap = require("dap")
  local dapui = require("dapui")
  dap.adapters.gdb = {type = "executable", command = "gdb", args = {"-i", "dap"}}
  dapui.setup({layouts = {{elements = {"scopes", "breakpoints", "stacks", "watches"}, size = 40, position = "left"}, {elements = {"repl", "console"}, size = 0.25, position = "bottom"}}, floating = {max_height = 800, max_width = 600, border = "single", mappings = {close = "<ESC>"}}, windows = {indent = 2}, controls = {enabled = true}, element_mappings = {}, expand_lines = true, force_buffers = true, render = {indent = 2, max_value_lines = 100}})
  dap.listeners.after.event_initialized.dapui_config = {dapui.open()}
  dap.listeners.before.event_terminated.dapui_config = {dapui.close()}
  dap.listeners.before.event_exited.dapui_config = {dapui.close()}
  local function _5_()
    return vim.fn.input("Path to executable: ", (vim.fn.getcwd() .. "/"), "file")
  end
  local function _6_()
    return vim.fn.input("Path to executable: ", (vim.fn.getcwd() .. "/"), "file")
  end
  local function _7_()
    local name = vim.fn.input("Executable name (filter): ")
    return require("dap.utils").pick_process({filter = name})
  end
  local function _8_()
    return vim.fn.input("Path to executable: ", (vim.fn.getcwd() .. "/"), "file")
  end
  dap.configurations.c = {{name = "Launch", type = "gdb", request = "launch", program = _5_, cwd = "${workspaceFolder}", stopAtBeginningOfMainSubprogram = false}, {name = "Select and attach to process", type = "gdb", request = "attach", program = _6_, pid = _7_, cwd = "${workspaceFolder}"}, {name = "Attach to gdbserver :1234", type = "gdb", request = "attach", target = "localhost:1234", program = _8_, cwd = "${workspaceFolder}"}}
  return nil
end
return {{"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}, branch = "master", keys = {{"<F5>", "<cmd>lua require('dap').continue()<cr>", {desc = "DAP Continue"}}, {"<F1>", "<cmd>lua require('dap').step_into()<cr>", {desc = "DAP Step Into"}}, {"<F2>", "<cmd>lua require('dap').step_over()<cr>", {desc = "DAP Step Over"}}, {"<F3>", "<cmd>lua require('dap').step_out()<cr>", {desc = "DAP Step Out"}}, {"<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", {desc = "DAP Toggle Breakpoint"}}, {"<leader>B", _1_, {desc = "DAP Conditional Breakpoint"}}, {"<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", {desc = "DAP Open REPL"}}, {"<leader>dui", "<cmd>lua require('dapui').toggle()<cr>", {desc = "Toggle DAP UI"}}, {"<leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>", {desc = "DAP Hover"}}, {"<leader>dp", "<cmd>lua require('dap.ui.widgets').preview()<cr>", {desc = "DAP Preview"}}, {"<leader>df", _2_, {desc = "DAP Frames"}}, {"<leader>ds", _3_, {desc = "DAP Scopes"}}}, config = _4_}}
