[{1 :julienvincent/nvim-paredit
  :ft [:clojure :fennel]
  :opts {}}

 {1 :julienvincent/nvim-paredit-fennel
  :ft [:fennel]
  :dependencies [:julienvincent/nvim-paredit]}

 {1 :windwp/nvim-autopairs
  :event "InsertEnter"
  :config (fn []
            (let [autopairs (require :nvim-autopairs)]
              (autopairs.setup
                {:map_cr true
                 :check_ts true
                 :enable_check_bracket_line false})))}]
