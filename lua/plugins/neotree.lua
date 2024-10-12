-- [nfnl] Compiled from fnl/plugins/neotree.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local function _2_()
    return vim.cmd("Neotree")
  end
  return vim.keymap.set("n", "<leader>f", ":Neotree toggle<CR>", {noremap = true, silent = true})(vim.api.nvim_create_autocmd("VimEnter", {callback = _2_}), require("neo-tree")(__fnl_global___2esetup, {filesystem = {depth = 1, filtered_items = {hide_dotfiles = true, hide_gitignored = true, hide_by_name = {"node_modules", ".git"}, visible = false}}}))
end
return {{"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "3rd/image.nvim"}, config = _1_}}
