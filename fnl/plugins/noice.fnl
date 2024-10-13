[{1 :folke/noice.nvim
  :dependencies [:MunifTanjim/nui.nvim
                 ]
  :config (fn []
            (let [noice (require "noice")]
              (noice.setup {:views 
                            {:cmdline_popup {:position 
                                             {:row 18 
                                              :col "50%"}
                                             :size 
                                             {:width 60
                                              :height "auto"}}
                             :popupmenu {:relative "editor"
                                         :size {:width 60
                                                :height 10}
                                         :position {:row 21 
                                                    :col "50%"}
                                         :border {:style "rounded"}
                                         :win-options {:Normal "Normal"
                                                       :FloatBorder "DiagnosticInfo"}}
                             :messages {:enabled true
                                        :view "notify"
                                        :view-error "notify"
                                        :view-warn "notify"}}})))}]
