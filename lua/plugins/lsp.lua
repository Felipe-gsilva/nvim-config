-- [nfnl] fnl/plugins/lsp.fnl
local function _1_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
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
  vim.diagnostic.config({underline = true, update_in_insert = true, severity_sort = true, virtual_text = false})
  vim.fn.sign_define("DiagnosticSignError", {text = "\239\129\151", texthl = "DiagnosticSignError"})
  vim.fn.sign_define("DiagnosticSignWarn", {text = "\239\129\177", texthl = "DiagnosticSignWarn"})
  vim.fn.sign_define("DiagnosticSignInfo", {text = "\239\129\154", texthl = "DiagnosticSignInfo"})
  mason.setup({})
  mason_lspconfig.setup({ensure_installed = {"pyright", "clojure_lsp", "clangd", "html"}})
  lsp.pyright.setup({on_attach = on_attach, capabilities = capabilities})
  lsp.clangd.setup({on_attach = on_attach, capabilities = capabilities})
  lsp.html.setup({on_attach = on_attach, capabilities = capabilities, provideFormatter = true})
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
  return lsp.clojure_lsp.setup({on_attach = on_attach, capabilities = capabilities, before_init = _5_, root_dir = _6_})
end
return {{"neovim/nvim-lspconfig", event = "BufReadPre", dependencies = {"folke/neodev.nvim", "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim"}, config = _1_}}
