#!/bin/bash
set -e

function info() {
	echo "${*}" >&2
}

if [ ! -f bashrc ]
then
	echo "Something is wrong. Where is bashrc?"
	exit 1
fi

if [[ `hostname` == i44* ]]
then
	EMAIL="zwinkau@kit.edu"
else
	EMAIL="qznc@web.de"
fi

# install dot-rc files and directories
for file in bashrc bash_profile vimrc vim gdbinit gitignore tmux.conf muttrc
do
	info "symlinking ${file}"
	ln -sf `pwd`/${file} ~/.${file}
done

# install git config
cp -f `pwd`/gitconfig ~/.gitconfig
git config --global user.email ${EMAIL}
info "installed gitconfig"

# install .config files
for dir in config/*
do
	mkdir -p ~/.$dir
	for file in $dir/*
	do
		ln -sf `pwd`/$file ~/.$dir/
		info "symlinking $file"
	done
done
