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
       :termguicolors true}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

{}
