#!/bin/bash
script_dir_path=$(
    cd "$(dirname "$0")"
    pwd
)
cat <<EOS

 DevBeno

 The elapsed time does not matter.
 Because speed is important.

EOS

#
# mac-auto-setup repository update
#
cd $script_dir_path
git checkout master
git pull origin master

#
# skwp/dotfiles repository update
#
cd ~/.yadr
git pull --rebase
rake update
cd $script_dir_path

#
# Homebrew update and upgrade
#
brew upgrade

#
# App Store app upgrade
#
mas upgrade

#
# Ruby plugin update for asdf
#
asdf plugin-update ruby
