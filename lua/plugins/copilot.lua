-- [nfnl] fnl/plugins/copilot.fnl
local function _1_()
  local copilot = require("copilot")
  return copilot.setup({panel = {auto_refresh = true, keymap = {accept = "<CR>", refresh = "<M-r>", open = "<M-p>"}, enabled = false}, suggestion = {enabled = true, auto_trigger = true, debounce = 45, keymap = {accept = "<Right>", accept_word = "<M-f>", accept_line = "<M-l>", next = "<M-]>", prev = "<M-[>", dismiss = "<C-]>"}}, filetypes = {c = {suggestion = {enabled = false}}, cpp = {suggestion = {enabled = false}}, python = {suggestion = {enabled = false}}, yaml = {suggestion = {enabled = false}}, markdown = {suggestion = {enabled = false}}, help = {suggestion = {enabled = false}}, TelescopePrompt = {suggestion = {enabled = false}}}})
end
return {{"zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter", config = _1_, keys = {{"<leader>cc", "<cmd>Copilot<CR>", {desc = "Copilot: Toggle"}}, {"fleader>cp", "<cmd>Copilot panel<CR>", {desc = "Copilot: Open Panel"}}}}}
