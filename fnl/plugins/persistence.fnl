[{1 :folke/persistence.nvim
  :event :BufReadPre
  :opts {}
  :keys [{1 :<leader>qs 2 (fn [] ((. (require :persistence) :load))) :desc "Restore Session"}
         {1 :<leader>ql 2 (fn [] ((. (require :persistence) :load) {:last true})) :desc "Restore Last Session"}
         {1 :<leader>qd 2 (fn [] ((. (require :persistence) :stop))) :desc "Don't Save Current Session"}]}]
