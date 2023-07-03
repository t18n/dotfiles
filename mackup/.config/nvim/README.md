# My NVIM

This configuration is based on the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Inspirations
https://github.com/alpha2phi/modern-neovim/tree/268234975df52ef79237d248ad52a69590660e11/lua/plugins

## Tools
- Mason: Used to manage linters, formatters, servers, etc.
- Telescope: Used to search files, buffers, etc.
- Leap: Used to jump between files, buffers, etc.
- Mini-animate: Used to animate the cursor when jumping between files, buffers, etc.

## Keybindings

### General
- `Leader cm`: Open Mason
- `Leader uC`: Change theme
- `Leader sh`: Bring up help menu
- `Leader sk`: Search keymap keybindings menu
- `Shift ;`: Open command line
- `Leader xx`: Toggle diagnostics
- `Leader e`: Open file explorer
- `Leader sx`: Resume last Telescope picker
- `Leader sB`: File browser

### Editor
- `Leader ul`: Toggle relative line numbers

### Windows
- `Leader |`, `Leader -`: Split windows vertically/horizontally
- `Ctrl up/down/left/right`: Resize windows
- `Ctrl h/j/k/l`: Move between windows

### Find
- `Leader ff`: Find file
- `Leader fb`: Find active buffer

### Buffers
- `[ b`: Previous buffer
- `] b`: Next buffer
- `Leader bp`: Pin a buffer
- `Leader bP`: Delete non-pinned buffers

### Search
- `Leader sG`: Grep/search text across files
- `Leader sr`: Search and replace text across files
  - `Leader R`: Replace all
  - `Leader rc`: Replace current


### Explorer
- `Shift .`: Toggle between **Explorer**, **Buffer** and **Git status**

### Code
- `Leader ca`: Toggle code actions
- `Leader cf`: Format document
- `Leader cr`: Rename symbol
- `Shift k`: Show documentation
- `Shift s`: Activate Leap
- `Alt h/j/k/l`: Move lines around

### Git
- `Leader gg`: Bring up lazygit

### Terminal 
- `Leader ft`: Toggle float terminal

### More
See [default keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)
