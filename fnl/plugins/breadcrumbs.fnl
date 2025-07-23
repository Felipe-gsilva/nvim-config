[{1 :rebelot/heirline.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :config (fn []
            (let [heirline (require :heirline)
                  devicons (require :nvim-web-devicons)]
              (local FileIcon
                {:provider (fn []
                             (let [filename (vim.fn.expand "%:t")]
                               (if (= filename "")
                                 " "
                                 (let [icon (devicons.get_icon filename)]
                                   (if icon
                                     (.. icon " ")
                                     " ")))))})
              (local RelativeFileBreadcrumbs
                {:provider (fn []
                             (let [path (vim.fn.expand "%:.")]
                               (if (= path "")
                                 "[No Name]"
                                 (path:gsub "/" " > "))))})
              (heirline.setup {:winbar [FileIcon RelativeFileBreadcrumbs]})))}]
