[{1 :nvim-neotest/neotest
  :dependencies [:nvim-neotest/nvim-nio
                 :nvim-lua/plenary.nvim
                 :antoinemadec/FixCursorHold.nvim
                 :nvim-treesitter/nvim-treesitter
                 :nvim-neotest/neotest-jest]
  :config (fn []
            (let [neotest (require :neotest)
                  jest (require :neotest-jest)]
              (neotest.setup
                {:adapters [(jest {})]})))
  :keys [{1 :<leader>tr 2 (fn [] ((. (require :neotest) :run :run))) :desc "Run Nearest Test"}
         {1 :<leader>tf 2 (fn [] ((. (require :neotest) :run :run) (vim.fn.expand "%"))) :desc "Run File Tests"}
         {1 :<leader>ts 2 (fn [] ((. (require :neotest) :run :run) (vim.fn.getcwd))) :desc "Run Test Suite"}
         {1 :<leader>to 2 (fn [] ((. (require :neotest) :summary :toggle))) :desc "Toggle Test Summary"}
         {1 :<leader>tp 2 (fn [] ((. (require :neotest) :output :open) {:enter true :auto_close true})) :desc "Show Test Output"}
         {1 :<leader>tS 2 (fn [] ((. (require :neotest) :run :stop))) :desc "Stop Test"}]}]
