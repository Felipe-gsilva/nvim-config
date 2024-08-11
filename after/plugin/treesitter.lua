require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c","cpp" ,"lua", "vim", "vimdoc", "query", "html", "json", "css", "java", "clojure"},
  sync_install = true, 
  auto_install = true,

  highlight = {
    enable = true, 
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  },
}
