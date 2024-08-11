vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.termguicolors = true


-- normal identation but this sucks
local o = vim.o
o.expandtab = true 
o.smartindent = true 
o.tabstop = 2 
o.shiftwidth = 2 

require("freelipekapudo.remap")
