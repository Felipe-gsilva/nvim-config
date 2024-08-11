vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ee", vim.cmd.ConjureEval)
vim.keymap.set("n", "<leader>ef", vim.cmd.ConjureEvalFile)
vim.keymap.set("n", "<leader>eb", vim.cmd.ConjureEvalBuf)
vim.keymap.set("n", "<leader>ew", vim.cmd.ConjureEvalWord)
vim.keymap.set("n", "<leader>er", vim.cmd.ConjureEvalCurrentForm)

vim.g["conjure#mapping#doc_word"] = false
vim.g["conjure#mapping#doc_word"] = "gk"
vim.g["conjure#mapping#doc_word"] = {"K"}

