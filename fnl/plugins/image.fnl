;; Add LuaRocks paths to package.path
(set package.path 
  (.. package.path 
      ";" 
      (vim.fn.expand "$HOME") 
      "/.luarocks/share/lua/5.1/?/init.lua"))

(set package.path 
  (.. package.path 
      ";" 
      (vim.fn.expand "$HOME") 
      "/.luarocks/share/lua/5.1/?.lua"))

[{1 :3rd/image.nvim
  :config (fn [] 
           (let [image (require "image")]
             (image.setup {:backend "kitty"
                           :integrations 
                           {:markdown {:enabled true
                                      :clear_in_insert_mode false
                                      :download_remote_images  true
                                      :only_render_image_at_cursor  false
                                      :filetypes [ "markdown" "vimwiki" ]
                                      :resolve-image-path (fn [document-path image-path fallback])}}})))}]

;; TODO make image be rendered fgs
