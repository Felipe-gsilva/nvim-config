-- [nfnl] fnl/plugins/neotree.fnl
local function _1_()
  return vim.keymap.set("n", "<leader>ff", ":Neotree toggle<CR>", {noremap = true, silent = true})
end
return {{"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "3rd/image.nvim"}, config = _1_}}
