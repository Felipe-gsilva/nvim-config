-- [nfnl] fnl/plugins/spectre.fnl
local function _1_()
  local spectre = require("spectre")
  return spectre.setup({})
end
local function _2_()
end
return {{"nvim-pack/nvim-spectre", config = _1_, init = _2_}}
