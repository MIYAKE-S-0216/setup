#!/usr/bin/bash

function package_upgrade() {
	echo ==========================
	echo Package upgrade 
	echo ==========================
	sudo apt update
	sudo apt upgrade -y
}

function locale_language_setup() {
	echo ==========================
	echo Locale / Language Setup
	echo ==========================
	sudo raspi-config nonint do_change_locale ja_JP.UTF-8
	sudo raspi-config nonint do_change_timezone Asia/Tokyo
	sudo apt install fcitx-mozc -y
}

function git_setup() {
	echo ==========================
	echo Git Setup
	echo ==========================
		read -p "Enter git user name (global): " username
		git config --global user.name "$username"
		read -p "Enter git user email (global): " useremail
		git config --global user.email "$useremail"
    git config --global core.editor vim
}

DIR_SSH_ID=~/.ssh/id_ed25519

function ssh_key_setup() {
	echo ==========================
	echo SSH key Setup
	echo ==========================
	if [ -f "$DIR_SSH_ID" ]; then
		echo "SSH key already exists."
	else
		ssh-keygen -t ed25519 -N "" -f "$DIR_SSH_ID"
	fi
	cat ~/.ssh/id_ed25519.pub
}

cd ~/

package_upgrade
locale_language_setup
git_setup
ssh_key_setup

