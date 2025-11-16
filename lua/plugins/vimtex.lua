-- [nfnl] fnl/plugins/vimtex.fnl
local function _1_()
  vim.g.vimtex_view_method = "zathura"
  vim.g.vimtex_view_forward_search_on_start = false
  vim.g.vimtex_compiler_latexmk = {aux_dir = "build", out_dir = "build", program = "xelatex"}
  return nil
end
return {{"lervag/vimtex", tag = "v2.15", init = _1_, lazy = false}}
