#!/bin/bash
#
# Author: Christian Hofmann 
#
# This scipt create symlinks for each file under dotfiles
############################

########## Variables

DIR=~/workspace/dotfiles                    # dotfiles directory
OLDDIR=~/dotfiles_old             # old dotfiles backup directory
FILES="bashrc vimrc vim xprofile Xinitrc"    # list of files/folders to symlink in homedir
CONFIGDIR="awesome"

##########

# create dotfiles backup
echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

echo "Creating .config"
mkdir -p ~/.config
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

for file in $FILES; do
    echo "Moving $file dotfiles from ~ to $OLDDIR"
    mv ~/.$file $OLDDIR
    echo "Creating symlink to $file in home directory."
    ln -s $DIR/$file ~/.$file
done

# Create Symlinks for ~/.config folder
for folder in $CONFIGDIR; do
  echo "Moving $folder existing configfolders into $OLDDIR"
  mv ~/.config/$folder $OLDDIR
  echo "Creating symlink to $folder in home directory."
  ln -s $DIR/config/$folder ~/.config/$folder
done
