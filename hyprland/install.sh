#!/usr/bin/env bash
# Link Hypr stack from this repo into ~/.config (absolute symlinks).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
TARGET="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$TARGET"

names=(hypr waybar mako foot rofi environment.d xdg-desktop-portal)

for name in "${names[@]}"; do
  src="$ROOT/.config/$name"
  dst="$TARGET/$name"
  if [[ ! -d "$src" ]]; then
    echo "skip (missing in repo): $name" >&2
    continue
  fi
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "backing up existing directory: $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "linked $dst -> $src"
done
