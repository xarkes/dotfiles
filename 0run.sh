#!/bin/sh

CONF_DIR=~/.config
BACKUP="nvim awesome termite alacritty"

if [[ "$1" = "install" ]]; then
  for dir in ${BACKUP}; do
    if [ -d ${CONF_DIR}/${dir} ]; then
      mv ${CONF_DIR}/${dir} ${CONF_DIR}/${dir}.old
    fi
    cp -r ${dir} ${CONFIG_DIR}/${dir}
  done
else
  for dir in ${BACKUP}; do
    cp -r ${CONF_DIR}/${dir} ./
  done
fi

