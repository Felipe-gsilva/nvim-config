-- [nfnl] fnl/plugins/neotest.fnl
local function _1_()
  local neotest = require("neotest")
  local jest = require("neotest-jest")
  return neotest.setup({adapters = {jest({})}})
end
local function _2_()
  return require("neotest").run.run()
end
local function _3_()
  return require("neotest").run.run(vim.fn.expand("%"))
end
local function _4_()
  return require("neotest").run.run(vim.fn.getcwd())
end
local function _5_()
  return require("neotest").summary.toggle()
end
local function _6_()
  return require("neotest").output.open({enter = true, auto_close = true})
end
local function _7_()
  return require("neotest").run.stop()
end
return {{"nvim-neotest/neotest", dependencies = {"nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim", "nvim-treesitter/nvim-treesitter", "nvim-neotest/neotest-jest"}, config = _1_, keys = {{"<leader>tr", _2_, desc = "Run Nearest Test"}, {"<leader>tf", _3_, desc = "Run File Tests"}, {"<leader>ts", _4_, desc = "Run Test Suite"}, {"<leader>to", _5_, desc = "Toggle Test Summary"}, {"<leader>tp", _6_, desc = "Show Test Output"}, {"<leader>tS", _7_, desc = "Stop Test"}}}}
