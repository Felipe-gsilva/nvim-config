# My Personal Neovim Configuration

A fast, keyboard-driven Neovim configuration built with **Fennel** (compiled to Lua via `nfnl`) and managed by **lazy.nvim**. 

Designed for interactive programming (Lisp/Clojure/Fennel), systems and application development, technical writing (Markdown & LaTeX), and fluid navigation.

## Workflow & Documentation

For a complete reference of shortcuts, plugin commands, and workflows organized by category, refer to the **[Guia Completo de Comandos (cheatsheet.md)](./docs/cheatsheet.md)**.

## Highlights

* **Lisp-Powered Architecture:** Configured in [Fennel](https://fennel-lang.org/) for expressive, declarative dotfiles. Compiled into pure static Lua files using [nfnl](https://github.com/Olical/nfnl) so Neovim bootstraps with zero overhead on any machine.
* **Modern Completion & LSP:** Powered by [blink.cmp](https://github.com/Saghen/blink.cmp) for fast fuzzy-matching, full LSP integration via `nvim-lspconfig` and Mason, plus rich diagnostics with [trouble.nvim](https://github.com/folke/trouble.nvim).
* **Interactive Evaluation:** Seamless REPL workflow powered by [Conjure](https://github.com/Olical/conjure) for Fennel, Clojure, and Common Lisp.
* **Debugging (DAP):** Integrated step-debugging and UI via [nvim-dap](https://github.com/mfussenegger/nvim-dap) and [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui).
* **Fast Navigation & Motion:** Ultra-fast on-screen jumping with [flash.nvim](https://github.com/folke/flash.nvim), symbol outline with [aerial.nvim](https://github.com/stevearc/aerial.nvim), file pinning with [Harpoon 2](https://github.com/ThePrimeagen/harpoon), and [tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) pane integration.
* **Technical Writing & Math:** Real-time in-buffer markdown rendering with [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim), inline ASCII/Unicode math previews with [nabla.nvim](https://github.com/jbyuki/nabla.nvim), and bidirectional LaTeX SyncTeX compilation with [VimTeX](https://github.com/lervag/vimtex) and Zathura.

---

## Installation

Clone this repository into your Neovim configuration directory:

```bash
git clone https://github.com/Felipe-gsilva/nvim-config.git ~/.config/nvim
```

On first launch, `lazy.nvim` will automatically clone itself and install all pinned plugins.

### Prerequisites (Recommended)
* **Neovim** 0.10+ (tested on 0.12+)
* **Git**, **curl**, **gcc/clang**, and `make` (for Tree-sitter parsers and native C binaries)
* **Ripgrep** (`rg`) and **fd** (for fast Telescope searches)
* **Zathura** and `latexmk` (optional, for LaTeX live preview and SyncTeX)

---



### Compiling Fennel changes
When editing files in `fnl/` inside Neovim, `nfnl` compiles them to `lua/` automatically on save (`:w`). To compile all files at once:

```vim
:lua require("nfnl.api")["compile-all-files"]()
```

Or from the command line:

```bash
nvim --headless "+lua require('nfnl.api')['compile-all-files']()" +qa
```

---

## Related
* Complete personal dotfiles: [Felipe-gsilva/dotfiles](https://github.com/Felipe-gsilva/dotfiles)
