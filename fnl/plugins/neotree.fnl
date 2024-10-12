[{1 :nvim-neo-tree/neo-tree.nvim
  :branch "v3.x"
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-tree/nvim-web-devicons
                 :MunifTanjim/nui.nvim
                 :3rd/image.nvim]
  :config (fn []
            (vim.keymap.set :n "<leader>ff" ":Neotree toggle<CR>" {:noremap true :silent true})
            (vim.api.nvim_create_autocmd "VimEnter" {:callback (fn [] (vim.cmd "Neotree"))}))}]
