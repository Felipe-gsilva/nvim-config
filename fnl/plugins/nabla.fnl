[{1 :jbyuki/nabla.nvim
  :ft [:markdown :tex]
  :keys [{1 :<leader>p
          2 (fn [] ((. (require :nabla) :popup)))
          :desc "Nabla LaTeX Popup"}
         {1 :<leader>P
          2 (fn [] ((. (require :nabla) :toggle_virt) {:autowrap true}))
          :desc "Nabla Toggle Virtual Text"}]}]
