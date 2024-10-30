-- [nfnl] Compiled from fnl/plugins/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local now = vim.loop.new_date()
  local hour = __fnl_global___2egetHours(now)
  if (hour < 12) then
    return vim.cmd("colorscheme dawnfox")
  else
    return vim.cmd("colorscheme nightfox")
  end
end
return {{"EdenEast/nightfox.nvim", dependencies = {"norcalli/nvim-colorizer.lua"}, config = _1_}}
