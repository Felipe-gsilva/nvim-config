-- [nfnl] Compiled from fnl/plugins/undotree.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.keymap.set("n", "<leader>u", ":Undotree toggle<CR>", {noremap = true, silent = true})
end
return {{"mbbill/undotree", config = _1_}}
