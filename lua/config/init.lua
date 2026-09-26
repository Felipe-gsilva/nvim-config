-- [nfnl] fnl/config/init.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local core = autoload("nfnl.core")
vim.keymap.set("n", "<space>", "<nop>", {noremap = true})
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", ruler = true, number = true, relativenumber = true, termguicolors = true, conceallevel = 2}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
do
  local yank_group = vim.api.nvim_create_augroup("highlight_yank", {clear = true})
  local function _2_()
    return vim.highlight.on_yank({higroup = "IncSearch", timeout = 150})
  end
  vim.api.nvim_create_autocmd("TextYankPost", {group = yank_group, pattern = "*", callback = _2_})
end
return {}
