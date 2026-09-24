-- [nfnl] fnl/plugins/markdown-preview.fnl
local function _1_()
  vim.g.mkdp_filetypes = {"markdown"}
  return nil
end
return {{"iamcco/markdown-preview.nvim", cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"}, build = "cd app && npm install", init = _1_, ft = {"markdown"}}}
