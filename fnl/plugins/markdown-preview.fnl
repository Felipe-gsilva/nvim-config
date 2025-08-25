[{1 :iamcco/markdown-preview.nvim
  :cmd ["MarkdownPreviewToggle" "MarkdownPreview" "MarkdownPreviewStop"]
  :build (fn [] (. vim.fn "mkdp#util#install" (fn [])))
  :init (fn [] (set vim.g.mkdp_filetypes ["markdown"]))
  :ft ["markdown"]}]
