# ⚙️ Dotfiles for Linux Managed by Stow

Welcome to my **dotfiles** repository! These configuration files are managed using **GNU Stow**, making it easy to maintain and organize configurations across different applications and environments on Linux.

---

## 📁 Repository Structure

This repo contains dotfiles for various applications and tools, all stored in their respective directories under `.config`. Below is a breakdown of the key configurations included:


## 📦 Installation and Setup

To use these dotfiles on your Linux machine, you can clone the repository and use **GNU Stow** to symlink the configuration files to your home directory. Follow the steps below:

### 1. Clone the Repository
```bash
git clone https://github.com/souravkhan12/.dotfiles.git
cd .dotfiles
```

## 2. Install GNU Stow
If you don’t have **Stow** installed, you can do so with the following command:

```bash
sudo apt install stow   # For Ubuntu/Debian-based systems
sudo pacman -S stow     # For Arch-based systems
```

### Usage
stow alacritty
stow i3
stow nvim
