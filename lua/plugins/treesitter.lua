-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  local treesitter = require("nvim-treesitter.config")
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "c_sharp", "clojure", "commonlisp", "rust", "zig", "cpp", "python", "c", "dockerfile", "fennel", "gdscript", "html", "java", "javascript", "json", "lua", "markdown", "rust", "yaml"}})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}
