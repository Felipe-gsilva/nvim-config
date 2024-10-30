-- [nfnl] Compiled from fnl/plugins/vimtex.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g.vimtex_view_method = "okular"
  return nil
end
return {{"lervag/vimtex", tag = "v2.15", init = _1_, lazy = false}}
