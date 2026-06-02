[{1 :tlaplus-community/tlaplus-nvim-plugin
  :dependencies [:susliko/tla.nvim]
  :config (fn [] 
            (set vim.g.tlaplus_mappings_enable true)
            (let [tla (require :tla)]
              (tla.setup 
                {:java_executable "/usr/bin/java" })
              )
            )
  }]
