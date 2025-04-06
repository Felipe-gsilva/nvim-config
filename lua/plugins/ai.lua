-- [nfnl] Compiled from fnl/plugins/ai.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local copilot = require("copilot")
  local function _2_()
    return vim.fs.dirname(vim.fs.find(".git", {upward = true})[1])
  end
  local function _3_(_, _0)
    if not vim.bo.buflisted then
      logger.debug("not attaching, buffer is not 'buflisted'")
      return false
    else
      if (vim.bo.buftype ~= "") then
        logger.debug("not attaching, buffer 'buftype' is ", vim.bo.buftype)
        return false
      else
        return true
      end
    end
  end
  return __fnl_global___2esetup(copilot, {panel = {enabled = true, keymap = {jump_prev = "[[", jump_next = "]]", accept = "<CR>", refresh = "gr", open = "<M-CR>"}, layout = {position = "bottom", ratio = 0.4}, auto_refresh = false}, suggestion = {enabled = true, hide_during_completion = true, debounce = 75, trigger_on_accept = true, keymap = {accept = "<M-l>", next = "<M-]>", prev = "<M-[>", dismiss = "<C-]>", accept_line = false, accept_word = false}, auto_trigger = false}, filetypes = {["."] = false, cvs = false, gitcommit = false, gitrebase = false, help = false, hgcommit = false, markdown = false, svn = false, yaml = false}, auth_provider_url = nil, logger = {file_log_level = vim.log.levels.OFF, print_log_level = vim.log.levels.WARN, trace_lsp = "off", log_lsp_messages = false, trace_lsp_progress = false}, copilot_node_command = "node", workspace_folders = {}, copilot_model = "", root_dir = _2_, should_attach = _3_, server = {type = "nodejs", custom_server_filepath = nil}, server_opts_overrides = {}})
end
return {{"zbirenbaum/copilot.lua", setup = _1_}}
