-- [nfnl] Compiled from fnl/plugins/harpoon.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local harpoon = require("harpoon")
  return harpoon.setup({})
end
local function _2_()
  local harpoon = require("harpoon")
  local list = harpoon:list()
  local function _3_()
    return list:add()
  end
  vim.keymap.set("n", "<leader>a", _3_)
  local function _4_()
    return harpoon.ui:toggle_quick_menu(list)
  end
  vim.keymap.set("n", "<C-q>", _4_)
  local function _5_()
    return list:select(1)
  end
  vim.keymap.set("n", "<C-w>", _5_)
  local function _6_()
    return list:select(2)
  end
  vim.keymap.set("n", "<C-e>", _6_)
  local function _7_()
    return list:select(3)
  end
  vim.keymap.set("n", "<C-r>", _7_)
  local function _8_()
    return list:select(4)
  end
  vim.keymap.set("n", "<C-t>", _8_)
  local function _9_()
    return list:prev()
  end
  vim.keymap.set("n", "<C-S-P>", _9_)
  local function _10_()
    return list:next()
  end
  return vim.keymap.set("n", "<C-S-N>", _10_)
end
return {{"ThePrimeagen/harpoon", branch = "harpoon2", dependencies = {"nvim-lua/plenary.nvim"}, config = _1_, init = _2_}}
