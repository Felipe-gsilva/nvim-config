-- [nfnl] fnl/plugins/notify.fnl
local function _1_()
  local notify = require("notify")
  vim.notify = notify
  return notify.setup({timeout = 2000, render = "minimal"})
end
return {{"rcarriga/nvim-notify", event = "VeryLazy", config = _1_}}
