[{ 1 :zbirenbaum/copilot.lua
  :setup (fn []
           (let [copilot (require :copilot)]
             (.setup copilot
                     {:panel {:enabled true
                              :auto_refresh false
                              :keymap {:jump_prev "[["
                                                     :jump_next "]]"
                                       :accept "<CR>"
                                       :refresh "gr"
                                       :open "<M-CR>"}
                              :layout {:position "bottom"
                                       :ratio 0.4}}
                      :suggestion {:enabled true
                                   :auto_trigger false
                                   :hide_during_completion true
                                   :debounce 75
                                   :trigger_on_accept true
                                   :keymap {:accept "<M-l>"
                                            :accept_word false
                                            :accept_line false
                                            :next "<M-]>"
                                            :prev "<M-[>"
                                            :dismiss "<C-]>"}}
                      :filetypes {:yaml false
                                  :markdown false
                                  :help false
                                  :gitcommit false
                                  :gitrebase false
                                  :hgcommit false
                                  :svn false
                                  :cvs false
                                  :. false} ;; note the `.` key
                      :auth_provider_url nil
                      :logger {
                               :file_log_level vim.log.levels.OFF
                               :print_log_level vim.log.levels.WARN
                               :trace_lsp "off"
                               :trace_lsp_progress false
                               :log_lsp_messages false}
                      :copilot_node_command "node"
                      :workspace_folders []
                      :copilot_model ""

                      :root_dir (fn []
                                  (vim.fs.dirname
                                    (. (vim.fs.find ".git" {:upward true}) 1)))

                      :should_attach (fn [_ _]
                                       (if (not vim.bo.buflisted)
                                         (do
                                           (logger.debug "not attaching, buffer is not 'buflisted'")
                                           false)
                                         (if (not= vim.bo.buftype "")
                                           (do
                                             (logger.debug
                                               "not attaching, buffer 'buftype' is "
                                               vim.bo.buftype)
                                             false)
                                           true)))

                      :server {:type "nodejs"
                               :custom_server_filepath nil}
                      :server_opts_overrides {}})))
  }]
