[{1 :Olical/conjure
  :branch "master"
  :init (fn []
          (set vim.g.conjure#mapping#doc_word "K")
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
          (vim.keymap.set :n "<leader>ef" ":ConjureEvalFile" )
          (vim.keymap.set :n "<leader>eb" ":ConjureEvalBuf")
          (vim.keymap.set :n "<leader>er" ":ConjureEvalCurrentForm")
          (vim.keymap.set :n "<leader>sv" ":ConjureLogVSplit<CR>" {:noremap true :silent true}))}]
