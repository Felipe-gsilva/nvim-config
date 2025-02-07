-- [nfnl] Compiled from fnl/plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local notify = require("notify")
  return notify.setup({timeout = 2000, render = "minimal", fps = 60, animate = false})
end
return {{"rcarriga/nvim-notify", config = _1_}}
