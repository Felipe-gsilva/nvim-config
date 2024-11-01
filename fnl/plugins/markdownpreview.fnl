[{1 :MeanderingProgrammer/render-markdown.nvim
  :dependencies [:nvim-treesitter/nvim-treesitter 
                 :nvim-tree/nvim-web-devicons]
  :config (fn []
            (vim.cmd.RenderMarkdown)
            (let [md (require "render-markdown")]
              (md.enable)
              (md.setup {:latex {:enabled true
                               :converter "latex2text"
                               :highlight "RenderMarkdownMath"
                               :top_pad 0
                               :bottom_pad 0}})))}]

;; TODO add latex 
