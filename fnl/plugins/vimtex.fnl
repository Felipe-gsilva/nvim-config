[{1 :lervag/vimtex 
  :lazy false
  :tag "v2.15"
  :init (fn []
          (set vim.g.vimtex_view_method "zathura")
          (set vim.g.vimtex_view_forward_search_on_start false)
          (set vim.g.vimtex_compiler_latexmk 
               {:build_dir "build"
                :options ["-xelatex"
                          "-file-line-error"
                          "-synctex=1"
                          "-interaction=nonstopmode"]}))}]
