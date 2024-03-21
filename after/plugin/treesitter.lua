require'nvim-treesitter.configs'.setup {
	ensure_installed = {"c","cpp" ,"lua", "vim", "vimdoc", "query", "php", "html", "json", "css", "java"},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true, 

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true, 
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true
	},
}
