-- [nfnl] fnl/plugins/markdown-preview.fnl
local function _1_()
  local function _2_()
  end
  return vim.fn["mkdp#util#install"][_2_]
end
local function _3_()
  vim.g.mkdp_filetypes = {"markdown"}
  return nil
end
return {{"iamcco/markdown-preview.nvim", cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"}, build = _1_, init = _3_, ft = {"markdown"}}}
