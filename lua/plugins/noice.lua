-- [nfnl] Compiled from fnl/plugins/noice.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local noice = require("noice")
  return noice.setup({views = {cmdline_popup = {position = {row = "45%", col = "50%"}, size = {width = 60, height = "auto"}}, popupmenu = {relative = "editor", size = {width = 60, height = 10}, position = {row = "60%", col = "50%"}, border = {style = "rounded"}, ["win-options"] = {Normal = "Normal", FloatBorder = "DiagnosticInfo"}}, messages = {enabled = true, view = "notify", ["view-error"] = "notify", ["view-warn"] = "notify"}}})
end
return {{"folke/noice.nvim", dependencies = {"MunifTanjim/nui.nvim"}, config = _1_}}
