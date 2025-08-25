[{1 :zbirenbaum/copilot.lua
  :cmd :Copilot
  :event :InsertEnter
  :config (fn []
            (let [copilot (require :copilot)]
              (copilot.setup
                {
                 :panel {:enabled true
                         :auto_refresh true
                         :keymap {:jump_prev "<M-[>"
                                  :jump_next "<M-]>"
                                  :accept "<CR>"
                                  :refresh "<M-r>"
                                  :open "<M-p>"}}

                 :suggestion {:enabled true
                              :auto_trigger true
                              :debounce 45
                              :keymap {:accept "<Right>"
                                       :accept_word "<M-f>"
                                       :accept_line "<M-l>"
                                       :next "<M-]>"
                                       :prev "<M-[>"
                                       :dismiss "<C-]>"}}

                 :filetypes {:yaml {:suggestion {:enabled false}}
                             :markdown {:suggestion {:enabled false}}
                             :help {:suggestion {:enabled false}}
                             :TelescopePrompt {:suggestion {:enabled false}}}})))

  :keys [[:<leader>cc :<cmd>Copilot<CR> {:desc "Copilot: Toggle"}]
         [:<leader>cp "<cmd>Copilot panel<CR>" {:desc "Copilot: Open Panel"}]]}]
