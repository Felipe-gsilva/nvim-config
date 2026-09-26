-- [nfnl] fnl/plugins/undotree.fnl
local function _1_()
  return vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", {noremap = true, silent = true})
end
return {{"mbbill/undotree", config = _1_}}
