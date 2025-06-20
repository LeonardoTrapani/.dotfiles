# Leonardo Trapani's Dotfiles

This repository contains a fully automated, reproducible setup for my Arch Linux development environment using `stow`, `pacman`, and `yay`.

It includes:

- Shell configuration (Zsh, Starship, plugins)
- Editor setups (Neovim)
- Window manager (Hyprland)
- Tmux, Git, and more
- Automated package installation
- Auto-symlinking of dotfiles

---

## 💠 How It Works

### 🔗 Dotfile Management via `stow`

All configuration files are organized into folders inside this repo (e.g. `zsh/`, `nvim/`, `git/`). Each folder mirrors the structure of `$HOME`.

GNU Stow is used to symlink everything automatically into place. No manual copying or clutter.

Example:

```bash
~/.dotfiles/zsh/.zshrc -> ~/.zshrc
~/.dotfiles/git/.config/git/config -> ~/.config/git/config
````

### 📦 Package Management via `pacman` and `yay`

* `pacman-packages.txt` contains **official Arch packages**
* `aur-packages.txt` contains **AUR packages**

These are used to automatically install all needed packages on a new machine.

---

## ⚙️ Setup

```bash
git clone https://github.com/leonardotrapani/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x setup.sh
./setup.sh
```

What this does:

* Installs all listed packages (`pacman` + `yay`)
* Symlinks all dotfiles with `stow`
* Sets Zsh as your default shell (if it isn’t already)

---

## 🔄 Updating Installed Package Lists

When you install or remove packages, you can regenerate your package list like this:

```bash
# Export official packages
pacman -Qqen > ~/.dotfiles/pacman-packages.txt

# Export AUR packages
pacman -Qqem > ~/.dotfiles/aur-packages.txt
```

Commit the changes to keep your setup reproducible on any system.

---

## 📦 Adding a New Dotfile

1. Create a new folder inside `.dotfiles` (e.g. `nvim/`, `alacritty/`, `hypr/`)
2. Inside it, mirror the desired path (e.g. `.config/nvim/init.lua`)
3. Run `./setup.sh` — it will auto-detect and stow everything

---

## 🩼 Requirements

* Arch Linux (or derivative)
* `yay` AUR helper (must be installed manually the first time)
* Git, Bash, GNU Stow

--- 

Made with 🧠 by Leonardo Trapani
