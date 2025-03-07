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
          (vim.keymap.set :n :<C-q> (fn [] (harpoon.ui:toggle_quick_menu list)))
          (vim.keymap.set :n :<C-w> (fn [] (list:select 1)))
          (vim.keymap.set :n :<C-e> (fn [] (list:select 2)))
          (vim.keymap.set :n :<C-r> (fn [] (list:select 3)))
          (vim.keymap.set :n :<C-t> (fn [] (list:select 4)))
          (vim.keymap.set :n :<C-S-P> (fn [] (list:prev)))
          (vim.keymap.set :n :<C-S-N> (fn [] (list:next))))}]
