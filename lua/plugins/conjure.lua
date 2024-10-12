-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g["conjure#mapping#doc_word"] = "K"
  vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  vim.keymap.set("n", "<leader>ef", ":ConjureEvalFile")
  vim.keymap.set("n", "<leader>eb", ":ConjureEvalBuf")
  vim.keymap.set("n", "<leader>er", ":ConjureEvalCurrentForm")
  return vim.keymap.set("n", "<leader>sv", ":ConjureLogVSlit")
end
return {{"Olical/conjure", branch = "master", init = _1_}}
