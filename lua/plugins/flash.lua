-- [nfnl] fnl/plugins/flash.fnl
local function _1_()
  return require("flash").jump()
end
local function _2_()
  return require("flash").treesitter()
end
local function _3_()
  return require("flash").remote()
end
local function _4_()
  return require("flash").treesitter_search()
end
return {{"folke/flash.nvim", event = "VeryLazy", opts = {}, keys = {{"s", _1_, mode = {"n", "x", "o"}, desc = "Flash"}, {"S", _2_, mode = {"n", "x", "o"}, desc = "Flash Treesitter"}, {"r", _3_, mode = "o", desc = "Remote Flash"}, {"R", _4_, mode = {"o", "x"}, desc = "Treesitter Search"}}}}
