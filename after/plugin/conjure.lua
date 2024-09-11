vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ee", vim.cmd.ConjureEval)
vim.keymap.set("n", "<leader>ef", vim.cmd.ConjureEvalFile)
vim.keymap.set("n", "<leader>eb", vim.cmd.ConjureEvalBuf)
vim.keymap.set("n", "<leader>ew", vim.cmd.ConjureEvalWord)
vim.keymap.set("n", "<leader>er", vim.cmd.ConjureEvalCurrentForm)

vim.g["conjure#mapping#doc_word"] = false
vim.g["conjure#mapping#doc_word"] = "gk"
vim.g["conjure#mapping#doc_word"] = {"K"}

-- Plugin configurations
vim.g['deoplete#enable_at_startup'] = 1
vim.call('deoplete#custom#option', 'keyword_patterns', {clojure = '[\\w!$%&*+/:<=>?@\\^_~\\-\\.]*'})
vim.opt.completeopt:remove('preview')

vim.g['float_preview#docked'] = 0
vim.g['float_preview#max_width'] = 80
vim.g['float_preview#max_height'] = 40

vim.g.ale_linters = {
  clojure = {'clj-kondo', 'joker'}
}
