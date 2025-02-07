-- [nfnl] Compiled from fnl/plugins/markdown-preview.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g.mkdp_filetypes = {"markdown"}
  return nil
end
return {{"iamcco/markdown-preview.nvim", cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"}, build = "cd app && yarn install", init = _1_, ft = {"markdown"}}}
