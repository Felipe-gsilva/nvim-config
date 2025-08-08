[{1 :rcarriga/nvim-notify
  :event "VeryLazy"
  :config (fn []
            (let [notify (require :notify)]
              (set vim.notify notify)

              (notify.setup
                {:timeout 2000
                 :render "minimal"
                 :max_width 50
                 :max_height 10}))) }]
