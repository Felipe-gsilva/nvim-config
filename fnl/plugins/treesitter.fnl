[{1 :nvim-treesitter/nvim-treesitter
  :branch "main"
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)]
              (treesitter.setup
                {:highlight {:enable true}
                 :indent {:enable true}
                 :ensure_installed [:bash
                                    :c
                                    :clojure
                                    :commonlisp
                                    :dockerfile
                                    :fennel
                                    :html
                                    :java
                                    :javascript
                                    :json
                                    :lua
                                    :markdown
                                    :python
                                    :yaml]})))}]
