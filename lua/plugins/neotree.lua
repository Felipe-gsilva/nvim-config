-- [nfnl] Compiled from fnl/plugins/neotree.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.keymap.set("n", "<leader>ff", ":Neotree toggle<CR>", {noremap = true, silent = true})
  local function _2_()
    local bufname = vim.fn.expand("%")
    if ((bufname == "") or vim.fn.isdirectory(bufname)) then
      return vim.cmd("Neotree")
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("VimEnter", {callback = _2_})
end
return {{"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "3rd/image.nvim"}, config = _1_}}
