;; Dont forget to install ltex with: 
;; :CocInstall coc-ltex 

[{1 :neoclide/coc.nvim
  :branch :release
  :cmd [ :CocAction :CocCommand :CocInstall :CocConfig :CocList]
  :dependencies {}
  :build "npm install"
  :config (fn []
            (vim.cmd "let g:coc_filetype_map = {'tex': 'latex', 'markdown': 'markdown'}"))}]
