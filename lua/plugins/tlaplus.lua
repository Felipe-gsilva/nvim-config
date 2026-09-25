-- [nfnl] fnl/plugins/tlaplus.fnl
local function _1_()
  vim.g.tlaplus_mappings_enable = true
  local tla = require("tla")
  return tla.setup({java_executable = "/usr/bin/java"})
end
return {{"tlaplus-community/tlaplus-nvim-plugin", dependencies = {"susliko/tla.nvim"}, config = _1_}}
