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
  vim.keymap.set("n", "<C-e>", _4_)
  local function _5_()
    return list:select(1)
  end
  vim.keymap.set("n", "<C-1>", _5_)
  local function _6_()
    return list:select(2)
  end
  vim.keymap.set("n", "<C-2>", _6_)
  local function _7_()
    return list:select(3)
  end
  vim.keymap.set("n", "<C-3>", _7_)
  local function _8_()
    return list:select(4)
  end
  vim.keymap.set("n", "<C-4>", _8_)
  local function _9_()
    return list:select(5)
  end
  vim.keymap.set("n", "<C-5>", _9_)
  local function _10_()
    return list:select(6)
  end
  vim.keymap.set("n", "<C-6>", _10_)
  local function _11_()
    return list:select(7)
  end
  vim.keymap.set("n", "<C-7>", _11_)
  local function _12_()
    return list:select(8)
  end
  vim.keymap.set("n", "<C-8>", _12_)
  local function _13_()
    return list:select(9)
  end
  vim.keymap.set("n", "<C-9>", _13_)
  local function _14_()
    return list:prev()
  end
  vim.keymap.set("n", "<C-S-P>", _14_)
  local function _15_()
    return list:next()
  end
  return vim.keymap.set("n", "<C-S-N>", _15_)
end
return {{"ThePrimeagen/harpoon", branch = "harpoon2", dependencies = {"nvim-lua/plenary.nvim"}, config = _1_, init = _2_}}
