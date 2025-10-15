[{1 :nvim-pack/nvim-spectre
  :config (fn [] 
            (let [spectre (require "spectre")]
              (spectre.setup {})))
  :init (fn []
          (let [spectre (require "spectre")]
              (vim.keymap.set :n :leader>S spectre.open  {})
              (vim.keymap.set :n :leader>sw ":lua spectre.open_visual({select_word=true})<CR>" {:noremap true :silent true})
              (vim.keymap.set :v :leader>sw ":lua spectre.open_visual()<CR>" {:noremap true :silent true})
              (vim.keymap.set :n :leader>sp ":lua spectre.open_file_search()<CR>" {:noremap true :silent true})))}]

