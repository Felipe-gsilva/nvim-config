-- [nfnl] fnl/plugins/ai.fnl
local function _1_()
  do
    local copilot = require("copilot")
    copilot.setup({panel = {enabled = true, auto_refresh = true}, suggestion = {keymap = {accept = "<M-l>", next = "<M-]>", prev = "<M-[>", dismiss = "<C-]>"}, debounce = 75, auto_trigger = false}, filetypes = {markdown = false, yaml = false}})
  end
  local function _2_()
    return vim.cmd("Copilot toggle")
  end
  return vim.keymap.set("n", "<leader>tt", _2_, {noremap = true, silent = true})
end
return {{"zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter", config = _1_}}
