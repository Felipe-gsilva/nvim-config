[{1 :ThePrimeagen/harpoon
  :branch "harpoon2"
  :dependencies [:nvim-lua/plenary.nvim]
  :config (fn []
            (let [harpoon (require :harpoon)]
              (harpoon.setup {})))
  :init (fn []
          (local harpoon (require :harpoon))
          (local list (harpoon:list))  ; Store the list instance

          ;; Keymaps with proper API calls
          (vim.keymap.set :n :<leader>a (fn [] (list:add)))
          (vim.keymap.set :n :<C-e> (fn [] (harpoon.ui:toggle_quick_menu list)))
          (vim.keymap.set :n :<C-1> (fn [] (list:select 1)))
          (vim.keymap.set :n :<C-2> (fn [] (list:select 2)))
          (vim.keymap.set :n :<C-3> (fn [] (list:select 3)))
          (vim.keymap.set :n :<C-4> (fn [] (list:select 4)))
          (vim.keymap.set :n :<C-5> (fn [] (list:select 5)))
          (vim.keymap.set :n :<C-6> (fn [] (list:select 6)))
          (vim.keymap.set :n :<C-S-P> (fn [] (list:prev)))
          (vim.keymap.set :n :<C-S-N> (fn [] (list:next))))}]

