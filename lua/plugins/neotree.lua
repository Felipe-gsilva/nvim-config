-- [nfnl] Compiled from fnl/plugins/neotree.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.keymap.set("n", "<leader>f", ":Neotree toggle<CR>", {noremap = true, silent = true})
  local function _2_()
    return vim.cmd("Neotree")
  end
  return vim.api.nvim_create_autocmd("VimEnter", {callback = _2_})
end
return {{"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "3rd/image.nvim"}, config = _1_}}
