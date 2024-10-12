-- [nfnl] Compiled from fnl/plugins/noice.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local noice = require("noice")
  return noice.setup({views = {cmdline_popup = {positon = {row = "50%", col = "50%"}}}, messages = {enabled = true, view = "notify", ["view-error"] = "notify", ["view-warn"] = "notify"}})
end
return {{"folke/noice.nvim", dependencies = {"MunifTanjim/nui.nvim"}, config = _1_}}
