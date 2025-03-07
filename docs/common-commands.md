# Fennel Common Commands and Shortcuts

## REPL Commands
- `,h` - Show help menu
- `,q` - Quit REPL
- `,r` - Reload current module
- `,d` - Show documentation for symbol
- `,v` - Show version info

## In-Editor Commands (with Neovim)
- `<localleader>e` - Evaluate current form
- `<localleader>E` - Evaluate entire file
- `<localleader>r` - Reload current module
- `gd` - Go to definition
- `K` - Show documentation

## Common Functions
- `(doc symbol)` - Display documentation
- `(help)` - Show help information
- `(require module-name)` - Import a module
- `(import-macros {names} module)` - Import macros
- `(local name value)` - Define local variable
- `(global name value)` - Define global variable

## Special Forms
- `(fn [args] body)` - Define function
- `(λ [args] body)` - Alternative function syntax
- `(let [bindings] body)` - Create local bindings
- `(do expr*)` - Group multiple expressions
- `(if condition then else)` - Conditional branching
- `(when condition body)` - Single-branch conditional

## Macro Commands
- `(macros)` - List all available macros
- `(macrodebug form)` - Show macro expansion

# Neovim Fennel Configuration Shortcuts

## LSP Commands
- `gd` - Go to definition
- `K` - Show hover documentation
- `<leader>ld` - Go to declaration
- `<leader>lt` - Go to type definition
- `<leader>lh` - Show signature help
- `<leader>ln` - Rename symbol
- `<leader>le` - Show diagnostics float
- `<leader>lq` - Set location list
- `<leader>lf` - Format code
- `<leader>lj` - Go to next diagnostic
- `<leader>lk` - Go to previous diagnostic
- `<leader>la` - Code action (normal mode)
- `<leader>la` - Range code action (visual mode)
- `<leader>lw` - Show workspace diagnostics (Telescope)
- `<leader>lr` - Show references (Telescope)
- `<leader>li` - Show implementations (Telescope)

## Telescope
- `<C-p>` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - List buffers
- `<leader>fh` - Help tags

## File Explorer (Neo-tree)
- `<leader>ff` - Toggle file explorer

## Conjure (REPL Integration)
- `K` - Show documentation for word
- `<leader>ef` - Evaluate file
- `<leader>eb` - Evaluate buffer
- `<leader>er` - Evaluate current form
- `<leader>sv` - Open log in vertical split

## Debug Adapter Protocol (DAP)
- `<F5>` - Continue
- `<F1>` - Step into
- `<F2>` - Step over
- `<F3>` - Step out
- `<leader>b` - Toggle breakpoint
- `<leader>B` - Set conditional breakpoint
- `<leader>dr` - Open REPL
- `<leader>dui` - Toggle DAP UI
- `<leader>dh` - DAP hover
- `<leader>dp` - DAP preview
- `<leader>df` - Show frames
- `<leader>ds` - Show scopes

## Other Tools
- `<leader>u` - Toggle Undotree

## Completion (nvim-cmp)
- `<C-b>` - Select previous item
- `<C-n>` - Select next item
- `<C-bb>` - Scroll docs up
- `<C-f>` - Scroll docs down
- `<C-Space>` - Complete
- `<C-e>` - Close completion
- `<CR>` - Confirm completion
- `<Tab>` - Next item/expand snippet
- `<S-Tab>` - Previous item

## Harpoon
- `<leader>a` - adds a buffer into harpoon list
- `<C-w>` - opens first harpoon buffer
- `<C-e>` - opens second harpoon buffer until `<C-t>`
- `<C-q>` - opens the list
