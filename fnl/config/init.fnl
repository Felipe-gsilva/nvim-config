(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

;space is reserved to be lead
(vim.keymap.set :n :<space> :<nop> {:noremap true})

; Explicit clipboard setup for Wayland
;(local clipboard
;  {:name "wl-clipboard"
;   :copy {:+ "wl-copy --type text/plain"}
;   :paste {:+ "wl-paste --no-newline"}
;   :cache_enabled true})
;
;(core.assoc vim.g :clipboard clipboard)

;sets a nvim global options
(let [options
      {;tabs is space
       :expandtab true
       ;tab/indent size
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       ;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"
       ;show line numbers
       :relativenumber true
       ;show line and column number
       :ruler true
       ;makes signcolumn always one column with signs and linenumber
       :signcolumn "number"}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

{}
