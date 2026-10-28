#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
backup_dir="${HOME}/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

backup_if_present() {
  local target="$1"
  local relative="${target#"${HOME}/"}"

  if [[ -e "$target" || -L "$target" ]]; then
    mkdir -p "${backup_dir}/$(dirname -- "$relative")"
    mv "$target" "${backup_dir}/${relative}"
  fi
}

install_item() {
  local source="$1"
  local target="$2"

  backup_if_present "$target"
  mkdir -p "$(dirname -- "$target")"
  ln -s "$source" "$target"
}

install_item "${repo_dir}/config/caelestia/cli.json" "${HOME}/.config/caelestia/cli.json"
install_item "${repo_dir}/config/caelestia/hypr-user.lua" "${HOME}/.config/caelestia/hypr-user.lua"
install_item "${repo_dir}/config/caelestia/hypr-vars.lua" "${HOME}/.config/caelestia/hypr-vars.lua"
install_item "${repo_dir}/config/caelestia/shell.json" "${HOME}/.config/caelestia/shell.json"
install_item "${repo_dir}/config/caelestia/user-config.fish" "${HOME}/.config/caelestia/user-config.fish"
install_item "${repo_dir}/config/fish/config.fish" "${HOME}/.config/fish/config.fish"
install_item "${repo_dir}/config/fish/fish_plugins" "${HOME}/.config/fish/fish_plugins"
install_item "${repo_dir}/config/fish/functions/fish_greeting.fish" "${HOME}/.config/fish/functions/fish_greeting.fish"
install_item "${repo_dir}/config/foot" "${HOME}/.config/foot"
install_item "${repo_dir}/config/nvim" "${HOME}/.config/nvim"
install_item "${repo_dir}/config/fastfetch" "${HOME}/.config/fastfetch"
install_item "${repo_dir}/config/starship.toml" "${HOME}/.config/starship.toml"
install_item "${repo_dir}/gitconfig" "${HOME}/.gitconfig"
install_item "${repo_dir}/wallpapers/IMG_7745.JPEG" "${HOME}/Pictures/Wallpapers/IMG_7745.JPEG"

caelestia wallpaper -f "${HOME}/Pictures/Wallpapers/IMG_7745.JPEG"

if [[ -d "$backup_dir" ]]; then
  printf 'Previous files were backed up to: %s\n' "$backup_dir"
fi
printf 'Dotfiles and wallpaper installed. Run `caelestia install` first on a new Arch system.\n'
