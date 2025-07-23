[{1 :nvimdev/dashboard-nvim
  :event "VimEnter"
  :config (fn []
            (let [dash (require "dashboard")]
              (dash.setup {}))
            (vim.api.nvim_create_autocmd "VimEnter"
              {:pattern "*"
               :callback (fn []
                           (when (and (= 0 (vim.fn.argc)) 
                                      (= "" (vim.fn.bufname "%")))
                             (vim.cmd "Dashboard")))}))

  :dependencies [:nvim-tree/nvim-web-devicons] }]
