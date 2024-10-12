[{1 :nvim-neo-tree/neo-tree.nvim
  :branch "v3.x"
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-tree/nvim-web-devicons ; not strictly required, but recommended
                 :MunifTanjim/nui.nvim
                 :3rd/image.nvim ; Optional image support in preview window
                 ]
  :config #((vim.keymap.set :n "<leader>f" ":Neotree toggle<CR>" {:noremap true :silent true})
            (vim.api.nvim_create_autocmd "VimEnter" {:callback (fn [] (vim.cmd "Neotree"))})
            ((require :neo-tree).setup
            {:filesystem {:depth 1  ; Limit the depth to the immediate directory level
                          :filtered_items {:visible false  ; Don't show hidden or ignored files
                                           :hide_dotfiles true
                                           :hide_gitignored true :hide_by_name ["node_modules" ".git"]}}}))}]
