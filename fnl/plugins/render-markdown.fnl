[{1 :nvim-treesitter/nvim-treesitter
  :dependencies [:OXY2DEV/markview.nvim
                 :TobinPalmer/pastify.nvim]
  :lazy false
  :config (fn [] 
            (let [pastify (require :pastify)]
                (pastify.setup {
                                :absolute_path false
                                :local_path "/assets/imgs/"
                                :save "local"
                                :filename = ''
                                :filename (fn [] (.(. vim.fn.expand "%:t:r") "_" (os.date "%Y-%m-%d_%H-%M-%S")))
                                :default_ft :markdown:
                                })))}]
