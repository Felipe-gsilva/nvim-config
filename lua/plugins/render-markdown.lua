-- [nfnl] Compiled from fnl/plugins/render-markdown.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local md = require("render-markdown")
  return md.setup({file_types = {"markdown"}, latex = {enabled = true, top_pad = 1, bottom_pad = 0, highlight = "RenderMarkdownMath", converter = "latex2text", render_modes = false}})
end
return {{"MeanderingProgrammer/render-markdown.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons", "latex-lsp/tree-sitter-latex"}, config = _1_}}
