[{1 :jbyuki/nabla.nvim
  :ft [:markdown :tex]
  :config (fn []
            (let [nabla (require :nabla)]
              (vim.keymap.set :n :<leader>p (fn [] (nabla.popup)) {:desc "Nabla LaTeX Popup"})
              (vim.keymap.set :n :<leader>P (fn [] (nabla.toggle_virt {:autowrap true})) {:desc "Nabla Toggle Virtual Text"})))}]
