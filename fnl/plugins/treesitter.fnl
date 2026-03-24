[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter.config)]
              (treesitter.setup 
                {:highlight {:enable true}
                 :indent {:enable true}
                 :ensure_installed [:bash
                                    :c_sharp
                                    :clojure
                                    :commonlisp
                                    :rust
                                    :zig
                                    :cpp
                                    :python
                                    :c
                                    :dockerfile
                                    :fennel
                                    :gdscript
                                    :html
                                    :java
                                    :javascript
                                    :json
                                    :lua
                                    :markdown
                                    :rust
                                    :yaml]})))}]
