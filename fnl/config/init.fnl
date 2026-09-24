(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

;space is reserved to be lead
(vim.keymap.set :n :<space> :<nop> {:noremap true})

;sets a nvim global options
(let [options
      {:expandtab true
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       :completeopt "menuone,noselect"
       :ignorecase true
       :smartcase true
       :clipboard "unnamedplus"
       :ruler true
       :number true
       :relativenumber true
       :termguicolors true
       :conceallevel 2 }]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

;setting vim.g options
(set vim.g.loaded_perl_provider 0)
(set vim.g.loaded_ruby_provider 0)

;centered navigation
(vim.keymap.set :n :<C-d> :<C-d>zz)
(vim.keymap.set :n :<C-u> :<C-u>zz)
(vim.keymap.set :n :n :nzzzv)
(vim.keymap.set :n :N :Nzzzv)

;highlight on yank
(let [yank_group (vim.api.nvim_create_augroup :highlight_yank {:clear true})]
  (vim.api.nvim_create_autocmd :TextYankPost
    {:group yank_group
     :pattern "*"
     :callback (fn [] (vim.highlight.on_yank {:higroup :IncSearch :timeout 150}))}))

{}
