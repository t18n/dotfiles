# My Dotfiles backup

- [My Dotfiles backup](#my-dotfiles-backup)
  - [Introduction](#introduction)
    - [Security](#security)
  - [Getting started](#getting-started)
    - [First steps](#first-steps)
    - [Back up changes](#back-up-changes)
  - [My toolkit](#my-toolkit)
  - [Project structure](#project-structure)
    - [Maintenance](#maintenance)
  - [Manage backup](#manage-backup)
    - [Manage apps to sync or unsync](#manage-apps-to-sync-or-unsync)
    - [Add apps to backup](#add-apps-to-backup)
  - [Git Submodules](#git-submodules)
  - [👀 Keeping an eye on](#-keeping-an-eye-on)

## Introduction

My dotfiles backup that ultilizes [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and [Mackup](https://github.com/lra/mackup). I recommend to read up the tools to understand how they work.

> NOTE: Please read the instruction very carefully before you run any command, script on your _existing_ environment. I highly recommend to take the parts you use only and not `restore` everything on your computer, since a lot of these tools are configured spefically for my needs.

> **SERIOUSLY! [Fork this](https://github.com/turboninh/dotfiles/fork), remove stuff you don't use and make it your own.**

> NOTE: VSCode provide a sync feature which is much more sophisticated than dotfiles, so it is not used here.

> NOTE: Applications that doesn't store configuration files in `$HOME` or `$HOME/.config` are generally not included here.

### Security

The [mackup configuration](mackup/.mackup.cfg) consist of only `[applications_to_sync]` section to specifically limit what to sync. This avoid syncing any redundant files or files that includes sensitive information that you don't want to share.

## Getting started

### First steps

1. Clone the repo `git clone git@github.com:turboninh/dotfiles.git ~/dotfiles && cd  ~/dotfiles`
2. Pull all submodules `git submodule update --init --recursive`
3. Choose your path
   1. _Clean PC_: Run bootstrap script `~/dotfiles/scripts/bootstrap-mac.sh`
   2. _Running PC_: `mackup backup`
4. Set ZSH as a main shell: `chsh -s $(which zsh)`

### Back up changes

Backup script is intentionally set up to run manually, which allow me to review changes before push, since this is a public repo. If you are interested in the automated script, checkout the `feat/with-automated-backup` branch for the `automate-backup.sh` script. Following is the manual flow:

1. Go to the directory `cd ~/dotfiles`
2. Run backup script `~/dotfiles/scripts/backup.sh`
3. Review changes and push commit

## My toolkit

Below are the main applications that I use, some of them are not included in this repo backup but I would love to share with you.

A lot of these tools are free thanks to the wonderful open-source contributors. If you love the tools, please consider to donate to appreciate their efforts.

- [Git](https://git-scm.com/): Distributed version control system
- [Kitty](https://sw.kovidgoyal.net/kitty/): Fast and feature-rich terminal emulator
- [Zellij](https://github.com/zellij-org/zellij): A terminal workspace with batteries included
- [Navi](https://github.com/denisidoro/navi): Interactive cheatsheet viewer for the command line
- [RTX](https://github.com/jdxcode/rtx): Runtime Executor (asdf rust clone)
- [Colima](https://github.com/abiosoft/colima): Container runtimes on macOS (and Linux) with minimal setup
- [Nvim](https://github.com/neovim/neovim): Amazing modal code editor
- [Brave Browser](https://github.com/brave/brave-browser): Chromium-based privacy focus browser

More tools can be found in [tools I use](./docs/tools-I-use.md)

## Project structure

Following diagram explains the main purpose of the repo structure

```sh
.
├── mackup                          # Backup files = $HOME
│   ├── .config                     # Backup files = $HOME/.config
│   └── .mackup                     # Folder for all backup apps config
│       ├── my-dotfiles.cfg         # Configuration for what files to backup
│   ├── packages                    # A folder that consists of all packages that are managed through `git submodules`
│   ├── .mackup.cfg                 # Mackup configuration file
├── package_dump                    # A folder that consist of all globally installed packages dump files
├── scripts:                        # All available scripts
│   ├── backup.sh:                  # Script to run backup, dump files
│   ├── bootstrap-mac.sh            # Script to bootstrap a new computer
│   └── sync-packages.sh            # Script tp install all dump packages from package_dump
├── CHANGELOG.md                    # Manual changelog I use to journal my stack changes over time
└── README.md                       # Main documentation
```

### Maintenance

## Manage backup

You can find the main mackup configuration [here](mackup/.mackup.cfg).

### Manage apps to sync or unsync

When you look into `mackup/.mackup` folder, you will see only the [my-dotfiles.cfg](mackup/.mackup/my-dotfiles.cfg) file. This is because I would like to have full control of what files I am backing up. I would recommend you to do the same.

To manage what app to sync, edit `mackup/.mackup.cfg`.

### Add apps to backup

I you want convenience, there are a bunch of supported applications. All supported applications can be found [here](https://github.com/lra/mackup/tree/master/mackup/applications).

In case an application is not supported, you can add a `*.cfg` file to `./.mackup` folder.
Then update `mackup/.mackup.cfg`.

- `mackup restore`: Restore your application settings on a newly installed workstation
- `mackup restore`: Backup configurations from machine
- `mackup uninstall`: Revert mackup-modified files

## Git Submodules

Sometimes, a library might not be available as a installable package, or it is just a repo that consist of data (cowsay, fortunes, etc.), we use git `submodule` to download the packages as well as keeping them up-to-date.

- `git submodule add https://github.com/new_plugin.git mackup/packages/new_plugin`: Add a new submodule/package
- `git submodule update --init --recursive`: Update/pull all submodules

## 👀 Keeping an eye on

- [NuShell](https://github.com/nushell/nushell): A new type of shell that combines the traditional Unix shell features with modern languages and modern data structures
  - Start time too slow
  - May need to use `rust-coreutils` for POSIX-compliant
- [Helix](https://helix-editor.com/): A post-modern modal text editor.
  - Plugin echo-system
