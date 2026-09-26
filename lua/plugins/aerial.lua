-- [nfnl] fnl/plugins/aerial.fnl
local function _1_(bufnr)
  vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {buffer = bufnr})
  return vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {buffer = bufnr})
end
return {{"stevearc/aerial.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, opts = {on_attach = _1_}, keys = {{"<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial Outline"}}}}
