-- [nfnl] fnl/plugins/persistence.fnl
local function _1_()
  return require("persistence").load()
end
local function _2_()
  return require("persistence").load({last = true})
end
local function _3_()
  return require("persistence").stop()
end
return {{"folke/persistence.nvim", event = "BufReadPre", opts = {}, keys = {{"<leader>qs", _1_, desc = "Restore Session"}, {"<leader>ql", _2_, desc = "Restore Last Session"}, {"<leader>qd", _3_, desc = "Don't Save Current Session"}}}}
