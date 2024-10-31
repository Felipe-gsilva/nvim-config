[{1 :MeanderingProgrammer/render-markdown.nvim
  :dependencies [:nvim-treesitter/nvim-treesitter 
                 :nvim-tree/nvim-web-devicons]
  :cmd "RenderMarkdown"
  :config (fn []
            (let [md (require :render-markdown)]
              (md.setup {:latex {:enabled true
                               :converter "latex2text"
                               :highlight "RenderMarkdownMath"
                               :top_pad 0
                               :bottom_pad 0}})))}]

;; TODO add latex 
