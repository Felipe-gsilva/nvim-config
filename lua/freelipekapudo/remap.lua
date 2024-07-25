vim.g.mapleader = " "

vim.keymap.set("n", "<leader>f", vim.cmd.NvimTreeToggle)
vim.keymap.set("i", "<Caps>","<C^c")

vim.keymap.set("n", "<leader>ee", vim.cmd.ConjureEval)
vim.keymap.set("n", "<leader>ef", vim.cmd.ConjureEvalFile)

-- Disable the documentation mapping
vim.g["conjure#mapping#doc_word"] = false
-- Rebind it from K to <prefix>gk
vim.g["conjure#mapping#doc_word"] = "gk"
-- Reset it to the default unprefixed K (note the special table wrapped syntax)
vim.g["conjure#mapping#doc_word"] = {"K"}

