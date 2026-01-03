-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "c", "clojure", "commonlisp", "dockerfile", "fennel", "html", "java", "javascript", "json", "lua", "markdown", "python", "yaml"}})
end
return {{"nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate", config = _1_}}
