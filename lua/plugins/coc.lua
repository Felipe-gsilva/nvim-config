-- [nfnl] fnl/plugins/coc.fnl
local function _1_()
  return vim.cmd("let g:coc_filetype_map = {'tex': 'latex', 'markdown': 'markdown'}")
end
return {{"neoclide/coc.nvim", branch = "release", cmd = {"CocAction", "CocCommand", "CocInstall", "CocConfig", "CocList"}, dependencies = {}, build = "npm install", config = _1_}}
