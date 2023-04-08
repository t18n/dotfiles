# My Dotfiles backup

- [My Dotfiles backup](#my-dotfiles-backup)
  - [Introduction](#introduction)
    - [Security](#security)
  - [Getting started](#getting-started)
    - [First steps](#first-steps)
    - [More steps](#more-steps)
  - [Manage backup](#manage-backup)
    - [Manage apps to sync or unsync](#manage-apps-to-sync-or-unsync)
    - [Add apps to backup](#add-apps-to-backup)
    - [Restore your application settings on a newly installed workstation.](#restore-your-application-settings-on-a-newly-installed-workstation)
    - [Backup configurations from machine](#backup-configurations-from-machine)
    - [Uninstall mackup](#uninstall-mackup)
  - [Git Submodules](#git-submodules)
    - [Add a new submodule/package](#add-a-new-submodulepackage)
    - [Update/pull all submodules](#updatepull-all-submodules)
  - [My toolkit](#my-toolkit)
    - [Irreplacable tools](#irreplacable-tools)
    - [My Daily Drivers](#my-daily-drivers)
    - [Other tools I like](#other-tools-i-like)
      - [Runtime manager](#runtime-manager)
      - [Version controls](#version-controls)
      - [Fetcher](#fetcher)
      - [Editor](#editor)
      - [Package manager](#package-manager)
      - [Terminal](#terminal)
      - [Shell](#shell)
      - [Other](#other)

## Introduction

My dotfiles backup that ultilizes [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and [Mackup](https://github.com/lra/mackup). I recommend to read up the tools to understand how they work.

> NOTE: Please read the instruction very carefully before you run any command, script on your _existing_ environment. I highly recommend to take the parts you use only and not `restore` everything on your computer, since a lot of these tools are configured spefically for my needs. 🌹

> NOTE: VSCode provide a sync feature which is much more sophisticated than dotfiles, so it is not used here.
>
> NOTE: Applications that doesn't store configuration files in `$HOME` or `$HOME/.config` are generally not included here.

### Security

The [mackup configuration](mackup/.mackup.cfg) consist of only `[applications_to_sync]` section to specifically limit what to sync. This avoid syncing any redundant files or files that includes sensitive information that you don't want to share.

## Getting started

### First steps

1. Clone the repo `git clone git@github.com:turbothinh/dotfiles.git ~/dotfiles`
2. Navigate into the folder `cd  ~/dotfiles`
3. Pull all submodules `git submodule update --init --recursive`
4. Run bootstrap script `~/dotfiles/scripts/bootstrap-mac.sh`

### More steps

1. Set ZSH as a main shell: `chsh -s $(which zsh)`
2. Install runtimes: `rtx install`

## Manage backup

You can find the main mackup configuration [here](mackup/.mackup.cfg).

### Manage apps to sync or unsync

When you look into `mackup/.mackup` folder, you will see only the [my-dotfiles.cfg](mackup/.mackup/my-dotfiles.cfg) file. This is because I would like to have full control of what files I am backing up. I would recommend you to do the same.

To manage what app to sync, edit `mackup/.mackup.cfg`.

### Add apps to backup

I you want convenience, there are a bunch of supported applications. All supported applications can be found [here](https://github.com/lra/mackup/tree/master/mackup/applications).

In case an application is not supported, you can add a `*.cfg` file to `./.mackup` folder.
Then update `mackup/.mackup.cfg`.

### Restore your application settings on a newly installed workstation.

Run `mackup restore`

### Backup configurations from machine

Run `mackup restore`

### Uninstall mackup

Run `mackup uninstall`

## Git Submodules

Sometimes, a library might not be available as a installable package (zplug, tmux-url-select, etc.), or it is just a repo that consist of data (cowsay, fortunes, etc.), we use git `submodule` to download the packages as well as keeping them up-to-date.

### Add a new submodule/package

Run `git submodule add https://github.com/new_plugin.git mackup/packages/new_plugin`

### Update/pull all submodules

Run `git submodule update --init --recursive`

## My toolkit

Below are the main applications that I use, some of them are not included in this repo backup but I would love to share with you.

A lot of these tools are free thanks to the wonderful open-source contributors. If you love the tools, please consider to donate to appreciate their efforts.

### Irreplacable tools

- [Git](https://git-scm.com/): Distributed version control system

### My Daily Drivers

- [Kitty](https://sw.kovidgoyal.net/kitty/): Fast and feature-rich terminal emulator
- [Zellij](https://github.com/zellij-org/zellij): A terminal workspace with batteries included
- [Navi](https://github.com/denisidoro/navi): Interactive cheatsheet viewer for the command line
- [RTX](https://github.com/jdxcode/rtx): Runtime Executor (asdf rust clone)
- [Colima](https://github.com/abiosoft/colima): Container runtimes on macOS (and Linux) with minimal setup
- [VSCode](https://github.com/microsoft/vscode): Amazing code editor
- [Brave Browser](https://github.com/brave/brave-browser): Chromium-based privacy focus browser

### Other tools I like

#### Runtime manager

- [ASDF](https://github.com/asdf-vm/asdf): Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more

#### Version controls

- [Git branchless](https://github.com/arxanas/git-branchless): High-velocity, monorepo-scale workflow for Git

#### Fetcher

- [Curl](https://github.com/curl/curl): A command line tool and library for transferring data with URL syntax

#### Editor

- [Nvim](https://neovim.io/): Vim-based text editor with better defaults and plugins
- [Emacs](https://www.gnu.org/software/emacs/): Customizable and extensible text editor

#### Package manager

- [Pip](https://pip.pypa.io/en/stable/): Package installer for Python
- [Composer](https://getcomposer.org/): Dependency manager for PHP
- [Brew](https://brew.sh/): Package manager for macOS
- [Cargo](https://github.com/rust-lang/cargo): The Rust package manager
- [Npm](https://github.com/npm/cli): the package manager for JavaScript
- [Rubygems](https://github.com/rubygems/rubygems/tree/master/bundler): Bundler makes sure Ruby applications run the same code on every machine.

#### Terminal

- Apple Terminal - The default terminal emulator for macOS
- [Alacritty](https://github.com/alacritty/alacritty): GPU-accelerated terminal emulator for macOS
- [Tmux](https://github.com/tmux/tmux): Terminal multiplexer that allows multiple terminal sessions to be accessed simultaneously in a single window
- [Powerline](https://github.com/powerline/powerline): Statusline plugin for vim, and provides statuslines for several other applications

#### Shell

- [NuShell](https://github.com/nushell/nushell): A new type of shell that combines the traditional Unix shell features with modern languages and modern data structures
- [OMF](https://github.com/oh-my-fish/oh-my-fish): Framework for managing fish shell configuration

#### Other

- [Flameshot](https://flameshot.org/): Powerful screenshot tool for Linux
- [Mackup](https://github.com/lra/mackup): Backup dotfiles
- [Alfred](https://www.alfredapp.com/): Launcher and productivity tool for macOS
- [Calibre](https://calibre-ebook.com/): Open-source eBook management software
- [Btop](https://github.com/aristocratos/btop): Task manager
- [Htop](https://hisham.hm/htop/): Interactive process viewer for macOS
- [GIMP](https://www.gimp.org/): Open-source image editor
- [HSTR](https://github.com/dvorka/hstr): Shell history suggest box
- [Insomnia](https://insomnia.rest/): Cross-platform REST client for API development
- [Cheat](https://github.com/cheat/cheat): Cheat sheet creator and manager for the command line
- [Neofetch](https://github.com/dylanaraps/neofetch): Command-line system information tool
- [Onefetch](https://github.com/o2sh/onefetch): Command-line Git information tool
- [Pandoc](https://pandoc.org/): Universal document converter
- [Ripgrep](https://github.com/BurntSushi/ripgrep): Line-oriented search tool for terminal
- [Rclone](https://rclone.org/): Command-line program for syncing files and directories to and from cloud storage
- [Thefuck](https://github.com/nvbn/thefuck): Automatic correction of errors in previous console commands
- [Bat](https://github.com/sharkdp/bat): Syntax highlighting for `cat` command
- [Xbar](https://github.com/matryer/xbar): Put the output from any script or program into your macOS Menu Bar
- [Tere](https://github.com/mgunyho/tere): a faster alternative to cd + ls
- [Mprocs](https://github.com/pvolok/mprocs): Run multiple commands in parallel
