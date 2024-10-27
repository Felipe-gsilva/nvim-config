[{1 :rcarriga/nvim-dap-ui
 :dependencies [:mfussenegger/nvim-dap
                :nvim-neotest/nvim-nio]
 :branch "master"
 :config (fn []
           (local dap (require :dap))
           (local dapui (require :dapui))

           ;; Configure GDB adapter
           (set dap.adapters.gdb
                {:type "executable"
                 :command "gdb"
                 :args ["-i" "dap"]})

           ;; Configure UI layout
           (dapui.setup
             {:layouts
              [{:elements [:scopes :breakpoints :stacks :watches]
                :size 40
                :position "left"}
               {:elements [:repl :console]
                :size 0.25
                :position "bottom"}]

              ;; Configure floating window elements
              :floating {:max_height 800;; These can be integers or nil
                         :max_width 600;; Floats will be treated as percentage of screen
                         :border "single"  ;; Border style: 'single', 'double', 'rounded'
                         :mappings {:close "<ESC>"}}

              ;; Configure what UI elements show in windows
              :windows {:indent 2}

              ;; Controls & elements render settings
              :controls {:enabled true}
              :element_mappings {}
              :expand_lines true
              :force_buffers true
              :render {:indent 2
                       :max_value_lines 100}})

           ;; Integrate DAP events with UI
           (set dap.listeners.after.event_initialized.dapui_config [(dapui.open)])

           (set dap.listeners.before.event_terminated.dapui_config [(dapui.close)])

           (set dap.listeners.before.event_exited.dapui_config [(dapui.close)])

           ;; Keymaps for UI control
           (vim.keymap.set :n "<leader>dui" ":lua require'dapui'.toggle()<CR>" 
                           {:silent true :noremap true :desc "Toggle DAP UI"})

           (vim.keymap.set :n "<leader>dh" ":lua require'dap.ui.widgets'.hover()<CR>"
                           {:silent true :noremap true :desc "DAP Hover"})

           (vim.keymap.set :n "<leader>dp" ":lua require'dap.ui.widgets'.preview()<CR>"
                           {:silent true :noremap true :desc "DAP Preview"})

           (vim.keymap.set :n "<leader>df" 
                           #(let [widgets (require :dap.ui.widgets)]
                              (widgets.centered_float (widgets.frames)))
                           {:silent true :noremap true :desc "DAP Frames"})

           (vim.keymap.set :n "<leader>ds" 
                           #(let [widgets (require :dap.ui.widgets)]
                              (widgets.centered_float (widgets.scopes)))
                           {:silent true :noremap true :desc "DAP Scopes"})

           ;; C/C++ configurations
           (set dap.configurations.c
                [{:name "Launch"
                  :type "gdb"
                  :request "launch"
                  :program (fn []
                             (vim.fn.input "Path to executable: "
                                           (.. (vim.fn.getcwd) "/")
                                           "file"))
                  :cwd "${workspaceFolder}"
                  :stopAtBeginningOfMainSubprogram false}

                 {:name "Select and attach to process"
                  :type "gdb"
                  :request "attach"
                  :program (fn []
                             (vim.fn.input "Path to executable: "
                                           (.. (vim.fn.getcwd) "/")
                                           "file"))
                  :pid (fn []
                         (let [name (vim.fn.input "Executable name (filter): ")]
                           ((. (require "dap.utils") :pick_process) {:filter name})))
                  :cwd "${workspaceFolder}"}

                 {:name "Attach to gdbserver :1234"
                  :type "gdb"
                  :request "attach"
                  :target "localhost:1234"
                  :program (fn []
                             (vim.fn.input "Path to executable: "
                                           (.. (vim.fn.getcwd) "/")
                                           "file"))
                  :cwd "${workspaceFolder}"}])

;; Debug keymaps
(vim.keymap.set :n "<F5>" ":lua require'dap'.continue()<CR>" {:silent true :noremap true})
(vim.keymap.set :n "<F1>" ":lua require'dap'.step_into()<CR>" {:silent true :noremap true})
(vim.keymap.set :n "<F2>" ":lua require'dap'.step_over()<CR>" {:silent true :noremap true})
(vim.keymap.set :n "<F3>" ":lua require'dap'.step_out()<CR>" {:silent true :noremap true})
(vim.keymap.set :n "<leader>b" ":lua require'dap'.toggle_breakpoint()<CR>" {:silent true :noremap true})
(vim.keymap.set :n "<leader>B" 
                ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" 
                {:silent true :noremap true})
(vim.keymap.set :n "<leader>dr" ":lua require'dap'.repl.open()<CR>" {:silent true :noremap true}))}]
