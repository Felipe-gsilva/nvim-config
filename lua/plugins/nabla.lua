-- [nfnl] fnl/plugins/nabla.fnl
local function _1_()
  return require("nabla").popup()
end
local function _2_()
  return require("nabla").toggle_virt({autowrap = true})
end
return {{"jbyuki/nabla.nvim", ft = {"markdown", "tex"}, keys = {{"<leader>p", _1_, desc = "Nabla LaTeX Popup"}, {"<leader>P", _2_, desc = "Nabla Toggle Virtual Text"}}}}
