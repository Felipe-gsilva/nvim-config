[{1 :folke/noice.nvim
  :dependencies [:MunifTanjim/nui.nvim
                 ]
  :config (fn []
            (let [noice (require "noice")]
              (noice.setup {:views 
                            {:cmdline_popup 
                             {:positon 
                              {:row "50%" 
                               :col "50%"}}}
                            :messages {:enabled true
                                       :view "notify"
                                       :view-error "notify"
                                       :view-warn "notify"}})))}]
