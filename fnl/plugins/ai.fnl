[{1 :olimorris/codecompanion.nvim
  :dependencies []
  :config (fn []
            (let [codec (require :codecompanion)
                  curl (require :plenary.curl)
                  log (require :codecompanion.utils.log)
                  utils (require :codecompanion.utils.adapters)
                  get-models (fn [self opts]
                               (let [adapter ((require :codecompanion.adapters).resolve self)]
                                 (if (not adapter)
                                     (do (log:error "Could not resolve Ollama adapter in the `get_models` function")
                                         [])
                                     (do
                                       (adapter.get-env-vars)
                                       (let [url adapter.env-replaced.url
                                             headers (if adapter.env-replaced.api_key
                                                          {"content-type" "application/json"
                                                           "Authorization" (.. "Bearer " adapter.env-replaced.api_key)}
                                                          {"content-type" "application/json"})
                                             response (pcall (fn []
                                                               (curl.get (.. url "/v1/models")
                                                                         {:sync true
                                                                          :headers headers
                                                                          :insecure config.adapters.opts.allow_insecure
                                                                          :proxy config.adapters.opts.proxy})))]
                                         (if (not (first response))
                                             (do (log:error (.. "Could not get the Ollama models from " url "/v1/models.\nError: " (second response)))
                                                 [])
                                             (let [json (pcall (fn [] (vim.json.decode (second response).body)))]
                                               (if (not (first json))
                                                   (do (log:error (.. "Could not parse the response from " url "/v1/models"))
                                                       [])
                                                   (let [models (map (fn [model] model.id) (second json).data)]
                                                     (if (and opts (:last opts))
                                                         (first models)
                                                         models))))))))))]
              (codec.setup
                {:opts {:log_level "DEBUG"}
                 :strategies {:chat {:adapter "ollama"}
                              :inline {:adapter "ollama"}}
                 :adapter {:name "ollama"
                           :formatted_name "Ollama"
                           :roles {:llm "assistant"
                                   :user "user"}
                           :opts {:stream true}
                           :features {:text true
                                      :tokens true
                                      :vision false}
                           :url "${url}/api/chat"
                           :env {:url "http://localhost:11434"}
                           :handlers {:form_parameters (fn [self params messages] params)
                                      :form_messages (fn [self messages]
                                                       {:messages (utils.merge-messages messages)})
                                      :tokens (fn [self data]
                                                (let [json (pcall (fn [] (vim.json.decode data {:luanil {:object true}})))]
                                                  (if (and (first json) (:eval_count (second json)))
                                                      (:eval_count (second json)))))
                                      :chat_output (fn [self data]
                                                    (let [json (pcall (fn [] (vim.json.decode data {:luanil {:object true}})))]
                                                      (if (first json)
                                                          (let [message (:message (second json))]
                                                            {:status "success"
                                                             :output {:content (:content message)
                                                                      :role (:role message)}})
                                                          {:status "error"
                                                           :output "Error malformed json"})))
                                      :inline_output (fn [self data context]
                                                      (let [json (pcall (fn [] (vim.json.decode data {:luanil {:object true}})))]
                                                        (if (first json) (:content (:message (second json))))))
                                      :on_exit (fn [self data]
                                                 (when (>= (:status data) 400)
                                                   (log:error (.. "Error: " (:body data)))))}
                           :schema {:model {:order 1
                                            :mapping "parameters"
                                            :type "enum"
                                            :desc "ID of the model to use."
                                            :default (fn [self] (get-models self {:last true}))
                                            :choices (fn [self] (get-models self))}
                                    :temperature {:order 2
                                                  :mapping "parameters.options"
                                                  :type "number"
                                                  :optional true
                                                  :default 0.8
                                                  :desc "Sampling temperature between 0 and 2."
                                                  :validate (fn [n] [(and (>= n 0) (<= n 2)) "Must be between 0 and 2"])}
                                    :num_ctx {:order 3
                                              :mapping "parameters.options"
                                              :type "number"
                                              :optional true
                                              :default 2048
                                              :desc "Max tokens in context."
                                              :validate (fn [n] [(> n 0) "Must be a positive number"])}
                                    }}})))}]
