[{1 :nvimdev/dashboard-nvim
  :event "VimEnter"
  :config (fn []
            (let [dash (require "dashboard")]
              (dash.setup {})))
  :dependencies [:nvim-tree/nvim-web-devicons] }]
