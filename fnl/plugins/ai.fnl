[{1 :zbirenbaum/copilot.lua
   :cmd "Copilot"
   :event "InsertEnter"
   :config (fn []
             (let [copilot (require :copilot)]
               (copilot.setup
                 { :panel {:enabled true
                          :auto_refresh true}
                  :suggestion {:auto_trigger false
                               :keymap {:accept "<M-l>"
                                        :next "<M-]>"
                                        :prev "<M-[>"
                                        :dismiss "<C-]>"}
                               :debounce 75}
                  :filetypes {:yaml false
                              :markdown false}}))
             (vim.keymap.set :n :<leader>tt (fn [] (vim.cmd "Copilot toggle")) {:noremap true :silent true}))}]
