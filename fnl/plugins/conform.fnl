[{1 :stevearc/conform.nvim
  :event [:BufWritePre]
  :cmd [:ConformInfo]
  :keys [{1 :<leader>lf
          2 (fn [] ((. (require :conform) :format) {:async true :lsp_fallback true}))
          :desc "Format Buffer"}
         {1 :<leader>cf
          2 (fn [] ((. (require :conform) :format) {:async true :lsp_fallback true}))
          :desc "Format Buffer"}]
  :opts {:formatters_by_ft {:javascript [:prettierd :prettier]
                            :typescript [:prettierd :prettier]
                            :javascriptreact [:prettierd :prettier]
                            :typescriptreact [:prettierd :prettier]
                            :lua [:stylua]
                            :python [:black :isort]
                            :markdown [:prettierd :prettier]
                            :tex [:latexindent]}}}]
