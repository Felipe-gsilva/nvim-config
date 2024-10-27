-- [nfnl] Compiled from fnl/plugins/dap.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local dap = require("dap")
  local dapui = require("dapui")
  dap.adapters.gdb = {type = "executable", command = "gdb", args = {"-i", "dap"}}
  dapui.setup({layouts = {{elements = {"scopes", "breakpoints", "stacks", "watches"}, size = 40, position = "left"}, {elements = {"repl", "console"}, size = 0.25, position = "bottom"}}, floating = {max_height = 800, max_width = 600, border = "single", mappings = {close = "<ESC>"}}, windows = {indent = 2}, controls = {enabled = true}, element_mappings = {}, expand_lines = true, force_buffers = true, render = {indent = 2, max_value_lines = 100}})
  dap.listeners.after.event_initialized.dapui_config = {dapui.open()}
  dap.listeners.before.event_terminated.dapui_config = {dapui.close()}
  dap.listeners.before.event_exited.dapui_config = {dapui.close()}
  vim.keymap.set("n", "<leader>dui", ":lua require'dapui'.toggle()<CR>", {silent = true, noremap = true, desc = "Toggle DAP UI"})
  vim.keymap.set("n", "<leader>dh", ":lua require'dap.ui.widgets'.hover()<CR>", {silent = true, noremap = true, desc = "DAP Hover"})
  vim.keymap.set("n", "<leader>dp", ":lua require'dap.ui.widgets'.preview()<CR>", {silent = true, noremap = true, desc = "DAP Preview"})
  local function _2_()
    local widgets = require("dap.ui.widgets")
    return widgets.centered_float(widgets.frames())
  end
  vim.keymap.set("n", "<leader>df", _2_, {silent = true, noremap = true, desc = "DAP Frames"})
  local function _3_()
    local widgets = require("dap.ui.widgets")
    return widgets.centered_float(widgets.scopes())
  end
  vim.keymap.set("n", "<leader>ds", _3_, {silent = true, noremap = true, desc = "DAP Scopes"})
  local function _4_()
    return vim.fn.input("Path to executable: ", (vim.fn.getcwd() .. "/"), "file")
  end
  local function _5_()
    return vim.fn.input("Path to executable: ", (vim.fn.getcwd() .. "/"), "file")
  end
  local function _6_()
    local name = vim.fn.input("Executable name (filter): ")
    return require("dap.utils").pick_process({filter = name})
  end
  local function _7_()
    return vim.fn.input("Path to executable: ", (vim.fn.getcwd() .. "/"), "file")
  end
  dap.configurations.c = {{name = "Launch", type = "gdb", request = "launch", program = _4_, cwd = "${workspaceFolder}", stopAtBeginningOfMainSubprogram = false}, {name = "Select and attach to process", type = "gdb", request = "attach", program = _5_, pid = _6_, cwd = "${workspaceFolder}"}, {name = "Attach to gdbserver :1234", type = "gdb", request = "attach", target = "localhost:1234", program = _7_, cwd = "${workspaceFolder}"}}
  vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", {silent = true, noremap = true})
  vim.keymap.set("n", "<F1>", ":lua require'dap'.step_into()<CR>", {silent = true, noremap = true})
  vim.keymap.set("n", "<F2>", ":lua require'dap'.step_over()<CR>", {silent = true, noremap = true})
  vim.keymap.set("n", "<F3>", ":lua require'dap'.step_out()<CR>", {silent = true, noremap = true})
  vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true})
  vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {silent = true, noremap = true})
  return vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", {silent = true, noremap = true})
end
return {{"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}, branch = "master", config = _1_}}
