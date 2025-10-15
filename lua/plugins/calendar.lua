-- [nfnl] fnl/plugins/calendar.fnl
local function _1_()
  vim.g.calendar_google_calendar = 1
  vim.g.calendar_google_task = 1
  local credentials_path = (vim.fn.expand("~") .. "/.cache/calendar.vim/credentials.vim")
  if (1 == vim.fn.filereadable(credentials_path)) then
    return vim.cmd(("source " .. credentials_path))
  else
    return nil
  end
end
return {{"itchyny/calendar.vim", cmd = {"Calendar", "CalendarTUI", "CalendarFloating"}, config = _1_}}
