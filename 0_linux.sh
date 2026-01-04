#!/bin/sh

CONFIG_DIR=~/.config
# Old times backups
# BACKUP="nvim awesome alacritty git helix sway"
BACKUP="alacritty helix hypr waybar swaync"
BACKUPROOT=".rizinrc .zshrc .tmux.conf"

install_files() {
  # Backup files that are in .config
  for dir in ${BACKUP}; do
    if [ -e "${CONFIG_DIR}/${dir}" ]; then
      mv "${CONFIG_DIR}/${dir}" "${CONFIG_DIR}/${dir}.old"
    fi
    cp -r "${dir}" "${CONFIG_DIR}/${dir}"
  done
  # Backup files that are in ~/.*
  for f in ${BACKUPROOT}; do
    if [ -e "${HOME}/${f}" ]; then
      mv "${HOME}/${f}" "${HOME}/${f}.old"
    fi
    cp "${f}" "${HOME}/${f}"
  done
}

backup_files() {
  # Save files that are in .config
  for dir in ${BACKUP}; do
    cp -r "${CONFIG_DIR}/${dir}" ./
  done
  # Save files that are in ~/.*
  for f in ${BACKUPROOT}; do
    cp -r "${HOME}/$f" ./
  done
}

if [[ "$1" = "install" ]]; then
  install_files
else
  backup_files
fi

