-- [nfnl] fnl/plugins/conform.fnl
local function _1_()
  return require("conform").format({async = true, lsp_fallback = true})
end
local function _2_()
  return require("conform").format({async = true, lsp_fallback = true})
end
return {{"stevearc/conform.nvim", event = {"BufWritePre"}, cmd = {"ConformInfo"}, keys = {{"<leader>lf", _1_, desc = "Format Buffer"}, {"<leader>cf", _2_, desc = "Format Buffer"}}, opts = {formatters_by_ft = {javascript = {"prettierd", "prettier"}, typescript = {"prettierd", "prettier"}, javascriptreact = {"prettierd", "prettier"}, typescriptreact = {"prettierd", "prettier"}, lua = {"stylua"}, python = {"black", "isort"}, markdown = {"prettierd", "prettier"}, tex = {"latexindent"}}}}}
