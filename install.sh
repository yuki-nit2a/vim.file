#!/usr/bin/env bash

set -eu

readonly INSTALL_TO=$1
readonly DOTFILE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)/

ln -s "${DOTFILE_DIR}.vimrc" "${INSTALL_TO}.vimrc"
ln -s "${DOTFILE_DIR}.gvimrc" "${INSTALL_TO}.gvimrc"

mkdir -p "${INSTALL_TO}.vim.var"
cp -r "${DOTFILE_DIR}skeleton/.vim.var/" "${INSTALL_TO}"

git clone 'https://github.com/Shougo/neobundle.vim.git' "${INSTALL_TO}.vim.var/plugin/neobundle.vim"
