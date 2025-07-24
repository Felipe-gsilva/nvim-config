-- [nfnl] fnl/plugins/lsp.fnl
local function _1_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local on_attach
  local function _2_(client, bufnr)
    local map
    local function _3_(mode, key, func)
      return vim.keymap.set(mode, key, func, {noremap = true, silent = true, buffer = bufnr})
    end
    map = _3_
    map("n", "K", vim.lsp.buf.hover)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "<leader>ld", vim.lsp.buf.declaration)
    map("n", "<leader>lt", vim.lsp.buf.type_definition)
    map("n", "<leader>lh", vim.lsp.buf.signature_help)
    map("n", "<leader>ln", vim.lsp.buf.rename)
    map("n", "<leader>la", vim.lsp.buf.code_action)
    map("v", "<leader>la", vim.lsp.buf.code_action)
    local function _4_()
      return vim.lsp.buf.format({async = true})
    end
    map("n", "<leader>lf", _4_)
    map("n", "<leader>le", vim.diagnostic.open_float)
    map("n", "<leader>lq", vim.diagnostic.setloclist)
    map("n", "<leader>lj", vim.diagnostic.goto_next)
    map("n", "<leader>lk", vim.diagnostic.goto_prev)
    map("n", "[d", vim.diagnostic.goto_prev)
    map("n", "]d", vim.diagnostic.goto_next)
    local telescope = require("telescope.builtin")
    map("n", "<leader>lw", telescope.diagnostics)
    map("n", "<leader>lr", telescope.lsp_references)
    return map("n", "<leader>li", telescope.lsp_implementations)
  end
  on_attach = _2_
  local capabilities = cmplsp.default_capabilities()
  local handlers = {["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local servers = {"pylsp", "clojure_lsp", "clangd", "html", "tailwindcss", "ts_ls", "markdown_oxide"}
  vim.diagnostic.config({underline = true, update_in_insert = true, severity_sort = true, virtual_text = false})
  vim.fn.sign_define("DiagnosticSignError", {text = "\239\129\151", texthl = "DiagnosticSignError"})
  vim.fn.sign_define("DiagnosticSignWarn", {text = "\239\129\177", texthl = "DiagnosticSignWarn"})
  vim.fn.sign_define("DiagnosticSignInfo", {text = "\239\129\154", texthl = "DiagnosticSignInfo"})
  vim.fn.sign_define("DiagnosticSignHint", {text = "\239\129\153", texthl = "DiagnosticSignHint"})
  for _, server_name in ipairs(servers) do
    local server_config = lsp[server_name]
    server_config.setup({on_attach = on_attach, capabilities = capabilities, handlers = handlers})
  end
  lsp.pylsp.setup({settings = {pylsp = {plugins = {pycodestyle = {ignore = {"W391", "W293", "E302"}, maxLineLength = 150}}}}})
  local function _5_(params)
    params.workDoneToken = "1"
    return nil
  end
  local function _6_(pattern)
    local util = require("lspconfig.util")
    local fallback = vim.loop.cwd()
    local patterns = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"}
    local root = util.root_pattern(patterns)(pattern)
    return (root or fallback)
  end
  lsp.clojure_lsp.setup({before_init = _5_, root_dir = _6_})
  lsp.html.setup({configurationSection = {"html", "css", "javascript"}, embeddedLanguages = {css = true, javascript = true, hugo = true}, provideFormatter = true})
  lsp.tailwindcss.setup({filetypes = {"aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ"}})
  return lsp.ts_ls.setup({filetypes = {"javascript", "typescript", "vue", "javascriptreact", "javascript.jsx", "typescriptreact", "typescript.tsx"}})
end
return {{"neovim/nvim-lspconfig", event = "BufReadPre", dependencies = {"folke/neodev.nvim"}, config = _1_}}
