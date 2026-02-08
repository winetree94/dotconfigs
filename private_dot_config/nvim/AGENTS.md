# AGENTS.md - Neovim Configuration

## Project Overview

This is a personal Neovim configuration written entirely in Lua, targeting Neovim 0.11+.
It uses **mini.deps** (from `echasnovski/mini.nvim`) as the plugin manager and heavily
leverages the mini.nvim ecosystem for UI, editing, and navigation.

## Directory Structure

```
init.lua                    # Entry point: bootstraps mini.deps, loads config + plugins
lua/
  config/
    options.lua             # Base Neovim options (tabs, search, UI) and keymaps
  plugins/
    completion.lua          # mini.completion setup
    git.lua                 # mini.diff (git diff signs)
    lsp.lua                 # nvim-lspconfig + vim.lsp.enable()
    mason.lua               # mason.nvim + mason-tool-installer
    mini.lua                # mini.icons, statusline, tabline, notify, files, pick, extra, clue
    neovim.lua              # lazydev.nvim (Neovim Lua dev assistance)
    netrw.lua               # Built-in netrw file explorer config
    theme.lua               # tokyonight.nvim colorscheme
after/
  lsp/
    lua_ls.lua              # Per-server LSP config overrides (Neovim 0.11+ convention)
```

## Build / Lint / Test Commands

This is a Neovim config, not a traditional project. There is no Makefile, test suite, or
build system. Validation is done by loading Neovim and checking for errors.

### Validate config loads without errors

```bash
nvim --headless -c 'qall'
```

### Format Lua files with StyLua

```bash
# Note: config file is named .stylelua.toml (non-standard), must be specified explicitly
stylua --config-path .stylelua.toml .
# Format a single file
stylua --config-path .stylelua.toml lua/plugins/mini.lua
```

### Lint Lua files with luacheck

```bash
luacheck lua/ init.lua
# Single file
luacheck lua/plugins/lsp.lua
```

### Check LSP diagnostics

```bash
nvim --headless -c 'lua vim.lsp.enable("lua_ls")' -c 'sleep 3' -c 'lua vim.diagnostic.get()' -c 'qall'
```

### Install tools via Mason (from within Neovim)

```vim
:MasonToolsInstall
:MasonToolsUpdate
```

Managed tools: `lua-language-server`, `vim-language-server`, `stylua`, `luacheck`,
`typescript-language-server`, `biome`.

## Code Style Guidelines

### Language and Runtime

- **Language:** Lua (LuaJIT runtime)
- **Target:** Neovim 0.11+ (uses `vim.lsp.enable()` and `after/lsp/` convention)

### Formatting

- **Indentation:** 2 spaces (no tabs)
- **Formatter:** StyLua (config in `.stylelua.toml`)
- **Line width:** Default (120, StyLua default since no `column_width` is specified)

### Strings and Quotes

- **Use single quotes** (`'`) for all Lua strings consistently
- Double quotes are only used for Neovim option values set via `opt` (e.g., `opt.signcolumn = "yes"`)
  and for `source` fields in `MiniDeps.add()` when the value contains a URL or slash

### Imports and Module Loading

- Plugin files are loaded via `require()` for **side effects** -- they do NOT return a module table
- `init.lua` dynamically scans `lua/plugins/*.lua` and requires each file
- Use `MiniDeps.add()` to declare plugin dependencies
- Use `MiniDeps.now()` for UI-critical plugins that must load immediately
- Use `MiniDeps.later()` for plugins that can be deferred
- Destructure MiniDeps at the top of a file when using multiple functions:
  ```lua
  local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
  ```
- For simple plugin files that only use `add`, call `MiniDeps.add()` directly without destructuring

### Naming Conventions

- **File names:** Lowercase, short descriptive names (`lsp.lua`, `git.lua`, `theme.lua`)
- **Variables:** `snake_case` for locals and parameters
- **Neovim globals:** Access via `vim.` namespace (`vim.opt`, `vim.g`, `vim.keymap`, `vim.api`, etc.)
- **Mini globals:** Mini plugins expose globals like `MiniDeps`, `MiniIcons`, `MiniFiles`, `MiniPick`

### Keymaps

- Use `vim.keymap.set()` with the `desc` field for all keymaps (enables discoverability via mini.clue)
- Leader key is `<Space>`
- Group related keymaps with prefixes:
  - `<Leader>f` -- find/search operations
  - `<Leader>g` -- git operations
  - `<Leader>e` -- file explorer (netrw)
  - `<Leader>m` -- file explorer (mini.files)

### Plugin File Pattern

Each file in `lua/plugins/` follows this pattern:

```lua
-- Optional: destructure MiniDeps helpers
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Declare plugin dependency
MiniDeps.add({
  source = 'author/plugin-name'
})

-- For deferred plugins, wrap setup in later()
later(function()
  require('plugin-name').setup({
    -- configuration
  })
  -- Keymaps related to this plugin
  vim.keymap.set('n', '<Leader>x', some_function, { desc = 'Description' })
end)
```

For simple plugins with no configuration, the file can be minimal:

```lua
MiniDeps.add({ source = 'author/plugin-name' })
```

### Comments

- Use `--` for single-line comments
- Add section headers as comments to organize groups (e.g., `-- Tab/Indent`, `-- UI`, `-- Search`)
- Keep comments concise and descriptive

### Error Handling

- No explicit error handling patterns are used -- Neovim's built-in error reporting surfaces issues
- Plugin bootstrapping (in `init.lua`) uses `vim.fn.system()` without error checking; failures
  are visible at startup via Neovim messages

### Options Configuration

- Access Neovim options via `vim.opt` aliased to a local `opt`:
  ```lua
  local opt = vim.opt
  opt.expandtab = true
  ```
- Set global variables via `vim.g` (e.g., `vim.g.mapleader = ' '`)
- Group related options with section comments

### LSP Configuration

- LSP servers are declared in `lua/plugins/lsp.lua` via `vim.lsp.enable()`
- Per-server configuration goes in `after/lsp/<server_name>.lua` (Neovim 0.11+ convention)
- Server config files return a table with `settings`, `cmd`, etc.
- Mason handles installation of LSP servers and tools

## Configuration Files

| File | Purpose |
|------|---------|
| `.stylelua.toml` | StyLua formatter config (non-standard name, requires `--config-path`) |
| `.luarc.json` | Lua Language Server config (runtime, diagnostics, workspace) |

## Known Issues

- `.stylelua.toml` uses a non-standard filename. StyLua will not auto-discover it.
  Standard names are `stylua.toml` or `.stylua.toml`. Always pass `--config-path .stylelua.toml`
  when running StyLua.
- `MiniDeps` is used as a global variable but is not listed in `.luarc.json` diagnostics globals
  (only `vim` is listed). This may cause lua_ls warnings. Consider adding `"MiniDeps"` to the
  globals list.
