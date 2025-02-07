[{1 :rcarriga/nvim-notify
  :config (fn [] 
            (let [notify (require :notify)]
              (notify.setup {:timeout 2000
                             :render "minimal"
                             :fps 60
                             :animate false})))}]
