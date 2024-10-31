-- [nfnl] Compiled from fnl/plugins/markdownpreview.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local md = require("render-markdown")
  return md.setup({latex = {enabled = true, converter = "latex2text", highlight = "RenderMarkdownMath", top_pad = 0, bottom_pad = 0}})
end
return {{"MeanderingProgrammer/render-markdown.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, cmd = "RenderMarkdown", config = _1_}}
