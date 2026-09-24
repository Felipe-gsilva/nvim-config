[{1 :stevearc/aerial.nvim
  :dependencies [:nvim-treesitter/nvim-treesitter
                 :nvim-tree/nvim-web-devicons]
  :opts {:on_attach (fn [bufnr]
                      (vim.keymap.set :n "{" "<cmd>AerialPrev<CR>" {:buffer bufnr})
                      (vim.keymap.set :n "}" "<cmd>AerialNext<CR>" {:buffer bufnr}))}
  :keys [{1 :<leader>o 2 "<cmd>AerialToggle!<CR>" :desc "Toggle Aerial Outline"}]}]
