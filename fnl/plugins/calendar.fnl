[{1 :itchyny/calendar.vim
  :cmd [:Calendar :CalendarTUI :CalendarFloating]
  :config (fn []
            (set vim.g.calendar_google_calendar 1)
            (set vim.g.calendar_google_task 1)
            (let [credentials-path (.. (vim.fn.expand "~") "/.cache/calendar.vim/credentials.vim")]
              (when (= 1 (vim.fn.filereadable credentials_path))
               (vim.cmd (.. "source " credentials_path)))))}]
