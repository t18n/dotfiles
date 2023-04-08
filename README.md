# My Dotfiles backup

- [My Dotfiles backup](#my-dotfiles-backup)
  - [Introduction](#introduction)
    - [Security](#security)
  - [Getting started](#getting-started)
    - [First steps](#first-steps)
    - [More steps](#more-steps)
    - [Back up changes](#back-up-changes)
  - [My toolkit](#my-toolkit)
    - [Maintenance](#maintenance)
  - [Manage backup](#manage-backup)
    - [Manage apps to sync or unsync](#manage-apps-to-sync-or-unsync)
    - [Add apps to backup](#add-apps-to-backup)
  - [Git Submodules](#git-submodules)

## Introduction

My dotfiles backup that ultilizes [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and [Mackup](https://github.com/lra/mackup). I recommend to read up the tools to understand how they work.

> NOTE: Please read the instruction very carefully before you run any command, script on your _existing_ environment. I highly recommend to take the parts you use only and not `restore` everything on your computer, since a lot of these tools are configured spefically for my needs. 🌹

> NOTE: VSCode provide a sync feature which is much more sophisticated than dotfiles, so it is not used here.

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
- [VSCode](https://github.com/microsoft/vscode): Amazing code editor
- [Brave Browser](https://github.com/brave/brave-browser): Chromium-based privacy focus browser

More tools can be found in [tools I use](./docs/tools-I-use.md)

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

Sometimes, a library might not be available as a installable package (zplug, tmux-url-select, etc.), or it is just a repo that consist of data (cowsay, fortunes, etc.), we use git `submodule` to download the packages as well as keeping them up-to-date.

- `git submodule add https://github.com/new_plugin.git mackup/packages/new_plugin`: Add a new submodule/package
- `git submodule update --init --recursive`: Update/pull all submodules
