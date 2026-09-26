-- [nfnl] fnl/plugins/colorizer.fnl
local function _1_()
  local color = require("colorizer")
  return color.setup({})
end
return {{"norcalli/nvim-colorizer.lua", dependencies = {}, config = _1_}}
