vim.wo.number = true
vim.opt.termguicolors = true

local o = vim.o
o.expandtab = true 
o.smartindent = true 
o.tabstop = 2 
o.shiftwidth = 2 

require("freelipekapudo.remap")
