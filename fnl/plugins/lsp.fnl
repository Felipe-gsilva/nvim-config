[{1 :neovim/nvim-lspconfig
  :event "BufReadPre"
  :dependencies [:folke/neodev.nvim]
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)

                  ;; --- 1. Centralized on_attach function ---
                  on_attach (fn [client bufnr]
                              (let [map (fn [mode key func]
                                          (vim.keymap.set mode key func
                                            {:noremap true :silent true :buffer bufnr}))]
                                ;; LSP Navigation & Info
                                (map :n :K vim.lsp.buf.hover)
                                (map :n :gd vim.lsp.buf.definition)
                                (map :n :<leader>ld vim.lsp.buf.declaration)
                                (map :n :<leader>lt vim.lsp.buf.type_definition)
                                (map :n :<leader>lh vim.lsp.buf.signature_help)
                                ;; LSP Actions & Formatting
                                (map :n :<leader>ln vim.lsp.buf.rename)
                                (map :n :<leader>la vim.lsp.buf.code_action)
                                (map :v :<leader>la vim.lsp.buf.code_action)
                                (map :n :<leader>lf (fn [] (vim.lsp.buf.format {:async true})))
                                ;; Diagnostics
                                (map :n :<leader>le vim.diagnostic.open_float)
                                (map :n :<leader>lq vim.diagnostic.setloclist)
                                (map :n :<leader>lj vim.diagnostic.goto_next)
                                (map :n :<leader>lk vim.diagnostic.goto_prev)
                                (map :n "[d" vim.diagnostic.goto_prev)
                                (map :n "]d" vim.diagnostic.goto_next)
                                ;; Telescope Integration
                                (let [telescope (require :telescope.builtin)]
                                  (map :n :<leader>lw telescope.diagnostics)
                                  (map :n :<leader>lr telescope.lsp_references)
                                  (map :n :<leader>li telescope.lsp_implementations))))

                  ;; --- 2. Shared setup options ---
                  capabilities (cmplsp.default_capabilities)
                  handlers {"textDocument/hover" (vim.lsp.with vim.lsp.handlers.hover {:border "single"})
                            "textDocument/signatureHelp" (vim.lsp.with vim.lsp.handlers.signature_help {:border "single"})}
                  servers [:pylsp :clojure_lsp :clangd :html :tailwindcss :ts_ls :markdown_oxide]]

              ;; --- 3. Diagnostic signs and global config ---
              (vim.diagnostic.config {:virtual_text false :underline true :update_in_insert true :severity_sort true})
              (vim.fn.sign_define "DiagnosticSignError" {:text "" :texthl "DiagnosticSignError"})
              (vim.fn.sign_define "DiagnosticSignWarn"  {:text "" :texthl "DiagnosticSignWarn"})
              (vim.fn.sign_define "DiagnosticSignInfo"  {:text "" :texthl "DiagnosticSignInfo"})
              (vim.fn.sign_define "DiagnosticSignHint"  {:text "" :texthl "DiagnosticSignHint"})

              ;; --- 4. Setup loop for all servers ---
              (each [_ server-name (ipairs servers)]
                (let [server-config (. lsp server-name)]
                  (server-config.setup {:on_attach on_attach :capabilities capabilities :handlers handlers})))

              ;; --- 5. Apply server-specific settings AFTER the loop ---
              (lsp.pylsp.setup {:settings {:pylsp {:plugins {:pycodestyle {:ignore ["W391" "W293" "E302"] :maxLineLength 150}}}}})
              (lsp.clojure_lsp.setup
                {:before_init (fn [params] (set params.workDoneToken :1))
                 :root_dir (fn [pattern]
                             (let [util (require :lspconfig.util)
                                   fallback (vim.loop.cwd)
                                   patterns [:project.clj :deps.edn :build.boot :shadow-cljs.edn :.git :bb.edn]
                                   root ((util.root_pattern patterns) pattern)]
                               (or root fallback)))})
              (lsp.html.setup {:configurationSection ["html" "css" "javascript"] :embeddedLanguages {:css true :javascript true :hugo true} :provideFormatter true})
              (lsp.tailwindcss.setup {:filetypes ["aspnetcorerazor" "astro" "astro-markdown" "blade" "clojure" "django-html" "htmldjango" "edge" "eelixir" "elixir" "ejs" "erb" "eruby" "gohtml" "gohtmltmpl" "haml" "handlebars" "hbs" "html" "htmlangular" "html-eex" "heex" "jade" "leaf" "liquid" "markdown" "mdx" "mustache" "njk" "nunjucks" "php" "razor" "slim" "twig" "css" "less" "postcss" "sass" "scss" "stylus" "sugarss" "javascript" "javascriptreact" "reason" "rescript" "typescript" "typescriptreact" "vue" "svelte" "templ"]})
              (lsp.ts_ls.setup {:filetypes ["javascript" "typescript" "vue" "javascriptreact" "javascript.jsx" "typescriptreact" "typescript.tsx"]}))) }]
