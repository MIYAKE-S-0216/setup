#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PATH_TO_DOT_VIM="$SCRIPT_DIR"/.vim
PATH_TO_VIMRC="$SCRIPT_DIR"/.vimrc
PATH_TO_PLUGIN="$PATH_TO_DOT_VIM"/plugin

#echo "$SCRIPT_DIR"
#echo "$PATH_TO_DOT_VIM"

sudo apt install vim-gtk3 -y
sudo apt install global -y
sudo apt install silversearcher-ag -y
sudo apt install fzf -y
#sudo apt install -y nodejs npm

rm -rf ~/.cache/dein
rm ~/.vimrc
sh -c "$(wget -O- https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"

rm -rf ~/.vim
rm ~/.vimrc
ln -s "$PATH_TO_DOT_VIM" ~/.vim
ln -s "$PATH_TO_VIMRC" ~/.vimrc
mkdir -p "$PATH_TO_PLUGIN"
ln -s /usr/share/vim/addons/plugin/gtags.vim "$PATH_TO_PLUGIN"/gtags.vim
