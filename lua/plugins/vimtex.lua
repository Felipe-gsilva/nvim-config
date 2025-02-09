-- [nfnl] Compiled from fnl/plugins/vimtex.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g.vimtex_view_method = "zathura"
  vim.g.vimtex_view_forward_search_on_start = false
  vim.g.vimtex_compiler_latexmk = {aux_dir = "/home/Felipe-gsilva/dev/personal/notes", out_dir = "/home/Felipe-gsilva/dev/personal/notes"}
  return nil
end
return {{"lervag/vimtex", tag = "v2.15", init = _1_, lazy = false}}
