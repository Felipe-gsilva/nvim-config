-- [nfnl] Compiled from fnl/plugins/image.fnl by https://github.com/Olical/nfnl, do not edit.
package.path = (package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua")
package.path = (package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua")
local function _1_()
  local image = require("image")
  local function _2_(document_path, image_path, fallback)
  end
  return image.setup({backend = "kitty", integrations = {markdown = {enabled = true, download_remote_images = true, filetypes = {"markdown", "vimwiki"}, ["resolve-image-path"] = _2_, clear_in_insert_mode = false, only_render_image_at_cursor = false}}})
end
return {{"3rd/image.nvim", config = _1_}}
