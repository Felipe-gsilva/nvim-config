[{1 :folke/noice.nvim
  :dependencies [:MunifTanjim/nui.nvim]
  :config (fn []
            (let [noice (require "noice")]
              (noice.setup {:views 
                            {:cmdline_popup {:position 
                                             {:row "50%" 
                                              :col "50%"}
                                             :size 
                                             {:width "auto"
                                              :height "auto"}}
                             :popupmenu {:relative "editor"
                                         :size {:width "40%"
                                                :height "auto"}
                                         :position {:row 21 
                                                    :col "50%"}
                                         :border {:style "rounded"}
                                         :win-options {:Normal "Normal"
                                                       :FloatBorder "DiagnosticInfo"}}
                             :messages {:enabled true
                                        :view "notify"
                                        :view-error "notify"
                                        :view-warn "notify"}}})))}]
