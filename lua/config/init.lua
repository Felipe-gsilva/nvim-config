-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
vim.keymap.set("n", "<space>", "<nop>", {noremap = true})
local clipboard = {name = "wl-clipboard", copy = {["+"] = "wl-copy --type text/plain"}, paste = {["+"] = "wl-paste --no-newline"}, cache_enabled = true}
core.assoc(vim.g, "clipboard", clipboard)
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", relativenumber = true, ruler = true, signcolumn = "number"}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
return {}
