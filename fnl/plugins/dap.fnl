[{1 :rcarriga/nvim-dap-ui
  :dependencies [:mfussenegger/nvim-dap
                 :nvim-neotest/nvim-nio]
  :branch "master"
  :keys [[:<F5> "<cmd>lua require('dap').continue()<cr>" {:desc "DAP Continue"}]
         [:<F1> "<cmd>lua require('dap').step_into()<cr>" {:desc "DAP Step Into"}]
         [:<F2> "<cmd>lua require('dap').step_over()<cr>" {:desc "DAP Step Over"}]
         [:<F3> "<cmd>lua require('dap').step_out()<cr>" {:desc "DAP Step Out"}]
         [:<leader>b "<cmd>lua require('dap').toggle_breakpoint()<cr>" {:desc "DAP Toggle Breakpoint"}]
         [:<leader>B #(.. "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>") 
          {:desc "DAP Conditional Breakpoint"}]
         [:<leader>dr "<cmd>lua require('dap').repl.open()<cr>" {:desc "DAP Open REPL"}]
         [:<leader>dui "<cmd>lua require('dapui').toggle()<cr>" {:desc "Toggle DAP UI"}]
         [:<leader>dh "<cmd>lua require('dap.ui.widgets').hover()<cr>" {:desc "DAP Hover"}]
         [:<leader>dp "<cmd>lua require('dap.ui.widgets').preview()<cr>" {:desc "DAP Preview"}]
         [:<leader>df #(let [widgets (require :dap.ui.widgets)]
                         (widgets.centered_float (widgets.frames)))
          {:desc "DAP Frames"}]
         [:<leader>ds #(let [widgets (require :dap.ui.widgets)]
                         (widgets.centered_float (widgets.scopes)))
          {:desc "DAP Scopes"}]]
  :config (fn []
            (local dap (require :dap))
            (local dapui (require :dapui))

            (set dap.adapters.gdb
                 {:type "executable"
                  :command "gdb"
                  :args ["-i" "dap"]})

            (dapui.setup
              {:layouts
               [{:elements [:scopes :breakpoints :stacks :watches]
                 :size 40
                 :position "left"}
                {:elements [:repl :console]
                 :size 0.25
                 :position "bottom"}]

               :floating {:max_height 800
                          :max_width 600
                          :border "single"
                          :mappings {:close "<ESC>"}}

               :windows {:indent 2}

               :controls {:enabled true}
               :element_mappings {}
               :expand_lines true
               :force_buffers true
               :render {:indent 2
                        :max_value_lines 100}})

            (set dap.listeners.after.event_initialized.dapui_config
                 [(fn [] (vim.schedule (fn [] (dapui.open))))])

            (set dap.listeners.before.event_terminated.dapui_config
                 [(fn [] (vim.schedule (fn [] (dapui.close))))])

            (set dap.listeners.before.event_exited.dapui_config
                 [(fn [] (vim.schedule (fn [] (dapui.close))))])

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
                   :cwd "${workspaceFolder}"}]))}]
