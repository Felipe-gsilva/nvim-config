-- [nfnl] fnl/plugins/dashboard.fnl
local function _1_()
  do
    local dash = require("dashboard")
    dash.setup({})
  end
  local function _2_()
    if ((0 == vim.fn.argc()) and ("" == vim.fn.bufname("%"))) then
      return vim.cmd("Dashboard")
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("VimEnter", {pattern = "*", callback = _2_})
end
return {{"nvimdev/dashboard-nvim", event = "VimEnter", config = _1_, dependencies = {"nvim-tree/nvim-web-devicons"}}}
