-- [nfnl] Compiled from fnl/plugins/markdownpreview.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.cmd.RenderMarkdown()
  local md = require("render-markdown")
  md.enable()
  return md.setup({latex = {enabled = true, converter = "latex2text", highlight = "RenderMarkdownMath", right_pad = 1, top_pad = 0, bottom_pad = 0}})
end
return {{"MeanderingProgrammer/render-markdown.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, config = _1_}}
