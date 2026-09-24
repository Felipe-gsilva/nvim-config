# Neovim Configuration TODOs

## High Priority Enhancements

### Git Integration
- [X] Add gitsigns.nvim for inline git information
  - Inline blame
  - File changes in sign column
  - Stage/unstage hunks
- [X] Add vim-fugitive for git commands
  - Branch management
  - Commit interface
  - Merge conflict resolution

### UI Improvements
- [X] Add nvim-colorizer.lua for color highlighting
- [X] Add indent-blankline.nvim for indent guides & scope highlighting

### Navigation & Motion Enhancements
- [X] Install harpoon for quick file switching
- [X] Add aerial.nvim for code outline/symbol navigation
- [X] Add flash.nvim for high-speed motions and treesitter selection
- [X] Add telescope-fzf-native.nvim for fast C-based fuzzy matching

## Medium Priority Features

### Editing & Delimiters
- [X] Add nvim-surround for fast delimiter manipulation
- [X] Add conform.nvim for asynchronous formatting (Prettier, Biome, Stylua, Black, Latexindent)

### Terminal Integration
- [ ] Terminal integration (Using tmux via vim-tmux-navigator; toggleterm intentionally omitted)

### Testing Support
- [X] Set up neotest framework
  - [X] Configure test runners (neotest-jest)
  - [X] Add test result visualization & summary panel

### Project Management & Diagnostics
- [ ] Add project.nvim
- [X] Install todo-comments.nvim
- [X] Add trouble.nvim for diagnostics & problem management

## Future Considerations

### Documentation & Note Taking
- [X] In-buffer Markdown & LaTeX rendering (render-markdown.nvim + nabla.nvim)
- [X] LaTeX continuous compilation & SyncTeX with Zathura (vimtex)

### Quality of Life
- [X] Add highlight on yank and centered navigation keymaps
- [X] Add session management (persistence.nvim)
- [ ] Add more snippets for common patterns
- [ ] Improve startup time
- [ ] Create custom statusline

## Maintenance
- [X] Document all custom keybindings and advanced cheatsheet
- [ ] Regular plugin updates
- [ ] Configuration cleanup