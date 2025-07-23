-- [nfnl] fnl/plugins/breadcrumbs.fnl
local function _1_()
  local heirline = require("heirline")
  local devicons = require("nvim-web-devicons")
  local FileIcon
  local function _2_()
    local filename = vim.fn.expand("%:t")
    if (filename == "") then
      return " "
    else
      local icon = devicons.get_icon(filename)
      if icon then
        return (icon .. " ")
      else
        return "\239\133\156 "
      end
    end
  end
  FileIcon = {provider = _2_}
  local RelativeFileBreadcrumbs
  local function _5_()
    local path = vim.fn.expand("%:.")
    if (path == "") then
      return "[No Name]"
    else
      return path:gsub("/", " > ")
    end
  end
  RelativeFileBreadcrumbs = {provider = _5_}
  return heirline.setup({winbar = {FileIcon, RelativeFileBreadcrumbs}})
end
return {{"rebelot/heirline.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_}}
