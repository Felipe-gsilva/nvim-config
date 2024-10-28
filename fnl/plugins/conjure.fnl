[{1 :Olical/conjure
  :branch "master"
  :init (fn []
          (set vim.g.conjure#mapping#doc_word "K")
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
          (vim.keymap.set :n "<leader>ef" ":ConjureEvalFile<CR>" )
          (vim.keymap.set :n "<leader>eb" ":ConjureEvalBuf<CR>")
          (vim.keymap.set :n "<leader>er" ":ConjureEvalCurrentForm<CR>")
          (vim.keymap.set :n "<leader>sv" ":ConjureLogVSplit<CR>" {:noremap true :silent true}))}]
