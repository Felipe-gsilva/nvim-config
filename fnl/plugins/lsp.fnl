;symbols to show for lsp diagnostics
(fn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn  {:text "" :texthl warn})
    (vim.fn.sign_define info  {:text "" :texthl info})
    (vim.fn.sign_define hint  {:text "" :texthl hint})))

(define-signs "Diagnostic")

[{1 :neovim/nvim-lspconfig
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  handlers {"textDocument/publishDiagnostics"
                            (vim.lsp.with
                              vim.lsp.diagnostic.on_publish_diagnostics
                              {:severity_sort true
                               :update_in_insert true
                               :underline true
                               :virtual_text false})
                            "textDocument/hover"
                            (vim.lsp.with
                              vim.lsp.handlers.hover
                              {:border "single"})
                            "textDocument/signatureHelp"
                            (vim.lsp.with
                              vim.lsp.handlers.signature_help
                              {:border "single"})}
                  capabilities (cmplsp.default_capabilities)
                  before_init (fn [params]
                                (set params.workDoneToken :1))
                  on_attach (fn [client bufnr]
                              (do
                                (vim.api.nvim_buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :v :<leader>la "<cmd>lua vim.lsp.buf.range_code_action()<CR> " {:noremap true})
                                ;telescope
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').diagnostics()<cr>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))]

              ;; To add support to more language servers check:
              ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

              ;; Python
              (lsp.pylsp.setup {:on_attach on_attach
                                :capabilities capabilities
                                :settings {:pylsp {:pycodestyle {:ignore ["W391"]
                                                                 :maxLineLength 100}}}
                                 })
              ;; Clojure
              (lsp.clojure_lsp.setup {:on_attach on_attach
                                      :handlers handlers
                                      :before_init before_init
                                      :capabilities capabilities
                                      ; uses fallback when navigating inside dependency jar
                                      :root_dir (fn [pattern]
                                                  (let [util (require :lspconfig.util)
                                                        fallback (vim.loop.cwd)
                                                        patterns [:project.clj :deps.edn :build.boot :shadow-cljs.edn :.git :bb.edn]
                                                        root ((util.root_pattern patterns) pattern)]
                                                    (or root fallback)))})
              ;; C/C++
              (lsp.clangd.setup {:on_attach on_attach
                                 :capabilities capabilities
                                 })

              (lsp.html.setup {:on_attach on_attach
                               :capabilities capabilities

                               :configurationSection [ "html" "css" "javascript" ]
                               :embeddedLanguages { :css  true
                                                   :javascript  true
                                                   :hugo true }
                               :provideFormatter true})
              (lsp.tailwindcss.setup {:on_attach on_attach
                                      :capabilities capabilities
                                      :filetypes [ "aspnetcorerazor" "astro" "astro-markdown" "blade" "clojure" "django-html" "htmldjango" "edge" "eelixir" "elixir" "ejs" "erb" "eruby" "gohtml" "gohtmltmpl" "haml" "handlebars" "hbs" "html" "htmlangular" "html-eex" "heex" "jade" "leaf" "liquid" "markdown" "mdx" "mustache" "njk" "nunjucks" "php" "razor" "slim" "twig" "css" "less" "postcss" "sass" "scss" "stylus" "sugarss" "javascript" "javascriptreact" "reason" "rescript" "typescript" "typescriptreact" "vue" "svelte" "templ" ]
                                      })

              ;; JS/TS
              (lsp.ts_ls.setup {:on_attach on_attach
                                :capabilities capabilities
                                :filetypes  ["javascript"
                                             "typescript"
                                             "vue"
                                             "javascript"
                                             "javascriptreact"
                                             "javascript.jsx"
                                             "typescript"
                                             "typescriptreact"
                                             "typescript.tsx"]})
              
              ;; Markdown
              (lsp.markdown_oxide.setup {:on_attach on_attach 
                                         :capabilities capabilities})
              ))}]
