[{1 :EdenEast/nightfox.nvim
  :dependencies [:norcalli/nvim-colorizer.lua]
  :config (fn []
            (let [now (vim.loop.new_date)
                  hour (.getHours now)]
              (if (< hour 12)
                (do
                  (vim.cmd "colorscheme dawnfox"))
                (do
                  (vim.cmd "colorscheme nightfox") ;; replace with your desired night theme
                  ))))}]
