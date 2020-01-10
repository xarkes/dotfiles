#!/bin/sh

CONF_DIR=~/.config
BACKUP="nvim awesome termite alacritty picom git"
BACKUPROOT=".radare2rc .gitconfig"

install_files() {
  # Backup files that are in .config
  for dir in ${BACKUP}; do
    if [ -e "${CONF_DIR}/${dir}" ]; then
      mv "${CONF_DIR}/${dir}" "${CONF_DIR}/${dir}.old"
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
    cp -r "${CONF_DIR}/${dir}" ./
  done
  # Save files that are in ~/.*
  for f in ${BACKUPROOT}; do
    cp -r "${HOME}/$f" ./
  done

  # Don't backup wallpapers
  rm awesome/xarkes/*.{png,jpg}
}

if [[ "$1" = "install" ]]; then
  install_files
else
  backup_files
fi

