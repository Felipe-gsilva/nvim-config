[{1 :neovim/nvim-lspconfig
  :event "BufReadPre"
  :dependencies [:folke/neodev.nvim
                 :williamboman/mason.nvim
                 :williamboman/mason-lspconfig.nvim]
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  mason (require :mason)
                  mason-lspconfig (require :mason-lspconfig)

                  ;; --- 1. Shared settings and on_attach keymaps ---
                  on_attach (fn [client bufnr]
                              (let [map (fn [mode key func]
                                          (vim.keymap.set mode key func {:noremap true :silent true :buffer bufnr}))]
                                (map :n :K vim.lsp.buf.hover)
                                (map :n :gd vim.lsp.buf.definition)
                                (map :n :<leader>ld vim.lsp.buf.declaration)
                                (map :n :<leader>lt vim.lsp.buf.type_definition)
                                (map :n :<leader>lh vim.lsp.buf.signature_help)
                                (map :n :<leader>ln vim.lsp.buf.rename)
                                (map :n :<leader>la vim.lsp.buf.code_action)
                                (map :v :<leader>la vim.lsp.buf.code_action)
                                (map :n :<leader>lf (fn [] (vim.lsp.buf.format {:async true})))
                                (map :n :<leader>le vim.diagnostic.open_float)
                                (map :n :<leader>lq vim.diagnostic.setloclist)
                                (map :n :<leader>lj vim.diagnostic.goto_next)
                                (map :n :<leader>lk vim.diagnostic.goto_prev)
                                (map :n "[d" vim.diagnostic.goto_prev)
                                (map :n "]d" vim.diagnostic.goto_next)
                                (let [telescope (require :telescope.builtin)]
                                  (map :n :<leader>lw telescope.diagnostics)
                                  (map :n :<leader>lr telescope.lsp_references)
                                  (map :n :<leader>li telescope.lsp_implementations)))) 

                  capabilities (cmplsp.default_capabilities)]

              ;; --- 2. Diagnostic config ---
              (vim.diagnostic.config {:virtual_text false :underline true :update_in_insert true :severity_sort true})
              (vim.fn.sign_define "DiagnosticSignError" {:text "" :texthl "DiagnosticSignError"})
              (vim.fn.sign_define "DiagnosticSignWarn"  {:text "" :texthl "DiagnosticSignWarn"})
              (vim.fn.sign_define "DiagnosticSignInfo"  {:text "" :texthl "DiagnosticSignInfo"})

              ;; --- 3. Install servers with Mason ---
              (mason.setup {})
              (mason-lspconfig.setup {:ensure_installed [:pyright :clojure_lsp :clangd :html]})

              ;; --- 4. Setup each server individually (SIMPLE AND EXPLICIT) ---
              (lsp.pyright.setup {:on_attach on_attach :capabilities capabilities})
              (lsp.clangd.setup {:on_attach on_attach :capabilities capabilities})
              (lsp.html.setup {:on_attach on_attach :capabilities capabilities
                               :provideFormatter true})

              (lsp.clojure_lsp.setup
                {:on_attach on_attach
                 :capabilities capabilities
                 :before_init (fn [params] (set params.workDoneToken :1))
                 :root_dir (fn [pattern]
                             (let [util (require :lspconfig.util)
                                   fallback (vim.loop.cwd)
                                   patterns [:project.clj :deps.edn :build.boot :shadow-cljs.edn :.git :bb.edn]
                                   root ((util.root_pattern patterns) pattern)]
                               (or root fallback)))})))} ]
