-- [nfnl] fnl/plugins/paredit.fnl
local function _1_()
  local autopairs = require("nvim-autopairs")
  return autopairs.setup({map_cr = true, check_ts = true, enable_check_bracket_line = false})
end
return {{"julienvincent/nvim-paredit", ft = {"clojure", "fennel"}, opts = {}}, {"julienvincent/nvim-paredit-fennel", ft = {"fennel"}, dependencies = {"julienvincent/nvim-paredit"}}, {"windwp/nvim-autopairs", event = "InsertEnter", config = _1_}}
