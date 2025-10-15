-- [nfnl] fnl/plugins/spectre.fnl
local function _1_()
  local spectre = require("spectre")
  return spectre.setup({})
end
local function _2_()
  local spectre = require("spectre")
  vim.keymap.set("n", "leader>S", spectre.open, {})
  vim.keymap.set("n", "leader>sw", ":lua spectre.open_visual({select_word=true})<CR>", {noremap = true, silent = true})
  vim.keymap.set("v", "leader>sw", ":lua spectre.open_visual()<CR>", {noremap = true, silent = true})
  return vim.keymap.set("n", "leader>sp", ":lua spectre.open_file_search()<CR>", {noremap = true, silent = true})
end
return {{"nvim-pack/nvim-spectre", config = _1_, init = _2_}}
