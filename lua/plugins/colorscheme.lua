-- [nfnl] fnl/plugins/colorscheme.fnl
local function _1_()
  return vim.cmd.colorscheme("nightfox")
end
return {{"aliqyan-21/darkvoid.nvim", dependencies = {"norcalli/nvim-colorizer.lua", "EdenEast/nightfox.nvim"}, config = _1_}}
