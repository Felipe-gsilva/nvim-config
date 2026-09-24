[{1 :folke/flash.nvim
  :event "VeryLazy"
  :opts {}
  :keys [{1 :s :mode [:n :x :o] 2 (fn [] ((. (require :flash) :jump))) :desc "Flash"}
         {1 :S :mode [:n :x :o] 2 (fn [] ((. (require :flash) :treesitter))) :desc "Flash Treesitter"}
         {1 :r :mode :o 2 (fn [] ((. (require :flash) :remote))) :desc "Remote Flash"}
         {1 :R :mode [:o :x] 2 (fn [] ((. (require :flash) :treesitter_search))) :desc "Treesitter Search"}]}]
