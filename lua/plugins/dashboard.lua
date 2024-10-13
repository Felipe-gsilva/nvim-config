-- [nfnl] Compiled from fnl/plugins/dashboard.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local dash = require("dashboard")
  return dash.setup({})
end
return {{"nvimdev/dashboard-nvim", event = "VimEnter", config = _1_, dependencies = {"nvim-tree/nvim-web-devicons"}}}
