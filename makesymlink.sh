#!/bin/bash
#
# Author: Christian Hofmann 
#
# This scipt create symlinks for each file under dotfiles
############################

########## Variables

DIR=~/workspace/dotfiles                    # dotfiles directory
OLDDIR=/tmp/dotfiles_old             # old dotfiles backup directory
FILES="bashrc vimrc vim"    # list of files/folders to symlink in homedir

##########

# create dotfiles backup
echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

for file in $FILES; do
    echo "Moving any existing dotfiles from ~ to $OLDDIR"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $DIR/$file ~/.$file
done
