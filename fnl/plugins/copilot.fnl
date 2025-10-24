[{1 :zbirenbaum/copilot.lua
  :cmd :Copilot
  :event :InsertEnter
  :config (fn []
            (let [copilot (require :copilot)]
              (copilot.setup
                {
                 :panel {:enabled false
                         :auto_refresh true
                         :keymap {:accept "<CR>"
                                  :refresh "<M-r>"
                                  :open "<M-p>"}}

                 :suggestion {:enabled false
                              :auto_trigger true
                              :debounce 45
                              :keymap {:accept "<Right>"
                                       :accept_word "<M-f>"
                                       :accept_line "<M-l>"
                                       :next "<M-]>"
                                       :prev "<M-[>"
                                       :dismiss "<C-]>"}}

                 :filetypes {:c {:suggestion {:enabled false}}
                             :cpp {:suggestion {:enabled false}}
                             :python {:suggestion {:enabled false}}
                             :yaml {:suggestion {:enabled false}}
                             :markdown {:suggestion {:enabled false}}
                             :help {:suggestion {:enabled false}}
                             :TelescopePrompt {:suggestion {:enabled false}}}})))

  :keys [[:<leader>cc :<cmd>Copilot<CR> {:desc "Copilot: Toggle"}]
         [:fleader>cp "<cmd>Copilot panel<CR>" {:desc "Copilot: Open Panel"}]]}]
