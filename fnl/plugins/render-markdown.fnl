[{1 :MeanderingProgrammer/render-markdown.nvim
  :dependencies [:nvim-treesitter/nvim-treesitter 
                 :nvim-tree/nvim-web-devicons 
                 :latex-lsp/tree-sitter-latex]
  :config (fn []
            (let [md (require "render-markdown")]
              (md.setup {:file_types ["markdown"]
                         :latex  
                         {:enabled true
                          :render_modes false
                          :top_pad 1
                          :bottom_pad 0
                          :highlight "RenderMarkdownMath"
                          :converter "latex2text"        ;; LaTeX converter
                          }})))}]
